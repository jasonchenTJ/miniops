###################mysql database setting#####################
DIALECT = 'mysql'
DRIVER = 'pymysql'
USERNAME = 'app_ops'
PASSWORD = 'admin123_abdD'
HOST = '192.168.55.180'
PORT = '3306'
DATABASE = 'db_mini_ops'
SQLALCHEMY_DATABASE_URI = '{}+{}://{}:{}@{}:{}/{}?charset=utf8mb4&autocommit=true'.format(
   DIALECT, DRIVER, USERNAME, PASSWORD, HOST, PORT, DATABASE
)
###################postgres database setting#####################


SQLALCHEMY_COMMIT_ON_TEARDOWN = True
SQLALCHEMY_TRACK_MODIFICATIONS = True
SQLALCHEMY_POOL_SIZE = 10
SQLALCHEMY_MAX_OVERFLOW = 5
##################session key#####################
SECRET_KEY = 'e4acedd4-c9ed-11ec-8ac0-dcf401d0a568'



