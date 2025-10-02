# Final Project Topic (Car Rental Application)

## Car Rental System

In this project, you will build a **menu-based car rental application** that works in the terminal.  
We will use a **layered architecture**, where every layer has its own responsibility. This design will make the system flexible, scalable, and easy to maintain.

During the project, you will practice **Java programming**, **database operations**, and **building user flows** step by step.

---

## Functional Requirements

### Authentication
- Login / Register with **email + password** ✅
- Passwords must be saved using **SHA-256 or similar hashing algorithm** ✅

### Roles and Authorization
- Roles: **Admin, Customer** ✅
- Customer Types: **Individual, Institutional** ✅
- Admin: can **add / update / delete / list** cars (CRUD) ✅
- Customer: can **search, rent, cancel** ✅
- Only **logged-in users** can rent a car ✅

### Cars and Pricing
- Car Types: **Car, Helicopter, Motorcycle** ✅
- Car types must follow a common **interface/abstract class** ✅
- Different **pricing rules** for each car type ✅
- Rent by **hour / day / week / month**, with price calculated ✅

### Search, Filter, Pagination
- Filter by **type, brand, price range** ✅
- **Pagination** (page by page listing) ✅

### Business Rules
- Institutional accounts: **minimum 1 month rental** ✅
- Car value > 2,000,000 TL → renter must be **30+ years old** and pay **10% deposit** ✅

### Availability Check
- No overlapping rentals for the same car ✅

### Rental Records
- Users can see **current and past rentals** ✅
- **Deposit Lifecycle** ✅
    - Deposit is calculated and saved
    - On cancel/complete → deposit is refunded or used correctly ✅

### Error Messages
- Show **clear and user-friendly messages** for success and error ✅

---

## Technical Requirements

### Platform and Tools
- Java 21, PostgreSQL (16 preferred), JDBC (via Maven or driver file) ✅

### Data Model and SQL
- Correct **table design** with efficient **JOIN usage** ✅

### Transaction Management
- Rental creation / cancel / deposit update must be in **one transaction** ✅
- **Commit/Rollback** must be applied correctly ✅

### Seed Data
- Initial data: **3 users** (Admin / Corporate / Individual) and at least **6 cars** ✅

### Exception Handling
- Handle both **expected errors** (e.g., wrong input) and **unexpected errors** (e.g., lost DB connection) ✅

### Architecture and Code Quality
- Use **layered architecture** (DAO/Repository, Service, Model/Entity, Main, UI) ✅
- Code must be **clean, readable, and well-indented** ✅
- Names of **classes, variables, and methods** must follow Java standards and be in English ✅
- Add **comments** and a **README** that explains the project ✅  


---

## Database Setup

This project uses PostgreSQL 17.6. You can use the database backup file provided in this repository.  
Follow the steps below to install PostgreSQL and restore the backup.

### Installing PostgreSQL 17.6

- **macOS (Homebrew)**
```bash
    brew install postgresql@17
    brew services start postgresql@17
```

- **linux** 
```bash 
    sudo apt update
    sudo apt install postgresql-17
    sudo systemctl start postgresql
```

- **windows**
  Download the installer from <a href = "https://www.postgresql.org/download/windows/?utm_source=chatgpt.com" > PostgreSQL official site </a> and follow the instructions.
  Make sure the PostgreSQL service is running after installation.

---

### Restoring the Backup
1. Download <a href="[db.sql](db.sql)"> DB Backup </a>
2. Open terminal/command prompt.
3. Run the following command to restore the database from backup:
```bash
    # macOS/Linux
    psql -U <your_postgres_user> -d <your_db_name> -f path/to/backup.sql
    
    # Windows (Command Prompt)
    psql -U <your_postgres_user> -d <your_db_name> -f C:\path\to\backup.sql
```
Replace <your_postgres_user> and <your_db_name> with your PostgreSQL username and database name. 
After this, the database is ready to use with the application.

---

## Installing Java JDK 21

This project requires **Java 21** to compile and run.  
Below are instructions for installing JDK 21 on different operating systems.

### macOS

**Option A: Homebrew**
```bash
    # Update Homebrew
    brew update

    # Install JDK 21
    brew install openjdk@21

    # Add JDK 21 to PATH
    echo 'export PATH="/usr/local/opt/openjdk@21/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc

    # Verify installation
    java -version
```
**Option B: Official Oracle JDK**
1. Download JDK 21 from Oracle Downloads
2. Install the .dmg file.
3. Verify installation:
```bash 
  java -version
```

### Linux(Ubuntu/Debian)

**Option A: Using apt repository**
```bash
    sudo apt update
    sudo apt install openjdk-21-jdk

    # Verify installation
    java -version
```
**Option B: Download from Oracle**
1. Download JDK 21 from Oracle Downloads
2. Download .tar.gz archive.
3. Extract and set JAVA_HOME:
```bash 
    tar -xzf jdk-21_linux-x64_bin.tar.gz
    sudo mv jdk-21 /opt/
    
    # Add to PATH
    echo 'export JAVA_HOME=/opt/jdk-21' >> ~/.bashrc
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
    
    # Verify
    java -version
```

### Windows
1. Download JDK 21 installer from Oracle JDK 21 Downloads
2. Run the .exe installer and follow the instructions.
3. Set JAVA_HOME environment variable:
   - Open System Properties → Environment Variables → New System Variable
   - Name: JAVA_HOME
   - Value: path to JDK 21 folder, e.g., C:\Program Files\Java\jdk-21
4. Add %JAVA_HOME%\bin to your PATH variable.
5. Verify installation:
```bash
    java -version
    javac -version
```

---

## Running the Application (JAR + Command Line Arguments)

After building the project with Maven, you will get a `.jar` file.  
This application requires **four command line arguments** to run:

1. `DB_URL` – JDBC URL of your PostgreSQL database (required)
2. `DB_USER` – Database username (required)
3. `DB_PASSWORD` – Database password (required, can be empty)
4. `TEST_MODE` - Open Test Options (required, can be empty)

### Example Usage

#### macOS / Linux
```bash
    java -jar presentation-1.0-SNAPSHOT.jar "jdbc:postgresql://localhost:5432/mydb" "myuser" "mypassword" "test"
    # Or with empty password
    java -jar presentation-1.0-SNAPSHOT.jar "jdbc:postgresql://localhost:5432/mydb" "myuser" "" ""
```
#### Windows (Command Prompt / PowerShell)
```bash
java -jar presentation-1.0-SNAPSHOT.jar "jdbc:postgresql://localhost:5432/mydb" "myuser" "mypassword" "test"
# Or with empty password
java -jar presentation-1.0-SNAPSHOT.jar "jdbc:postgresql://localhost:5432/mydb" "myuser" "" ""
```
### Notes:
- All four arguments are required.
- TEST_MODE and DB_PASSWORD can be empty, but DB_URL and DB_USER cannot be empty.
- The application reads these arguments at startup and connects to the PostgreSQL database.