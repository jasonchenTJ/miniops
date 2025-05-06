import pymysql



# 连接到 MySQL 数据库
conn = pymysql.connect(
    host="10.25.14.62",
    user="jason_chentj",
    password="1234_abdVCxx",
    database="mp_addr"
)

cursor = conn.cursor()

# 获取所有表的索引信息
cursor.execute("""
    SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME, NON_UNIQUE 
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = %s
    ORDER BY TABLE_NAME, INDEX_NAME, SEQ_IN_INDEX;
""", ("mp_addr",))

# 抽取索引并生成索引语句
current_table = None
indexes = {}

for row in cursor.fetchall():
    table_name, index_name, column_name, non_unique = row
    if table_name != current_table:
        current_table = table_name
        indexes[table_name] = {}

    if index_name not in indexes[table_name]:
        indexes[table_name][index_name] = {
            'columns': [],
            'unique': non_unique == 0
        }

    indexes[table_name][index_name]['columns'].append(column_name)

# 输出索引语句
for table, index_data in indexes.items():
    for index_name, data in index_data.items():
        unique_str = 'UNIQUE' if data['unique'] else 'INDEX'
        columns_str = ', '.join(data['columns'])
        print(f"CREATE {unique_str} INDEX {index_name} ON {table} ({columns_str});")

# 关闭连接
cursor.close()
conn.close()
