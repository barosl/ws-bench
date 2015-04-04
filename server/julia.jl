using HttpServer
using WebSockets

socks = WebSocket[]

handler = WebSocketHandler() do req, sock
    push!(socks, sock)

    while true
        msg = read(sock)

        for x=socks
            write(x, msg)
        end
    end
end

serv = Server(handler)
run(serv, 5000)
