from config import db_config
from sqlalchemy import create_engine
from sqlalchemy_utils import database_exists, create_database

engine = create_engine(db_config)
if not database_exists(engine.url):
    create_database(engine.url)
    print('Database create successful')
else:
    print('Database alredy exist')