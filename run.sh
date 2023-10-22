#!/bin/bash

# check if wrk is installed
which wrk

: "${PORT:=5002}"

for python in python3.10 python3.11 python3.12 ; do
    if ! which $python; then continue; fi

    $python -m venv venv_"$python"
    source "$(dirname "$0")"/venv_"$python"/bin/activate
    pip install -r requirements.txt
    deactivate
done

clear

for python in python3.10 python3.11 python3.12 ; do
    if ! which $python; then continue; fi > /dev/null 2>&1

    echo ===========================================================
    echo Test: $python
    echo ===========================================================

    source "$(dirname "$0")"/venv_"$python"/bin/activate

    uvicorn --log-level error --workers 12 --port "$PORT" fastapi_app:app &

    # sleep 3
    # wrk -t4 -c200 -d15s http://localhost:"$PORT"

    sleep 3
    wrk -t4 -c200 -d15s http://localhost:"$PORT"/json

    # kill the uvicorn process
    pkill -P $$

    while nc -z localhost "$PORT"; do sleep 1; done > /dev/null 2>&1
    deactivate
    sleep 5
done
