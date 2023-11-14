venv\Scripts\python.exe stacionar_server\manage_db.py
venv\Scripts\python.exe stacionar_server\manage.py makemigrations --skip-checks 
venv\Scripts\python.exe stacionar_server\manage.py migrate --skip-checks
def_field_db.bat