$(document).ready(function() {
    // 加载侧边栏和内容区域
    $("#sidebar-container").load("/auth/menu", function() {
        // 侧边栏加载完成后初始化相关功能
        initSidebar();
    });

    $("#content-container").load("/auth/content", function() {
        // 内容区域加载完成后可以初始化相关功能
    });

    // 初始化侧边栏功能
    function initSidebar() {
        // 切换菜单折叠状态
        $('.toggle-btn').click(function() {
            $('#sidebar-container').toggleClass('collapsed');
        });

        // 主菜单点击事件
        $('.menu-item').click(function(e) {
            e.stopPropagation();

            // 如果点击的是有子菜单的项
            if ($(this).hasClass('has-submenu')) {
                // 切换子菜单显示状态
                $(this).find('.submenu').toggleClass('show');
                // 切换箭头方向
                $(this).find('.menu-arrow').toggleClass('fa-angle-down fa-angle-up');

                // 如果不是折叠状态，则取消其他菜单的展开状态
                if (!$('#sidebar-container').hasClass('collapsed')) {
                    $('.menu-item').not(this).find('.submenu').removeClass('show');
                    $('.menu-item').not(this).find('.menu-arrow').removeClass('fa-angle-up').addClass('fa-angle-down');
                }
            } else {
                // 如果是没有子菜单的项，加载对应内容
                const target = $(this).data('target');
                loadContent(target);

                // 设置活动菜单项
                $('.menu-item, .submenu-item').removeClass('active');
                $(this).addClass('active');
            }
        });

        // 子菜单项点击事件
        $('.submenu-item').click(function(e) {
            e.stopPropagation();

            const target = $(this).data('target');
            loadContent(target);

            // 设置活动菜单项
            $('.menu-item, .submenu-item').removeClass('active');
            $(this).addClass('active');
            $(this).closest('.has-submenu').addClass('active');
        });
    }

    // 加载内容函数
    function loadContent(target) {
        // 这里应该是AJAX请求加载实际内容
        // 为了演示，我们只是模拟加载

        let title = '';
        let content = '';

        switch(target) {
            case 'dashboard':
                title = '控制面板';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">控制面板</h5><p class="card-text">这里是系统概览信息。</p></div></div>';
                break;
            case 'user-list':
                title = '用户列表';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">用户列表</h5><p class="card-text">显示所有用户的表格。</p></div></div>';
                break;
            case 'user-add':
                title = '添加用户';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">添加用户</h5><p class="card-text">添加新用户的表单。</p></div></div>';
                break;
            case 'user-roles':
                title = '角色管理';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">角色管理</h5><p class="card-text">管理系统用户角色和权限。</p></div></div>';
                break;
            case 'product-list':
                title = '产品列表';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">产品列表</h5><p class="card-text">显示所有产品的表格。</p></div></div>';
                break;
            case 'product-add':
                title = '添加产品';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">添加产品</h5><p class="card-text">添加新产品的表单。</p></div></div>';
                break;
            case 'product-category':
                title = '产品分类';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">产品分类</h5><p class="card-text">管理产品分类。</p></div></div>';
                break;
            case 'article-list':
                title = '文章列表';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">文章列表</h5><p class="card-text">显示所有文章的表格。</p></div></div>';
                break;
            case 'article-add':
                title = '添加文章';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">添加文章</h5><p class="card-text">添加新文章的表单。</p></div></div>';
                break;
            case 'article-category':
                title = '文章分类';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">文章分类</h5><p class="card-text">管理文章分类。</p></div></div>';
                break;
            case 'settings':
                title = '系统设置';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">系统设置</h5><p class="card-text">系统配置选项。</p></div></div>';
                break;
            default:
                title = '控制面板';
                content = '<div class="card"><div class="card-body"><h5 class="card-title">欢迎使用信息管理系统</h5><p class="card-text">请从左侧菜单选择要操作的功能。</p></div></div>';
        }

        // 更新页面标题和内容
        $('#page-title').text(title);
        $('#page-content').html(content);
    }
});
