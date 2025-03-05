from django.apps import AppConfig
from django_redis import get_redis_connection


class PortalConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'apps.portal'  # 修改为相对路径
    verbose_name = 'AI平台门户'

    def ready(self):
        # 网站应用服务重新启动时候运行
        self.sync_mysql_to_redis() # 把mysql数据库同步到redis中，确保网站重启时数据一致性

    def sync_mysql_to_redis(self):
        # 延迟导入模型
        from .models import AIPlatform
        # 获取 Redis 连接
        redis = get_redis_connection("default")
        # 从 MySQL 数据库中获取所有的 AIPlatform 对象
        platforms = AIPlatform.objects.all()
        for platform in platforms:
            # 构造 Redis 键
            redis_key = f'platform_visits:{platform.id}'
            # 将数据库中的访问量数据同步到 Redis 中
            redis.set(redis_key, platform.visit_count)