🌟 Reflection Notes – Day 2
DSA – Sliding Window
Sliding Window Technique → Efficiently solves problems involving subarrays/substrings/ranges.

Maintains a window of size k that slides through the array/string.

Avoids recomputation compared to brute-force.

Common in: max/min subarray sum, number of substrings, pattern matching.

🗂️ DBMS – Indexing
Indexing → Improves data retrieval speed by avoiding full table scans.

Search Key → Column value used in the index.

Data Reference / Block Pointer → Points to actual data row.

Tradeoff: Speeds up SELECT; can slow down INSERT/UPDATE/DELETE due to index maintenance.

SQL Example:

sql
Copy
Edit
SELECT * FROM orders WHERE DeliveryStatus = 'Delivered';
→ Fast with index on DeliveryStatus.

🐍 Python – Data Cleaning
Data Cleaning → Prepares data for accurate analysis by fixing errors and inconsistencies.

Remove duplicates → df.drop_duplicates()

Handle missing values → df['col'].fillna(0)

Convert data types → pd.to_datetime(df['Date'])

Trim whitespaces → df['col'].str.strip()

Standardize text → df['col'].str.lower()

🗃️ SQL – Basic Queries + Indexing Relevance
Practiced:

GROUP BY, SUM, DISTINCT, ORDER BY

Example:

sql
Copy
Edit
SELECT DeliveryStatus, COUNT(*) FROM orders GROUP BY DeliveryStatus;
Indexing improves such queries when filtering/sorting on indexed columns.

Summary
✅ Sliding Window for subarray/substring problems.
✅ Indexing concept and tradeoffs in DBMS.
✅ Python Data Cleaning using Pandas.
✅ SQL Aggregation and relevance of Indexing.