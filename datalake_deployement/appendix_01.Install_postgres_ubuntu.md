# Install postgresql on ubuntu

## 1. Install the postgresql server

Below command install the postgresql server and client on the ubuntu and create a user postgres and role postgres

```shell
sudo apt update

sudo apt install postgresql postgresql-contrib
```

Note, the conf files are located at **/etc/postgresql/12/main**.

### 1.1 Allow remote access

To enable other computers to connect to your PostgreSQL server, edit the file **/etc/postgresql/12/main/postgresql.conf**

Locate the line #listen_addresses = ‘localhost’ and change it to:
```text
listen_addresses = '*'
```

### 1.2 Change postgres user password
```shell
ALTER USER postgres with encrypted password 'postgres';
```

## 2. Connect to the server by using user account postgres

### 2.1 Solution one with switch to postgres user
```shell
# connect to the server
sudo -i -u postgres
psql
# show the existing data base
# \l

# exit the database
# \q
```

### 2.2 Run as root 

Another way to connect to the Postgres prompt is to run the psql command as the postgres account directly with sudo:

```shell
sudo -u postgres psql
```

## 3. Create a  new user account
If you are logged in as the postgres account, you can create a new role by running the following command:

```shell
createuser --interactive
```

If, instead, you prefer to use sudo for each command without switching from your normal account, run:

```shell
sudo -u postgres createuser --interactive
```

login to the postgres server, you can view the newly created user by running:

```shell
SELECT rolname FROM pg_roles;

# or use
\du
```
**\du** will show the following outputs:
```text
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 hive      | Superuser, Create role, Create DB                          | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}

```

### 3.1 Add password to the user

```shell
ALTER USER hive WITH PASSWORD 'hive';
```

### 3.2 Change pg_hba.conf to allow password login
Open the **pg_hba.conf**, and the following line. This rule allows all user that has an account in postgresql server
to login with his password from an ip in range 127.0.0.1/32
```text
host    all             all             127.0.0.1/32            md5
```
## 4. Creating a New Database
If you are logged in as the postgres account, you would type something like:

```shell
createdb sammy

```
 
If, instead, you prefer to use sudo for each command without switching from your normal account, you would type:

```shell
sudo -u postgres createdb hive_meta

```