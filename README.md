## Scientific™ WebSocket server benchmark

100 concurrent connections had been made.

The test was done using a virtual machine, which gives the test results even more credibility.

### Rust

| Type   | (%) |     |     |     |     |     |
| ------ | --- | --- |---- | --- | --- | --- |
| CPU    | 3.4 | 3.5 | 3.6 | 3.5 | 3.8 | 3.8 |
| Memory | 0.4 | 0.4 | 0.6 | 0.6 | 0.6 | 0.6 |

### Lua (LuaJIT)

| Type   | (%) |     |     |     |     |     |
| ------ | --- | --- |---- | --- | --- | --- |
| CPU    | 4.3 | 4.6 | 4.7 | 4.7 | 4.8 | 5.0 |
| Memory | 0.2 | 0.2 | 0.2 | 0.2 | 0.2 | 0.2 |

### Java

| Type   | (%) |     |     |     |
| ------ | --- | --- | --- | --- |
| CPU    | 8.2 | 8.2 | 8.2 | 8.2 |
| Memory | 3.1 | 3.2 | 3.2 | 3.3 |

### Haskell

| Type   | (%) |     |     |     |
| ------ | --- | --- | --- | --- |
| CPU    | 8.4 | 8.5 | 9.2 | 9.4 |
| Memory | 0.5 | 0.5 | 0.5 | 0.5 |

### Go

| Type   | (%)  |      |      |      |      |      |
| ------ | ---- | ---- | ---- | ---- | ---- | ---- |
| CPU    | 11.4 | 11.4 | 11.5 | 11.6 | 11.6 | 11.6 |
| Memory | 0.4  | 0.4  | 0.4  | 0.4  | 0.4  | 0.4  |

### JavaScript (io.js)

| Type   | (%)  |      |      |      |      |      |
| ------ | ---- | ---- | ---- | ---- | ---- | ---- |
| CPU    | 12.0 | 12.2 | 13.4 | 13.9 | 14.4 | 15.1 |
| Memory | 1.9  | 1.9  | 1.9  | 1.9  | 2.7  | 3.6  |

### Python (asyncio)

| Type   | (%)  |      |      |      |      |
| ------ | ---- | ---- | ---- | ---- | ---- |
| CPU    | 33.5 | 33.6 | 33.7 | 33.7 | 33.9 |
| Memory | 1.0  | 1.0  | 1.0  | 1.0  | 1.0  |

### Ruby

| Type   | (%)  |      |      |      |      |      |
| ------ | ---- | ---- | ---- | ---- | ---- | ---- |
| CPU    | 35.7 | 35.9 | 36.0 | 36.2 | 36.5 | 36.8 |
| Memory | 1.1  | 1.1  | 1.1  | 1.1  | 1.1  | 1.1  |

### Python (Twisted)

| Type   | (%)  |      |      |      |
| ------ | ---- | ---- | ---- | ---- |
| CPU    | 80.5 | 80.5 | 80.6 | 80.7 |
| Memory | 0.9  | 0.9  | 0.9  | 0.9  |
