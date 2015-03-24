import websockets
import asyncio
import time
import random

def proc():
    sock = yield from websockets.connect('ws://157.7.137.100:5000')

    def receiver(sock):
        while True:
            text = yield from sock.recv()
            if not text: break

            #print(text)

    asyncio.async(receiver(sock))

    while True:
        yield from sock.send('!!')

        yield from asyncio.sleep(random.random() / 5 + 0.9)

for i in range(100):
    asyncio.async(proc())

asyncio.get_event_loop().run_forever()
