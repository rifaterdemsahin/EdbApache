Here’s an updated proof of concept that will display metadata from the **EnterpriseDB (EDB)** database on a webpage served by Apache. We’ll use a PHP script to query the EDB database and display its metadata on the page.

### 📄 Updated Proof of Concept: Apache and EDB with Metadata Display

```markdown
# 🐳 Proof of Concept: Apache and EDB (EnterpriseDB) with Metadata Display

## 🎯 Objective
To set up a local environment running both an Apache server and an EnterpriseDB (EDB) database using Docker Compose, and display EDB metadata on a webpage.

## 📋 Prerequisites
- Docker 🐳 installed
- Docker Compose 📦 installed
- PHP 🐘 (to display the metadata on the webpage)
- EnterpriseDB Docker image 🐘 available

## 🏗️ Step-by-Step Process

### 1. 🛠️ Create a Docker Compose File
We'll define the services (Apache with PHP support and EDB) in a `docker-compose.yml` file. Apache will use a PHP script to display metadata from the EDB database.

```yaml
version: '3'
services:
  web:
    image: php:7.4-apache  # Apache with PHP support
    ports:
      - "8080:80"
    volumes:
      - ./public-html/:/var/www/html/
    depends_on:
      - db
  
  db:
    image: enterprisedb/edb-as:13  # Use EDB's Docker image
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: secretpassword
      POSTGRES_DB: demo_db
    volumes:
      - edbdata:/var/lib/postgresql/data
    ports:
      - "5444:5444"  # EDB default port is 5444

volumes:
  edbdata:
```

### 2. 📂 Set Up Directory Structure
Set up a folder structure and create files for your project.

```bash
mkdir apache-edb-metadata-demo
cd apache-edb-metadata-demo
mkdir public-html
touch docker-compose.yml
```

### 3. 📝 Create the PHP Script to Query EDB Metadata
In the `public-html/` directory, create a `index.php` file that will query the EDB database and display metadata on the webpage.

```php
<?php
$host = 'db';  // The service name in the Docker Compose file
$port = '5444';  // Default EDB port
$dbname = 'demo_db';
$user = 'admin';
$pass = 'secretpassword';

// Connect to the EDB database
$connection = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$pass");

if (!$connection) {
    echo "Error: Unable to connect to the database.\n";
    exit;
}

// Query to get the metadata from EDB
$query = 'SELECT version(), current_database(), current_user;';
$result = pg_query($connection, $query);

if (!$result) {
    echo "An error occurred while executing the query.\n";
    exit;
}

// Display the metadata
echo "<h1>EnterpriseDB Metadata</h1>";
while ($row = pg_fetch_row($result)) {
    echo "<p>PostgreSQL Version: " . $row[0] . "</p>";
    echo "<p>Database: " . $row[1] . "</p>";
    echo "<p>User: " . $row[2] . "</p>";
}

pg_close($connection);
?>
```

### 4. 🐳 Build and Run the Containers Locally
Run the Docker Compose setup:

```bash
docker-compose up
```

Docker Compose will pull the necessary images (Apache with PHP and EDB), create the containers, and start both services.

### 5. ✅ Verify Apache and EDB Metadata Display

#### Step 5.1 🔍 View the Metadata
Open your browser and visit `http://localhost:8080`. You should see the following metadata displayed:
- PostgreSQL Version (as EnterpriseDB is built on PostgreSQL)
- Database name (`demo_db`)
- Current user (`admin`)

#### Example output:
```
EnterpriseDB Metadata

PostgreSQL Version: PostgreSQL 13.x EDB Advanced Server
Database: demo_db
User: admin
```

### 6. 🔄 Stop and Clean Up
When you're done, stop the containers and clean up:

```bash
docker-compose down
```

---

## 🎉 Conclusion
You’ve successfully set up a local development environment running Apache with PHP and EnterpriseDB, and you’ve displayed EDB metadata on a webpage! This environment is easily modifiable and expandable.
```

This proof of concept now includes PHP to display metadata from the **EnterpriseDB** database on a webpage served by Apache.