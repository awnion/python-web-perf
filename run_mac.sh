#!/bin/bash

# check if wrk is installed
which wrk || exit 1

: "${PORT:=5002}"

PYTHONS=$(echo python3.{12,11})

for python in $PYTHONS ; do
    if ! which "$python"; then continue; fi

    $python -m venv venv_"$python"
    ./venv_"$python"/bin/pip install -r requirements.txt
done

clear

for python in $PYTHONS ; do
    if ! which "$python"; then continue; fi > /dev/null 2>&1

    echo ===========================================================
    echo Test: "$python"
    echo ===========================================================

    ./venv_"$python"/bin/uvicorn --log-level error --workers 20 --port "$PORT" fastapi_app:app &

    sleep 5
    wrk -t4 -c200 -d15s http://localhost:"$PORT"

    sleep 5
    wrk -t4 -c200 -d15s http://localhost:"$PORT"/json

    # kill the uvicorn process
    pkill -P $$; fg >/dev/null 2>&1

    # while nc -z localhost "$PORT"; do sleep 1; done > /dev/null 2>&1
    sleep 7
done
