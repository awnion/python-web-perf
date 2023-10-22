# FastAPI: Performance Test on MacBook Pro M2

<details>
    <summary>Spec</summary>

```yaml
CPU:    Apple M2 Max
Memory: 32768MiB
OS:     macOS 14.0 23A344 arm64
Host:   Mac14,5
Kernel: 23.0.0
```
</details>

<details>
    <summary>pip list</summary>

```text
Package           Version
----------------- -------
annotated-types   0.6.0
anyio             3.7.1
click             8.1.7
exceptiongroup    1.1.3
fastapi           0.104.0
gunicorn          21.2.0
h11               0.14.0
httptools         0.6.1
idna              3.4
packaging         23.2
pip               23.2.1
pydantic          2.4.2
pydantic_core     2.10.1
python-dotenv     1.0.0
PyYAML            6.0.1
setuptools        68.1.2
sniffio           1.3.0
starlette         0.27.0
typing_extensions 4.8.0
uvicorn           0.23.2
uvloop            0.19.0
watchfiles        0.21.0
websockets        12.0
```

</details>

## test 1

```bash
./run_mac.sh
```

```haskell
===========================================================
Test: python3.12
===========================================================
Running 15s test @ http://localhost:5002
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.21ms  563.62us  10.75ms   66.61%
    Req/Sec    38.52k     1.92k   42.72k    72.00%
  2300134 requests in 15.01s, 287.36MB read
Requests/sec: 153288.32
Transfer/sec:     19.15MB
Running 15s test @ http://localhost:5002/json
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.22ms  647.25us  11.65ms   68.70%
    Req/Sec    37.77k     5.72k  130.17k    77.04%
  2258614 requests in 15.10s, 305.87MB read
Requests/sec: 149552.46
Transfer/sec:     20.25MB
===========================================================
Test: python3.11
===========================================================
Running 15s test @ http://localhost:5002
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.96ms    4.19ms  86.22ms   95.75%
    Req/Sec    36.61k    11.54k   83.23k    66.67%
  2185632 requests in 15.02s, 273.05MB read
Requests/sec: 145533.63
Transfer/sec:     18.18MB
Running 15s test @ http://localhost:5002/json
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.67ms    5.78ms 106.02ms   93.92%
    Req/Sec    33.62k     8.46k   70.14k    68.11%
  2014264 requests in 15.10s, 272.78MB read
  Socket errors: connect 0, read 14, write 0, timeout 0
Requests/sec: 133378.17
Transfer/sec:     18.06MB
```

## test 2 (reverse order)

```bash
./run_mac.sh
```

```haskell
===========================================================
Test: python3.11
===========================================================
Running 15s test @ http://localhost:5002
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     5.43ms   13.00ms 119.09ms   91.66%
    Req/Sec    34.99k    17.23k  115.38k    76.73%
  2090416 requests in 15.08s, 261.16MB read
Requests/sec: 138663.49
Transfer/sec:     17.32MB
Running 15s test @ http://localhost:5002/json
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.46ms    1.08ms   9.54ms   53.11%
    Req/Sec    33.77k     2.72k   49.01k    60.86%
  2026273 requests in 15.10s, 274.40MB read
  Socket errors: connect 0, read 3, write 0, timeout 0
Requests/sec: 134179.32
Transfer/sec:     18.17MB
===========================================================
Test: python3.12
===========================================================
Running 15s test @ http://localhost:5002
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.30ms  604.02us   8.18ms   63.95%
    Req/Sec    36.62k     2.66k   41.18k    51.82%
  2200720 requests in 15.10s, 274.94MB read
  Socket errors: connect 0, read 25, write 0, timeout 0
Requests/sec: 145706.06
Transfer/sec:     18.20MB
Running 15s test @ http://localhost:5002/json
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     7.06ms   15.39ms 176.99ms   89.99%
    Req/Sec    33.47k    16.70k  121.84k    73.68%
  1998417 requests in 15.09s, 270.63MB read
Requests/sec: 132413.12
Transfer/sec:     17.93MB
```
