#menu_list = [{
#    'name': '菜单',
#    'content': 'MYSQL在线审核|/review,MONGO审核模板|/review/review_mongo'
#}]


# 转换函数
def transform_menu(menu_list):
    transformed = []
    for menu in menu_list:
        # 分割content字符串为子菜单项
        submenu_items = menu['submenuList'].split(',')

        # 处理每个子菜单项
        submenus = []
        for item in submenu_items:
            if '|' in item:
                name, link = item.split('|')
                submenus.append({'name': name.strip(), 'link': link.strip()})

        # 创建新的菜单结构
        new_menu = {
            'menu': menu['menu'],
            'cssname': menu['cssname'],
            'submenu': submenus
        }
        transformed.append(new_menu)

    return transformed


# 执行转换
#transformed_menu = transform_menu(menu_list)
#print(transformed_menu)

