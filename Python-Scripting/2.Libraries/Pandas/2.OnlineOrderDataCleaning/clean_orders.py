import pandas as pd

# Sample online orders data
data = {
    'OrderID': [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1007],
    'Product': ['Wireless Mouse', 'Laptop Sleeve', 'USB Cable', 'Bluetooth Speaker', 'Webcam', 'Laptop Stand', 'Wired Headphone', 'Wired Headphone'],
    'DeliveryStatus': ['Delivered', 'Pending', 'Delivered', 'Cancelled', 'delivered', 'Pending', ' Pending', ' Pending'],
    'CustomerName': ['Arjun', 'Mahima', 'John', 'Shreya', 'Anil', 'Sneha', 'Mahalakshmi', 'Mahalakshmi'],
    'Amount': [599, 899, 199, 1299, 1799, None, 299, 299],  # 1 missing value
    'Date': ['2024-01-05', '2024-01-10', '2024-01-11', '2024-01-15', '2024-02-01', '2024-02-10', '2024-02-15', '2024-02-15']
}

# creating a dataframe
df = pd.DataFrame(data)

# remove duplicates
df = df.drop_duplicates()

# handling missing values
df['Amount'] = df['Amount'].fillna(0)


# convert date column to datetime
df['Date'] = pd.to_datetime(df['Date'])

# trim whitespaces in DeliveryStatus
df['DeliveryStatus'] = df['DeliveryStatus'].str.strip()

# standardize text (make lowercase)
df['DeliveryStatus'] = df['DeliveryStatus'].str.lower()

# capitalize the customerName
df['CustomerName'] = df['CustomerName'].str.upper()

# Final Cleaned Data
print(df)