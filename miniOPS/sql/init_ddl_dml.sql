CREATE TABLE t_menu (
  id SERIAL PRIMARY KEY COMMENT 'PK',
  pid INTEGER DEFAULT NULL COMMENT 'parent menu id',
  mname VARCHAR(50) NOT NULL COMMENT 'name for menu',
  cssname VARCHAR(50) NOT NULL COMMENT 'css display name',
  link VARCHAR(255) DEFAULT NULL COMMENT 'url link address',
  active INTEGER NOT NULL COMMENT '0:inactive,1:active',
  cdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'audit columns',
  edate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'audit columns',
  creator VARCHAR(50) NOT NULL DEFAULT 'admin' COMMENT 'audit columns',
  editor VARCHAR(50) NOT NULL DEFAULT 'admin' COMMENT 'audit columns'
);

COMMENT ON TABLE t_menu IS 'left menu link information';
COMMENT ON COLUMN t_menu.id IS 'PK';
COMMENT ON COLUMN t_menu.pid IS 'parent menu id';
COMMENT ON COLUMN t_menu.mname IS 'name for menu';
COMMENT ON COLUMN t_menu.cssname IS 'css display name';
COMMENT ON COLUMN t_menu.link IS 'url link address';
COMMENT ON COLUMN t_menu.active IS '0:inactive,1:active';
COMMENT ON COLUMN t_menu.cdate IS 'audit columns';
COMMENT ON COLUMN t_menu.edate IS 'audit columns';
COMMENT ON COLUMN t_menu.creator IS 'audit columns';
COMMENT ON COLUMN t_menu.editor IS 'audit columns';

CREATE INDEX idx_pid ON t_menu(pid);

CREATE TABLE t_role (
  id SERIAL PRIMARY KEY COMMENT 'PK',
  rname VARCHAR(50) NOT NULL COMMENT 'role name',
  active INTEGER NOT NULL COMMENT '0:inactive,1:active',
  cdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'audit columns',
  edate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'audit columns',
  creator VARCHAR(50) NOT NULL DEFAULT 'admin' COMMENT 'audit columns',
  editor VARCHAR(50) NOT NULL DEFAULT 'admin' COMMENT 'audit columns',
  main_url VARCHAR(255) NOT NULL COMMENT 'welcome web page'
);

COMMENT ON TABLE t_role IS 'role group information';
COMMENT ON COLUMN t_role.id IS 'PK';
COMMENT ON COLUMN t_role.rname IS 'role name';
COMMENT ON COLUMN t_role.active IS '0:inactive,1:active';
COMMENT ON COLUMN t_role.cdate IS 'audit columns';
COMMENT ON COLUMN t_role.edate IS 'audit columns';
COMMENT ON COLUMN t_role.creator IS 'audit columns';
COMMENT ON COLUMN t_role.editor IS 'audit columns';
COMMENT ON COLUMN t_role.main_url IS 'welcome web page';

CREATE TABLE t_role_menu (
  id SERIAL PRIMARY KEY COMMENT 'pk',
  rid INTEGER NOT NULL COMMENT 'role id',
  mid INTEGER NOT NULL COMMENT 'menu id',
  cdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'audit columns',
  edate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'audit columns',
  creator VARCHAR(50) NOT NULL DEFAULT 'admin' COMMENT 'audit columns',
  editor VARCHAR(50) NOT NULL DEFAULT 'admin' COMMENT 'audit columns'
);

COMMENT ON TABLE t_role_menu IS 'mapping table for role & menu';
COMMENT ON COLUMN t_role_menu.id IS 'pk';
COMMENT ON COLUMN t_role_menu.rid IS 'role id';
COMMENT ON COLUMN t_role_menu.mid IS 'menu id';
COMMENT ON COLUMN t_role_menu.cdate IS 'audit columns';
COMMENT ON COLUMN t_role_menu.edate IS 'audit columns';
COMMENT ON COLUMN t_role_menu.creator IS 'audit columns';
COMMENT ON COLUMN t_role_menu.editor IS 'audit columns';

CREATE INDEX idx_rid ON t_role_menu(rid);
CREATE INDEX idx_mid ON t_role_menu(mid);

CREATE TABLE t_user (
  id SERIAL PRIMARY KEY COMMENT 'PK',
  username VARCHAR(50) NOT NULL COMMENT 'logon name',
  password VARCHAR(50) NOT NULL COMMENT 'pwd',
  active INTEGER NOT NULL COMMENT '0:inactive, 1:active',
  id_role INTEGER DEFAULT NULL COMMENT 'role id',
  cdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'audit columns',
  edate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'audit columns',
  creator VARCHAR(50) NOT NULL DEFAULT 'admin' COMMENT 'audit columns',
  editor VARCHAR(50) NOT NULL DEFAULT 'admin' COMMENT 'audit columns'
);

COMMENT ON TABLE t_user IS 'login user information';
COMMENT ON COLUMN t_user.id IS 'PK';
COMMENT ON COLUMN t_user.username IS 'logon name';
COMMENT ON COLUMN t_user.password IS 'pwd';
COMMENT ON COLUMN t_user.active IS '0:inactive, 1:active';
COMMENT ON COLUMN t_user.id_role IS 'role id';
COMMENT ON COLUMN t_user.cdate IS 'audit columns';
COMMENT ON COLUMN t_user.edate IS 'audit columns';
COMMENT ON COLUMN t_user.creator IS 'audit columns';
COMMENT ON COLUMN t_user.editor IS 'audit columns';

CREATE INDEX idx_user_username ON t_user(username);
CREATE INDEX idx_id_role ON t_user(id_role);



INSERT INTO `t_user` VALUES (1,'admin','0192023a7bbd73250516f069df18b500',1,1,now(), now(),'admin','admin'),(2,'dev','c117720a1ebbb24a159b43dc440901c0',1,2,now(),now(),'admin','admin');

INSERT INTO `t_role` VALUES (1,'admin',1,now(),now(),'admin','admin','/monitor'),(2,'dev role',1,now(),now(),'admin','admin','/auth/welcome');

INSERT INTO `t_menu` VALUES (1,0,'监控大盘','menu_home','fa fa-area-chart',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');
INSERT INTO `t_menu` VALUES (2,0,'主机监控','menu_home',' fa fa-laptop',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');
INSERT INTO `t_menu` VALUES (3,0,'数据库日报监控','fa fa-database','',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');


INSERT INTO `t_menu` VALUES (11,1,'监控大盘监控动态图','fa fa-area-chart','',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');
INSERT INTO `t_menu` VALUES (21,2,'主机磁盘使用','fa fa-laptop','',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');
INSERT INTO `t_menu` VALUES (22,2,'主机日志错误','fa fa-laptop','',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');
INSERT INTO `t_menu` VALUES (31,3,'oracle日报监控','fa fa-database','',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');
INSERT INTO `t_menu` VALUES (32,3,'mysql日报监控','fa fa-database','',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');
INSERT INTO `t_menu` VALUES (33,3,'mongo日报监控','fa fa-database','',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');
INSERT INTO `t_menu` VALUES (34,3,'Postgres日报监控','fa fa-database','',1,'2022-05-12 17:49:38','2022-05-12 17:49:38','admin','admin');


INSERT INTO `t_role_menu` VALUES (1,1,1,'2022-05-12 17:49:44','2022-05-12 17:49:44','admin','admin');
INSERT INTO `t_role_menu` VALUES (2,1,2,'2022-05-12 17:49:44','2022-05-12 17:49:44','admin','admin');
INSERT INTO `t_role_menu` VALUES (3,1,3,'2022-05-12 17:49:44','2022-05-12 17:49:44','admin','admin');

INSERT INTO `t_role_menu` VALUES (4,2,3,'2022-05-12 17:49:44','2022-05-12 17:49:44','admin','admin');


SELECT T.id, T.meumname, T.cssname,
       STRING_AGG(CONCAT(T.submemu, '|', T.link), ',') AS submenu
FROM (
    SELECT tmp.id,
           tmp.pmane AS meumname,
           m_sub.mname AS submemu,
           m_sub.cssname AS cssname,
           m_sub.link AS link
    FROM (
        SELECT m.id,
               u.username,
               r.rname,
               m.mname AS pmane,
               m.cssname AS pcssname,
               m.link AS plink
        FROM t_menu m
        JOIN t_role_menu mr ON mr.mid = m.id
        JOIN t_role r ON mr.rid = r.id
        JOIN t_user u ON u.id_role = r.id
        WHERE u.username = 'admin'
          AND u.password = '0192023a7bbd73250516f069df18b500'
    ) tmp
    LEFT JOIN t_menu m_sub ON tmp.id = m_sub.pid
) T
GROUP BY T.id, T.meumname, T.cssname;


# 修改后的 PostgreSQL 配置
DIALECT = 'postgresql'
DRIVER = 'psycopg2'  # 或其他 PostgreSQL 驱动如 pg8000
USERNAME = 'app_ops'  # 你的 PostgreSQL 用户名
PASSWORD = 'admin123_abdD'  # 你的 PostgreSQL 密码
HOST = '192.168.55.180'  # PostgreSQL 服务器地址
PORT = '5432'  # PostgreSQL 默认端口
DATABASE = 'db_mini_ops'  # PostgreSQL 数据库名

# PostgreSQL 连接 URI
SQLALCHEMY_DATABASE_URI = '{}+{}://{}:{}@{}:{}/{}'.format(
    DIALECT, DRIVER, USERNAME, PASSWORD, HOST, PORT, DATABASE
)