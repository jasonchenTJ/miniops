from auth.views.authView import *



app = Flask(__name__)
app.register_blueprint(auth,url_prefix="/auth")

@app.route('/')  # 根路径就是默认首页
def index():
    return render_template('login.html')  # 返回首页模板





if __name__ == "__main__":
    app.config.from_object('settings')
    app.config['WTF_CSRF_METHODS'] = []
    app.secret_key = app.config.get('SECRET_KEY')
    db.init_app(app)
    app.app_context().push()
    app.run(host="0.0.0.0",port=5866)
