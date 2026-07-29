from flask import Flask, jsonify
import os
import psycopg2


app = Flask(__name__)


def get_database_connection():
    return psycopg2.connect(
        host=os.getenv("DATABASE_HOST"),
        port=os.getenv("DATABASE_PORT"),
        database=os.getenv("DATABASE_NAME"),
        user=os.getenv("DATABASE_USER"),
        password=os.getenv("DATABASE_PASSWORD")
    )


@app.route("/")
def home():
    return "Hyrcania Cloud Infrastructure - Docker Application Running!"


@app.route("/health")
def health():

    try:
        connection = get_database_connection()
        connection.close()

        return jsonify({
            "status": "healthy",
            "application": "hyrcania-app",
            "database": "connected"
        })

    except Exception as error:

        return jsonify({
            "status": "unhealthy",
            "database": "not connected",
            "error": str(error)
        }), 500


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5000
    )