# 📅 Day 2 - Reflection

## DSA – Sliding Window

**Concept:** Efficient technique for solving problems involving subarrays, substrings, or ranges.

- Maintains a window of size `k` and slides it across the array/string.
- Avoids recomputation → faster than brute-force.

**Typical use cases:**

- Maximum/minimum subarray sum  
- Number of substrings with a given property  
- Pattern matching  

---

## 🗂️ DBMS – Indexing

**Purpose:** Improve query performance by avoiding full table scans.

- **Search Key:** Column value to index.
- **Data Reference / Block Pointer:** Points to actual data row.

**Tradeoff:**  
✅ Faster `SELECT` queries  
⚠️ Slightly slower `INSERT`, `UPDATE`, `DELETE` due to index maintenance.

**Example Query:**
```sql
CREATE INDEX idx_status ON orders(DeliveryStatus);
```
```sql
SELECT * FROM orders WHERE DeliveryStatus = 'Delivered';
```

---
**🐍 Python – Data Cleaning (Pandas)**

Goal: Prepare data for reliable analysis by fixing errors/inconsistencies.

**Common techniques:**

🗑️ Remove duplicates
df.drop_duplicates()

🧮 Handle missing values
df['column'].fillna(0)

🕒 Convert data types
pd.to_datetime(df['Date'])

🧹 Trim whitespaces
df['column'].str.strip()

🔡 Standardize text
df['column'].str.lower()

---
**📝 Summary**

✅ DSA: Sliding Window technique.

✅ DBMS: Indexing concepts and tradeoffs.

✅ Python: Common Data Cleaning techniques using Pandas.
