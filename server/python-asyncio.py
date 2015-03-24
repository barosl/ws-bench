import websockets
import asyncio

socks = []

def proc(sock, path):
    socks.append(sock)

    while True:
        data = yield from sock.recv()

        for cur_sock in socks:
            yield from cur_sock.send(data)

asyncio.async(websockets.serve(proc, '', 5000))

asyncio.get_event_loop().run_forever()
