# 📅 Day 9 – Reflection

---

## ✅ DSA – Java

**Topic:** *Character Frequency Sort using Bucket Sort*  
**Problem:** ✔️ Done using HashMap + Array of Lists

**Learning:**

- Explored an alternate to PriorityQueue → Bucket Sort for frequency sorting.
- Mapped frequencies directly to array indices → elegant and intuitive.
- Reinforced importance of choosing data structures based on frequency range.

---

## ✅ Core CS — OS

**Topic:** *Disk Scheduling Algorithms*

**Learning:**

- Studied key disk scheduling strategies: 
  - FCFS (First-Come, First-Served)
  - SSTF (Shortest Seek Time First)
  - SCAN (Elevator Algorithm)
  - C-SCAN, LOOK, C-LOOK
- Compared based on seek time efficiency and starvation possibility.
- Understood how head movement patterns affect performance.
- Realized how these relate to I/O-intensive systems and database disk access.

---

## ✅ Python — JSON to SQLite ETL

**Task:** Parse user data from JSON → Insert into SQLite database.

**Learning:**

- Practiced creating and managing SQLite tables dynamically.
- Understood connection handling:
  - `conn.cursor()` for executing queries
  - `conn.commit()` to save changes
  - `conn.close()` to release the database
- Inserted parsed JSON into DB with clean loop logic using `for user in json_data`.

---

## ✅ SQL — Subqueries, CASE, NULL Handling

**Task:**

- Get users **without transactions** (subquery)
- Classify users based on **amount thresholds** using `CASE`
- Tested **null phone numbers** using `IFNULL()` / `COALESCE()`

**Learning:**

- Revisited powerful pattern: `NOT IN (SELECT...)` for filtering.
- Wrote multiple conditional blocks inside SELECTs using `CASE`.
- Saw importance of graceful NULL handling in real-life data.

---

## 🏆 Overall Reflection

- ✅ Felt like a **complete data engineer simulation** day.
- Explored **Java logic**, **Python DB automation**, and **SQL conditional querying**.
- Disk scheduling concepts helped connect **OS theory to performance issues** in real applications.
- Day was a balanced mix of systems + practical scripting + querying.

---
