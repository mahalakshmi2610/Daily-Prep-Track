from datetime import datetime
import sqlite3
import pandas as pd

timestamp = datetime.now().strftime('%Y%m%d_%H%M')  # Format: YYYYMMDD_HHMM

filename = f'users_{timestamp}.csv'

conn = sqlite3.connect('users.db')
query = "SELECT * FROM users"

df = pd.read_sql_query(query, conn)

df.to_csv(filename, index=False)
print(f"Exported to {filename} sucessfully!")

conn.close()