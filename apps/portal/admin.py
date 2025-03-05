from django.contrib import admin
from .models import AIPlatform

@admin.register(AIPlatform)
class AIPlatformAdmin(admin.ModelAdmin):
    list_display = ('name', 'url', 'visit_count', 'order', 'created_at')
    list_editable = ('order',)  # 允许管理员编辑顺序
    search_fields = ('name', 'description')
    list_filter = ('created_at',)
    fieldsets = (
        (None, {'fields': ('name', 'url', 'description')}),
        ('统计信息', {'fields': ('visit_count', 'order')}),
    )