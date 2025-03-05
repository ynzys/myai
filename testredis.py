import os
import django
from django_redis import get_redis_connection

# 设置 Django 环境
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
django.setup()  # 初始化 Django

# 测试 Redis 连接
redis = get_redis_connection("default")
from apps.portal.tasks import sync_visits_to_db
sync_visits_to_db.delay()
