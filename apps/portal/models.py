from django.db import models

class AIPlatform(models.Model):
    name = models.CharField("平台名称", max_length=100, unique=True)
    url = models.URLField("访问链接")
    description = models.TextField("简介说明", max_length=200)
    visit_count = models.PositiveIntegerField("访问量", default=0)
    order = models.IntegerField("顺序", default=0)  # 新增字段
    created_at = models.DateTimeField("创建时间", auto_now_add=True)

    class Meta:
        verbose_name = "AI平台"
        verbose_name_plural = "AI平台管理"
        ordering = ['order']  # 默认按顺序排序

    def __str__(self):
        return self.name