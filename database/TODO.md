# TODO For Database Creation

Here is a simple explanation of what is expected in the database.

## Create database table

- For `sampleDatabase1` create sql files to create all the tables needed in this database.
- Make sure that the databse has a given context such as school or hospital.
- Ensure that all the database files has a .sql extension eg `Students.sql`

      ```sql
        CREATE TABLE Students(
            id INT PRIMARY KEY NOT NULL,
            fname VARCHAR(50) NOT NULL
            --more data--
        );
      ```
 - For `sampleDatabase2` do the same as for sampleDatabase1 but this time use a database for a different
   context. Such as hospital if you used school for the above.

## Insert data to the database
 
 - Create  sql files such as the above to insert sample data into the databases.
 - Add the files for each database into its folder for both databases respectively.

## How to add the database to your DB SERVER

 - add you db authoristions to the `config.php` file.

      ```php
            <?php
            $db_host = 'localhost';
            $db_user = 'your_username';
            $db_password = 'your_password';
            $db_name = 'your_database_name';
      ```

 - run the `migrations.php` file to create tables and insert data to the database.
  
      ```bash
            php migrations.php
      ```