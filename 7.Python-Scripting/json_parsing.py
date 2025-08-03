def extract_customer_info(data):
    id = data["customer"]["id"]
    name = data["customer"]["name"]
    recent_txn = data["customer"]["transactions"][-1]["amount"]

    return (id, name, recent_txn)

data = {
    "customer": {
        "id": "C1024",
        "name": "Mahalakshmi K",
        "contact": {
            "email": "maha@example.com",
            "phone": "9876543210"
        },
        "transactions": [
            {"id": "T1", "amount": 2300, "date": "2023-12-01"},
            {"id": "T2", "amount": 4500, "date": "2024-01-15"}
        ]
    }
}

# customer_id = data["customer"]["id"]
# print(customer_id)

# customer_name = data["customer"]["name"]
# print(customer_name)

# recent_txn = data["customer"]["transactions"][-1]["amount"]
# print(recent_txn)

customer_info = extract_customer_info(data)
print(f"Customer ID: {customer_info[0]}")
print(f"Name: {customer_info[1]}")
print(f"Recent Transaction Amount: Rs.{customer_info[2]}")