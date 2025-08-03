import pandas as pd

# I. EXTRACT -  Load the CSV into  DataFrame

df = pd.read_csv("C:/Users/Admin/Desktop/Daily_Prep/Python-Scripting/2.Libraries/Pandas/4.ETL/Sample-Superstore.csv", encoding = "latin1")
print(df.head()) # get first five rows



# II. TRANSFORM - Clean data, create new columns,  aggregate

# 1. Clean Data

# Handling missing values
print(df.isnull().sum())

# Convert column types
df['Order Date'] = pd.to_datetime(df['Order Date'])
df['Quantity'] = df['Quantity'].astype(int)

# 2. transforming the data

# create new column- sales after discount
df['Sales after discount'] = df['Sales'] * (1 - df['Discount'])
print("\n\n", df['Sales'], "\n\n", df['Discount'], "\n\n", df['Sales after discount'])

# 3. aggregation

# per customer
customer_summary = df.groupby('Customer ID').agg({'Sales after discount' : 'sum', 'Order ID' : 'nunique'})
customer_summary.rename(columns={'Order ID' : 'Num Orders'}, inplace=True)
customer_summary = customer_summary.sort_values(by='Sales after discount', ascending=False)
print("\n", customer_summary)

#per product
product_summary = df.groupby('Product Name').agg({'Sales after discount':'sum', 'Order ID':'nunique'})
product_summary.rename(columns={'Order ID':'Num Orders'}, inplace=True)
product_summary = product_summary.sort_values(by='Sales after discount', ascending=False)
print("\n", product_summary)



# III. LOAD - save cleaned data & summary as CSVs

df.to_csv("C:/Users/Admin/Desktop/Daily_Prep/Python-Scripting/2.Libraries/Pandas/4.ETL/cleaned_superstore_data.csv", index=False)
customer_summary.to_csv("C:/Users/Admin/Desktop/Daily_Prep/Python-Scripting/2.Libraries/Pandas/4.ETL/customer_summary.csv")
product_summary.to_csv("C:/Users/Admin/Desktop/Daily_Prep/Python-Scripting/2.Libraries/Pandas/4.ETL/product_summary.csv")