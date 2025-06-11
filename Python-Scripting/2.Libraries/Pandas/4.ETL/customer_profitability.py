import pandas as pd

df = pd.read_csv("C:/Users/Admin/Desktop/Daily_Prep/Python-Scripting/2.Libraries/Pandas/4.ETL/Sample-Superstore.csv", encoding="latin1")

customer_summary = df.groupby('Customer Name').agg({
    'Sales': 'sum',
    'Profit': 'sum',
    'Order ID': pd.Series.nunique
}).rename(columns={
    'Sales': 'Total Sales',
    'Profit': 'Total Profit',
    'Order ID': 'Number of orders'
})

customer_summary = customer_summary.sort_values(by='Total Profit', ascending=False)

customer_summary.to_csv("C:/Users/Admin/Desktop/Daily_Prep/Python-Scripting/2.Libraries/Pandas/4.ETL/customer_profitability.csv")

print(customer_summary.head())