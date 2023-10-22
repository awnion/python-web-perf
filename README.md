# Performance Test

## Spec

```yaml
CPU:    Apple M2 Max
Memory: 7224MiB / 32768MiB
OS:     macOS 14.0 23A344 arm64
Host:   Mac14,5
Kernel: 23.0.0
```

## Versions

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

## test 1

```haskell
===========================================================
Test: python3.10
===========================================================
Running 15s test @ http://localhost:5007
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.90ms    5.79ms 138.86ms   91.95%
    Req/Sec    34.75k     3.86k   45.31k    66.17%
  2074517 requests in 15.01s, 259.17MB read
  Socket errors: connect 0, read 65, write 0, timeout 0
Requests/sec: 138243.38
Transfer/sec:     17.27MB
===========================================================
Test: python3.11
===========================================================
Running 15s test @ http://localhost:5007
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.76ms    5.39ms 132.78ms   91.37%
    Req/Sec    36.82k     4.32k   78.96k    83.69%
  2202440 requests in 15.10s, 275.15MB read
  Socket errors: connect 0, read 63, write 0, timeout 0
Requests/sec: 145838.81
Transfer/sec:     18.22MB
===========================================================
Test: python3.12
===========================================================
Running 15s test @ http://localhost:5007
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     3.24ms    6.28ms  96.71ms   90.33%
    Req/Sec    36.91k     5.73k   56.92k    76.83%
  2206726 requests in 15.06s, 275.69MB read
  Socket errors: connect 0, read 63, write 0, timeout 0
Requests/sec: 146501.26
Transfer/sec:     18.30MB
```

## test 2 (json endpoint)

```haskell
===========================================================
Test: python3.10
===========================================================
Running 15s test @ http://localhost:5008/json
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.99ms    6.56ms 138.07ms   93.50%
    Req/Sec    32.42k     2.78k   42.62k    68.54%
  1949199 requests in 15.10s, 263.96MB read
  Socket errors: connect 0, read 65, write 0, timeout 0
Requests/sec: 129046.92
Transfer/sec:     17.48MB
===========================================================
Test: python3.11
===========================================================
Running 15s test @ http://localhost:5008/json
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.54ms    4.69ms 129.10ms   91.77%
    Req/Sec    35.40k     2.64k   63.70k    80.07%
  2119702 requests in 15.10s, 287.05MB read
  Socket errors: connect 0, read 65, write 0, timeout 0
Requests/sec: 140365.09
Transfer/sec:     19.01MB
===========================================================
Test: python3.12
===========================================================
Running 15s test @ http://localhost:5008/json
  4 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.74ms    5.69ms 156.64ms   92.42%
    Req/Sec    35.67k     4.24k   49.42k    83.25%
  2140803 requests in 15.10s, 289.91MB read
  Socket errors: connect 0, read 63, write 0, timeout 0
Requests/sec: 141741.16
Transfer/sec:     19.19MB
```
