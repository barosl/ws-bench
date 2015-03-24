var ws = require('nodejs-websocket');

var socks = [];

var server = ws.createServer(function(sock) {
    socks.push(sock);

    sock.on('text', function(text) {
        for (var i=0;i<socks.length;i++) {
            socks[i].sendText(text);
        }
    });
}).listen(5000);
