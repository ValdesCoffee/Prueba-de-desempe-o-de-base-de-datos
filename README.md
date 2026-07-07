# Excel to SQL Data Cleaning & Migration

## Description

Solution that takes a "dirty" Excel file (inconsistencies, duplicates, irregular formats, empty cells, mixed data types, etc.), cleans and normalizes it, and migrates it into a relational database (SQL). On top of that database, normalized tables are built, the cleaned data is inserted, and queries, subqueries, and views are developed to analyze and consume the data.


## Technologies used

- **SQL** (MySQL / PostgreSQL adjust to the engine used) — modeling, tables, views, queries
- **DBeaver / pgAdmin / MySQL Workbench** (optional) — visual database administration
- **Google spreadsheet** _ adjust and clean de data

## Installation

```bash
# Clone the repository
git clone <repository-url>
cd <project-name>

# Install Python dependencies (data cleaning)
pip install -r requirements.txt --break-system-packages

# Install Node dependencies (json-server)
npm install
```

## Running the project

1. **Create tables and insert data**
   ```bash
   psql -U user -d database_name -f sql/01_create_tables.sql
   psql -U user -d database_name -f sql/02_insert_data.sql
   ```
   (or the equivalent `mysql -u user -p database_name < file.sql` if using MySQL)

2. **Run queries and subqueries**
   ```bash
   psql -U user -d database_name -f sql/03_queries.sql
   ```

3. **Create views**
   ```bash
   psql -U user -d database_name -f sql/04_views.sql
   ```



This allows quickly validating the shape and consistency of the data without needing the SQL database up and running.


> These users are for development/testing environments only and should not be used in production.

## Project structure

```
project/
├── data/
│   ├── raw/              # Original Excel (dirty)
│   └── clean/            # Clean data (csv / json)
├── scripts/
│   ├── clean_data.py     # Cleaning and transformation
│   └── import_to_sql.py  # Load into the database
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_queries.sql    # Queries and subqueries
│   └── 04_views.sql      # Views
├── db.json               # Data for json-server
├── requirements.txt
├── package.json
└── README.md
```
## SQL Queries
- The project includes several SQL queries to demonstrate different database operations.

Query 1

Retrieves all records from a table.

Query 2

Filters records using the "WHERE" clause.

Query 3

Combines data from multiple tables using "INNER JOIN".

Query 4

Groups information using "GROUP BY" and aggregate functions.

Query 5

Orders the results using "ORDER BY".

Query 6

Uses aggregate functions such as "COUNT()", "SUM()", "AVG()", or "MAX()".

Query 7

Retrieves data using subqueries.

Query 8

Demonstrates advanced filtering and conditional logic.

«Each query is documented with comments inside the corresponding SQL file explaining its purpose and expected output.»



## Technical decisions

- **Cleaning before loading**: cleaning was chosen to happen in Python before touching the database, rather than cleaning with SQL post-load, to avoid inserting inconsistent data and to simplify rollback in case of errors.
- **Table normalization**: imported data was distributed across normalized tables (avoiding data duplication) instead of keeping a single flat table equivalent to the original Excel.
- **Views instead of direct table access**: views allow control over which columns and which table combinations (via JOIN) are exposed to each role, improving security and maintainability.
- **json-server as an intermediate validation layer**: used exclusively as a supporting tool to review the integrity of the cleaned data before the final migration to SQL, not as a replacement for the real database.
- **Subqueries vs JOIN**: subqueries were used in cases requiring filtering over aggregates (e.g., records above an average), reserving JOINs for combining related information across tables.

- CLAN 3
- auri Valdes 
