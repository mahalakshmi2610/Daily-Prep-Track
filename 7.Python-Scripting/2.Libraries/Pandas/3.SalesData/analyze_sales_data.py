import pandas as pd

# read csv
df = pd.read_csv("Python-Scripting/2.Libraries/Pandas/3.SalesData/sales_data.csv")

# display only 1st five rows
print(df.head())

# filtering rows with pending delivery status
pendingDelivery = df[df['DeliveryStatus'] == 'Pending']
print("Pending deliveries: \n", pendingDelivery)

# total amount of delivered orders
totalAmountOfDelivered = df[df['DeliveryStatus'] == 'Delivered']['Amount'].sum()
print("\nTotal Amount of Delivered Orders: ", totalAmountOfDelivered)

# write filtered Pending orders to a new CSV
pendingDelivery.to_csv("pending_orders.csv")