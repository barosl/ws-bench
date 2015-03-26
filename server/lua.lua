local copas = require 'copas'

socks = {}

local server = require 'websocket'.server.copas.listen {
    port = 5000,
    default = function(sock)
        socks[sock] = 0

        while true do
            local msg = sock:receive()

            if msg then
                for cur_sock, _ in pairs(socks) do
                    cur_sock:send(msg)
                end
            else
                sock:close()
                return
            end
        end
    end
}

copas.loop()
