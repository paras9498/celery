#!/bin/bash
redis-server --daemonize yes 
celery -A tasks worker -l info 
