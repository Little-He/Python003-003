#!/usr/bin/env python3
#-*- coding:utf8 -*-
# @TIME     :  8:04 下午
# @FILE     : class.py

import pandas as pd
import pymysql

mysql_conn = pymysql.connect(
    host='localhost',
    port=3306,
    user='root',
    password='123456',
    db='test',
)

# 1. SELECT * FROM maoyanmovie;
sql = 'SELECT * FROM maoyanmovie'
df = pd.read_sql(sql, mysql_conn)
#df["pdate"] = df["pdate"].astype(str).tolist()
# print(df)

# 2. SELECT * FROM maoyanmovie LIMIT 10;
df2 = df.loc[0: 9]
# print(df2)

# 3. SELECT name FROM maoyanmovie;  //name 是 maoyanmovie 表的特定一列
df3 = df['name']
# print(df3)

# 4. SELECT COUNT(id) FROM maoyanmovie;
df4 = df['id'].count()
# print(df4)

# 5. SELECT * FROM maoyanmovie WHERE id<5 AND pdate>'2020-01-01';
df5 = df[(df['id'] < 5) & (df['pdate'] > pd.to_datetime('2020-01-01'))]
#print(df5)
# print(pd.to_datetime('2020-01-01'))

# 6. SELECT id,COUNT(DISTINCT pdate) FROM maoyanmovie GROUP BY id;
df6 = df.groupby(['id']).agg({'pdate': 'nunique'})
# print(df6)

# 7. SELECT * FROM table1 t1 INNER JOIN table2 t2 ON t1.id = t2.id;
sql1 = 'SELECT * FROM table1'
sql2 = 'SELECT * FROM table2'

t1 = pd.read_sql(sql1, mysql_conn)
t2 = pd.read_sql(sql2, mysql_conn)

df7 = pd.merge(t1, t2, on='id')
# print(df7)

# 8. SELECT * FROM table1 UNION SELECT * FROM table2;
df8 = pd.concat([t1, t2])
# print(df8)

# 9. DELETE FROM table1 WHERE id=10;
t9 = t1[ t1['id'] != 10 ]
print(t9)

# 10. ALTER TABLE table1 DROP COLUMN column_name;
t10 = t1.drop('order_time', axis=1)
# print(t10)

mysql_conn.close()