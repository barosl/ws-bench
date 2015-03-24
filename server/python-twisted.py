from autobahn.twisted.websocket import WebSocketServerProtocol, WebSocketServerFactory
from twisted.internet import reactor

socks = []

class Server(WebSocketServerProtocol):
    def onOpen(self):
        socks.append(self)

    def onMessage(self, payload, is_bin):
        for sock in socks:
            sock.sendMessage(payload, is_bin)

factory = WebSocketServerFactory('ws://localhost:5000', debug=True)
factory.protocol = Server

reactor.listenTCP(5000, factory)
reactor.run()
