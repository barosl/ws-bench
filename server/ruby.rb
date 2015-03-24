require 'faye/websocket'

socks = []

Server = lambda do |env|
    if Faye::WebSocket.websocket?(env)
        sock = Faye::WebSocket.new(env)

        socks.push(sock)

        sock.on :message do |event|
            for sock in socks
                sock.send(event.data)
            end
        end
    end
end

Faye::WebSocket.load_adapter('thin')

thin = Rack::Handler.get('thin')

thin.run(Server, :Port => 5000, :Host => '0.0.0.0')
