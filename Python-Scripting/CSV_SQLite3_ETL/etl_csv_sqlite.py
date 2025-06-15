import pandas as pd

df = pd.read_csv("C:/Users/Admin/Desktop/Daily_Prep/Python-Scripting/CSV_SQLite3_ETL/transactions.csv")


# check if required columns exist
required_cols = {"id", "name", "amount", "date"}
if not required_cols.issubset(df.columns):
    raise ValueError("Missing Required Columns!")

import sqlite3

conn = sqlite3.connect("transactionss.db")
cursor = conn.cursor()

cursor.execute('''
    CREATE TABLE IF NOT EXISTS  transactionsss (
        id INTEGER,
        name TEXT,
        amount REAL,
        date TEXT
    )
''')

conn.commit()

for _, row in df.iterrows():
    cursor.execute('''
        INSERT INTO transactionsss (id, name, amount, date)
        VALUES (?, ?, ?, ?)
    ''', (row['id'], row['name'], row['amount'], row['date']))

conn.commit()
conn.close()

conn = sqlite3.connect("transactionss.db")
cursor = conn.cursor()

cursor.execute("SELECT * FROM transactionsss")
rows = cursor.fetchall()

for row in rows:
    print(row)

conn.close()