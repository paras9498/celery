from celery import Celery
#'redis://127.0.0.1:6379/0'
BROKER_URL = 'redis://127.0.0.1:6379/0'
BACKEND_URL = 'redis://127.0.0.1:6379/0'
app = Celery('tasks', broker=BROKER_URL, backend=BACKEND_URL, )

@app.task(name='Add two number')
def add(x,y):
    return x + y
