import pandas as pd

#Load the csv file
df = pd.read_csv("orders.csv")

# Display all rows
print("All Orders:")
print(df)

#Filter: Delivered Orders only
delivered = df[df['DeliveryStatus'] == 'Delivered']
print("\nDelivered Orders:")
print(delivered)

#Count of Each Delivery Status
status_counts = df['DeliveryStatus'].value_counts()
print("\nDelivery Status Count:")
print(status_counts)

#Total amount collected from Delivered Orders
total_amount = delivered['Amount'].sum()
print(f"\nTotal Amount from Delivered Orders: Rs.{total_amount}")