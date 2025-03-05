from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django_redis import get_redis_connection
from .models import AIPlatform


def home(request):
    platforms = AIPlatform.objects.all()
    redis = get_redis_connection("default")
    # 将 Redis 中的访问量合并到平台对象中
    for platform in platforms:
        redis_key = f'platform_visits:{platform.id}'
        cached_visits = redis.get(redis_key)
        platform.cached_visits = int(cached_visits) if cached_visits else platform.visit_count

    # 按缓存访问量降序，order 升序排序
    platforms = sorted(platforms, key=lambda x: (-x.cached_visits, x.order))

    # 计算总访问量
    total_visits = sum(platform.cached_visits for platform in platforms)

    return render(request, 'portal/home.html', {
        'platforms': platforms,
        'total_visits': total_visits
    })


@require_POST
def track_visit(request, platform_id):
    redis = get_redis_connection("default")
    redis_key = f'platform_visits:{platform_id}'
    redis.incr(redis_key)
    return JsonResponse({'status': 'success'})