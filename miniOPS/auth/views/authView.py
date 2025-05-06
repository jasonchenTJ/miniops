from flask import Flask,render_template,redirect, url_for,request,session,current_app
from flask import Blueprint
from auth.models.auth import *
from tools.menuTransfor import *
import hashlib



auth=Blueprint('auth',__name__)
@auth.route('/',methods = ['POST', 'GET'])
def login():
    if request.method == 'POST':
        user_info = request.form.to_dict()
        print(user_info)
        hashonj = hashlib.md5()
        username = user_info.get("username")
        hashonj.update(user_info.get("password").encode("utf-8"))
        password = hashonj.hexdigest()
        menulist = authUserLoginNew(username,password)
        session['username'] = username

        if len(menulist) != 0:
            menu_list = [{
                'menu': item[1],
                'cssname': item[2],
                'submenuList' : item[3]
            } for item in menulist]
            menu = transform_menu(menu_list)
            print(menu)
            session['menu_list'] = menu
            return render_template('main.html')

    return render_template('login.html')

# Route for the login page
@auth.route('/menu', methods=['GET', 'POST'])
def initMenu():

    return render_template('menu.html',menulist =session.get("menu_list"))

# Route for the login page
@auth.route('/content', methods=['GET', 'POST'])
def initContent():
    return render_template('content.html');

@auth.route('/logoff',methods = ['POST', 'GET'])
def logoff():
    session.pop('username', None)
    session.pop('mainURL',None)
    return render_template('portal.html');