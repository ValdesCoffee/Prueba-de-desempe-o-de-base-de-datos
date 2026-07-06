# Excel to SQL Data Cleaning & Migration

## Description

Solution that takes a "dirty" Excel file (inconsistencies, duplicates, irregular formats, empty cells, mixed data types, etc.), cleans and normalizes it, and migrates it into a relational database (SQL). On top of that database, normalized tables are built, the cleaned data is inserted, and queries, subqueries, and views are developed to analyze and consume the data.

Additionally, a mock data layer is exposed through **json-server**, useful for validating the structure of the cleaned data before inserting it into SQL and for simulating query endpoints during development.

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

## Running json-server

To inspect the cleaned data in JSON format before (or alongside) the SQL load:

```bash
json-server --watch data/clean/clean_data.json --port 3000
```

Available endpoints (example):
```
GET http://localhost:3000/records
GET http://localhost:3000/records/:id
```

This allows quickly validating the shape and consistency of the data without needing the SQL database up and running.

## Test users

Test users defined to validate access to the database and to the created views:

| User            | Password (test) | Role          |
|-----------------|------------------|---------------|
| admin_test      | admin123         | Administrator |
| analyst_test    | analyst123       | Analyst       |
| reader_test     | reader123        | Read-only     |

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

## Role permissions

| Role           | Tables  | Views          | Permissions                        |
|----------------|---------|----------------|--------------------------------------|
| Administrator  | All     | All            | SELECT, INSERT, UPDATE, DELETE       |
| Analyst        | None    | All            | SELECT on views only                 |
| Read-only      | None    | Public views   | Limited SELECT                       |

Views are used as an abstraction layer so base tables aren't directly exposed to the analyst and read-only roles, restricting access to sensitive columns or internal business logic.

## Technical decisions

- **Cleaning before loading**: cleaning was chosen to happen in Python before touching the database, rather than cleaning with SQL post-load, to avoid inserting inconsistent data and to simplify rollback in case of errors.
- **Table normalization**: imported data was distributed across normalized tables (avoiding data duplication) instead of keeping a single flat table equivalent to the original Excel.
- **Views instead of direct table access**: views allow control over which columns and which table combinations (via JOIN) are exposed to each role, improving security and maintainability.
- **json-server as an intermediate validation layer**: used exclusively as a supporting tool to review the integrity of the cleaned data before the final migration to SQL, not as a replacement for the real database.
- **Subqueries vs JOIN**: subqueries were used in cases requiring filtering over aggregates (e.g., records above an average), reserving JOINs for combining related information across tables.
