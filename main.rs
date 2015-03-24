extern crate websocket;

use websocket::{Server, Message, Sender, Receiver, WebSocketStream};
use std::thread;
use std::sync::{Mutex, Arc};

fn broadcast(wrs: &mut Vec<websocket::server::sender::Sender<WebSocketStream>>, text: String) {
    let msg = Message::Text(text.to_string());

    for wr in wrs {
        wr.send_message(msg.clone());
    }
}

fn main() {
    let server = Server::bind(("0.0.0.0", 5000)).unwrap();
    let wrs = Arc::new(Mutex::new(Vec::new()));

    for conn in server {
        let wrs = wrs.clone();

        thread::spawn(move || {
            let req = conn.unwrap().read_request().unwrap();
            let cli = req.accept().send().unwrap();

            let (mut wr, mut rd) = cli.split();

            wr.send_message(Message::Text("Welcome from Rust!".to_string()));

            wrs.lock().unwrap().push(wr);

            for msg in rd.incoming_messages() {
                if let Message::Text(text) = msg.unwrap() {
                    broadcast(&mut *wrs.lock().unwrap(), text);
                }
            }
        });
    }
}
