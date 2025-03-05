from config.celery import app
from django_redis import get_redis_connection
from .models import AIPlatform

@app.task
def sync_visits_to_db():
    redis = get_redis_connection("default")
    platforms = AIPlatform.objects.all()

    for platform in platforms:
        redis_key = f'platform_visits:{platform.id}'
        cached_visits = redis.get(redis_key)
        print(cached_visits)
        if cached_visits:
            platform.visit_count = int(cached_visits) # 把redis缓存同步回数据库
            print(platform.visit_count)
            platform.save()
