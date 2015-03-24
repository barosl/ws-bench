package main

import (
    "github.com/gorilla/websocket"
    "net/http"
    "log"
)

var upgrader = websocket.Upgrader {
    CheckOrigin: func(req *http.Request) bool { return true },
}

var socks = make(map[*websocket.Conn]bool)

func index(wr http.ResponseWriter, rd *http.Request) {
    sock, err := upgrader.Upgrade(wr, rd, nil)
    if err != nil {
        log.Println("Upgrade", err)
        return
    }

    socks[sock] = true

    for {
        _, msg, err := sock.ReadMessage()
        if err != nil {
            log.Println("ReadMessage", err)
            break
        }

        for sock := range socks {
            err2 := sock.WriteMessage(websocket.TextMessage, msg)
            if err2 != nil {
                log.Println("write", err)
                break
            }
        }
    }
}

func main() {
    http.HandleFunc("/", index)

    err := http.ListenAndServe("0.0.0.0:5000", nil)
    if err != nil {
        log.Fatal("ListenAndServe", err)
    }
}
