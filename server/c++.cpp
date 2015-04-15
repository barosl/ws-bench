#include <websocketpp/server.hpp>
#include <websocketpp/config/asio_no_tls.hpp>

using websocketpp::server;
using websocketpp::config::asio;
using websocketpp::connection_hdl;
using websocketpp::lib::bind;
using websocketpp::lib::placeholders::_1;
using websocketpp::lib::placeholders::_2;

static std::vector<connection_hdl> socks;

static void on_open(connection_hdl sock) {
    socks.push_back(sock);
}

static void on_msg(server<asio> *serv, connection_hdl sock, server<asio>::message_ptr msg) {
    for (auto it=socks.begin();it!=socks.end();++it) {
        serv->send(*it, msg->get_payload(), msg->get_opcode());
    }
}

int main() {
    server<asio> serv;

    serv.clear_access_channels(websocketpp::log::alevel::all);

    serv.set_open_handler(bind(&on_open, ::_1));
    serv.set_message_handler(bind(&on_msg, &serv, ::_1, ::_2));

    serv.init_asio();
    serv.set_reuse_addr(true);

    serv.listen(5000);
    serv.start_accept();

    serv.run();

    return 0;
}
