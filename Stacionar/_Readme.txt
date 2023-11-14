The launch is configured through the venv virtual environment, so the dependencies from the "requirements.txt" file must be configured to launch.

1. Launching the project with a database filled with test data (demonstration mode):

The database with test data "stacionar_server\Dump20230617.sql" is provided together with the project. To connect it, you need to create a database with the name "stacionar" (charset: utf8, collation: utf8_general_ci), and import data from the dump file to this database. DB connection settings are in the "stacionar_server\config.py" file:

"""

host = "localhost"
user = "root"
password = "root"
db_name = "stationary"

ip = '127.0.0.1'
port = 3306

"""

After the DB connection settings, the "run.bat" file must be executed to start the project.

2. Starting the project with an empty database (working mode):

1) Run the "manage_db.bat" file.
2) Run the "run.bat" file.

3. To create an administrator account, you need to execute the "admin.bat" file.


Login details:
login: Administrator
password: password

Database access data:
login: root
password: root
