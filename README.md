# UAE Web App Databases – SQL Learning Collection

This repository contains a large collection of real-world style SQL database dumps from various UAE-focused web applications.  
It is intended **for learning and teaching SQL / relational database concepts**, especially for **PostgreSQL educators and students** who want realistic schemas and data rather than toy examples.

> Important: These dumps are provided strictly for **educational and training purposes** only.  
> Do **not** use them in production systems.

---

## What’s inside

Each `.sql` file represents a separate project/database snapshot.  
Examples (based on file names):

- `restro_v2.sql`, `restro_v2s.sql` – restaurant / food ordering
- `drclinic.sql`, `game_clinic.sql` – clinic / healthcare style apps
- `travelblzr.sql`, `travelblzr_web.sql`, `tttravelblzr_web.sql` – travel/booking
- `TheSchoolApp1.sql`, `trueschool.sql`, `uae_student_forum_app.sql` – education/school apps
- `classified.sql`, `ccclasified.sql` – classified listings
- `buildmart.sql`, `ffmart.sql`, `eecom.sql` – e-commerce style apps
- Dozens of other domains: games, loyalty, forums, local services, etc.

You will also see date-based dumps / snapshots, for example:

- `22_12_2024_db.sql`
- `10_13_2025_db.sql`
- `30_5_2025_db_pet.sql`

These can be used to discuss schema evolution, migrations, and backup strategies.

---

## Intended use

This repo is designed to help with:

- Teaching **SQL basics** (SELECT, JOIN, GROUP BY, subqueries)
- Demonstrating **normalized schemas** and real domain models
- Practicing:
  - Data modeling and schema reading
  - Writing complex queries on realistic data
  - Refactoring schemas
  - Importing/exporting databases
- Designing exercises, assignments, and exams around:
  - E-commerce
  - Travel/booking
  - Clinics/healthcare
  - Education platforms
  - Classifieds and marketplaces

Educators can pick one or more `.sql` files as the “case study database” for a course or module.

---

## Requirements

You can use these dumps with:

- **PostgreSQL** (recommended for teaching)
- Or other SQL databases, depending on the original dump format and compatibility

Some dumps may originate from MySQL/MariaDB style exports. If you are teaching with PostgreSQL, you may need to:

- Remove or adjust engine-specific options (e.g. `ENGINE=InnoDB`, `AUTO_INCREMENT`, `CHARSET` options).
- Adjust data types where needed.
- Use the dumps primarily as **schema/data examples** rather than 1-click PostgreSQL imports.

---

## Quick start (PostgreSQL)

1. Create a new database:

   ```bash
   createdb restro_v2
