# ✨ Reflection Notes – Day 2

---

## 🏆 DSA – Sliding Window

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

SELECT * FROM orders WHERE DeliveryStatus = 'Delivered';
