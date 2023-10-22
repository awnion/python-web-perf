#!/bin/bash

set -ex
PORT=5002

uvicorn --log-level error --workers 12 --port $PORT fastapi_app:app &

# wait for the server to start
sleep 3

wrk -t2 -c100 -d10s http://localhost:$PORT
wrk -t2 -c100 -d10s http://localhost:$PORT/json

# kill the uvicorn process
pkill -P $$
