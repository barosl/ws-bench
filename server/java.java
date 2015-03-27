import java.util.ArrayList;
import java.util.Collection;
import org.java_websocket.WebSocket;
import org.java_websocket.server.WebSocketServer;
import org.java_websocket.handshake.ClientHandshake;
import java.net.InetSocketAddress;
import java.net.UnknownHostException;

class Global {
    static ArrayList<WebSocket> socks = new ArrayList<WebSocket>();
}

class Server extends WebSocketServer {
    public Server(InetSocketAddress addr) throws UnknownHostException {
        super(addr);
    }

    @Override
    public void onOpen(WebSocket sock, ClientHandshake hs) {
        Global.socks.add(sock);
    }

    @Override
    public void onError(WebSocket sock, Exception e) {
        e.printStackTrace();
    }

    @Override
    public void onMessage(WebSocket sock_from, String msg) {
        Collection<WebSocket> socks = connections();

        for (WebSocket sock: socks) {
            sock.send(msg);
        }
    }

    @Override
    public void onClose(WebSocket sock, int code, String reason, boolean remote) {
    }
}

public class Main {
    public static void main(String[] args) throws UnknownHostException {
        Server server = new Server(new InetSocketAddress(5000));
        server.start();
    }
}
