import json
import logging
import os
import psycopg2  # if you want real DB access (include in ZIP)

logger = logging.getLogger()
logger.setLevel(logging.INFO)

DB_HOST = os.environ["DB_HOST"]
DB_USER = os.environ["DB_USER"]
DB_PASS = os.environ["DB_PASS"]
DB_NAME = os.environ["DB_NAME"]

def handler(event, context):
    logger.info("Received event: %s", json.dumps(event))

    conn = psycopg2.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, dbname=DB_NAME
    )
    cur = conn.cursor()

    for record in event.get("Records", []):
        body = record["body"]
        logger.info("Processing product id: %s", body)
        cur.execute("SELECT id, name, price FROM products WHERE id = %s", (body,))
        row = cur.fetchone()
        logger.info("Product data: %s", row)

    conn.close()
    return {"statusCode": 200, "body": "OK"}

