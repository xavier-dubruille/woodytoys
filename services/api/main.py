from flask import Flask
from datetime import datetime
import redis

from utils import get_last_product, launch_server, make_some_heavy_computation


app = Flask('my_api')

# redis_db = redis.Redis(host='redis', port=6379, db=0)


@app.get('/api/ping')
def ping():
    return 'ping'


@app.get('/api/slow_static')
def slow_static():
    r = make_some_heavy_computation()
    return r


@app.get('/api/slow_dynamic')
def slow_dynamic():
    r = make_some_heavy_computation()
    return f'{datetime.now()}: {r}'


@app.get('/api/fast')
def fast():
    return f'fast: {datetime.now()}'


@app.post('/api/database')
def products():
    return f'db: {datetime.now()} - {get_last_product()}'


if __name__ == "__main__":
    launch_server(app, host='0.0.0.0', port=5000)
