from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hyrcania Cloud Infrastructure - Docker Application Running!"

@app.route("/health")
def health():
    return {
        "status": "healthy",
        "service": "hyrcania-app"
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)