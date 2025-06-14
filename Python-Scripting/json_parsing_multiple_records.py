def extract_customers_info(data):
    customers_info_list = []

    for cust in data["customers"]:
        id = cust["id"]
        name = cust["name"]
        recent_txn = cust["transactions"][-1]["amount"] if cust["transactions"] else 0

        customers_info_list.append((id, name, recent_txn))

    return customers_info_list

data = {
    "customers": [
        {
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
        },
        {
            "id": "C2048",
            "name": "Aarav M",
            "contact": {
                "email": "aarav@example.com",
                "phone": "9876512345"
            },
            "transactions": [
                {"id": "T3", "amount": 1200, "date": "2023-10-11"},
                {"id": "T4", "amount": 5300, "date": "2024-01-05"}
            ]
        }
    ]
}

customers_info = extract_customers_info(data)

# sort the customers by recent transaction amount (desc)
customers_info.sort(key=lambda x: x[2], reverse=True)

print("ID\t\tName\t\t\tRecent Transaction")
for cust in customers_info:
    print(f"{cust[0]}\t{cust[1]:<15}\t{cust[2]:>4.2f}")
