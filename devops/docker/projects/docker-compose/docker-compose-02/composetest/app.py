from flask import Flask
import redis

app = Flask(__name__)

# Connect to Redis container by its Docker name
r = redis.Redis(host='redis-9001', port=6379, decode_responses=True)

@app.route('/')
def index():
    r.incr('hits')
    return f'Hello! I have been seen {r.get("hits")} times.'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
