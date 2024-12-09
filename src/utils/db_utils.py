import sqlalchemy

def get_sqlalchemy_engine(db_uri):
    """
    Get a SQLAlchemy engine for connecting to your SQL database.
    """
    engine = sqlalchemy.create_engine(db_uri)
    return engine

def run_query(engine, query):
    with engine.connect() as conn:
        result = conn.execute(query)
        return result.fetchall()