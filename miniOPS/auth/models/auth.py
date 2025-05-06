from base.dbManger import db
from sqlalchemy import text


def authUserLogin(username,password):
    sql = """
select
m.id ,
u.username,
r.rname,
m.mname as pmane,
m.cssname as pcssname,
m.link as plink
from
t_menu m,
t_role r,
t_role_menu mr,
t_user u 
where u.username = '{}' and u.password = '{}' and u.id_role = r.id 
and mr.rid = r.id and  mr.mid = m.id;
    """.format(username,password)
    print(sql)
    userinfo = db.session.execute(text(sql))
    return list(userinfo)

def authUserLoginNew(username,password):
    sql = """
   select T.id, T.meumname, T.cssname,
 group_concat(concat(T.submemu,'|',T.link)) as submenu
       from (select tmp.id,
                      tmp.pmane     as meumname,
                      m_sub.mname   as submemu,
                      m_sub.cssname as cssname,
                      m_sub.link       link
               from (select m.id,
                            u.username,
                            r.rname,
                            m.mname   as pmane,
                            m.cssname as pcssname,
                            m.link    as plink
                     from t_menu m,
                          t_role r,
                          t_role_menu mr,
                          t_user u
                     where u.username = 'admin'
                       and u.password = '0192023a7bbd73250516f069df18b500'
                       and u.id_role = r.id
                       and mr.rid = r.id
                       and mr.mid = m.id) tmp
                        left join t_menu m_sub on tmp.id = m_sub.pid) T group by T.id, T.meumname, T.cssname;
        """.format(username, password)
    print(sql)
    userinfo = db.session.execute(text(sql))
    return list(userinfo)


def getWelcomePage(username):
    sql = """
    select r.main_url from t_role r , t_user u where u.username =  '{}' and u.id_role = r.id  ;
    """.format(username)
    print(sql)
    result = db.session.execute(sql)
    return list(result)[0][0]



