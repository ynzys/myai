document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM 已加载');  // 调试日志

    // 初始化拖拽功能
    const platformGrid = document.getElementById('cardContainer');
    new Sortable(platformGrid, {
        animation: 150,  // 拖拽动画时长
        handle: '.drag-handle',  // 拖拽手柄
        ghostClass: 'dragging',  // 拖拽时的占位样式
        onChoose: function(evt) {
            evt.item.style.opacity = '0.5';  // 拖拽时设置透明度
        },
        onUnchoose: function(evt) {
            evt.item.style.opacity = '1';  // 拖拽结束后恢复透明度
        },
        onEnd: function(evt) {
            console.log('拖拽结束，新位置:', evt.newIndex);  // 调试日志
        }
    });

    // 点击统计处理
    document.querySelectorAll('.visit-link').forEach(link => {
        link.addEventListener('click', function(e) {
            const platformId = this.dataset.platformId;
            console.log('点击事件触发，平台ID:', platformId);  // 调试日志

            // 发送统计请求
            fetch(`/track/${platformId}/`, {
                method: 'POST',
                headers: {
                    'X-CSRFToken': getCookie('csrftoken'),
                    'Content-Type': 'application/json'
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('请求失败: ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                console.log('请求成功，响应数据:', data);  // 调试日志
                const counter = this.closest('.platform-card').querySelector('.visit-count');
                counter.textContent = parseInt(counter.textContent) + 1;
                document.getElementById('totalVisits').textContent =
                    parseInt(document.getElementById('totalVisits').textContent) + 1;
            })
            .catch(error => {
                console.error('请求失败:', error);  // 调试日志
            });

            // 允许链接的默认行为（在新标签页打开）
            // 不需要调用 e.preventDefault()
        });
    });

    // CSRF令牌获取函数
    function getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let cookie of cookies) {
                cookie = cookie.trim();
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
});