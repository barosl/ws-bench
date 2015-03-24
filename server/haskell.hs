{-# language OverloadedStrings #-}

import qualified Network.WebSockets as WS
import Data.Text (Text)
import Control.Monad (forever, forM_)
import Data.IORef (newIORef, modifyIORef, readIORef, IORef)

broadcast :: IORef [WS.Connection] -> Text -> IO ()
broadcast socks text = do
    socks <- readIORef socks
    forM_ socks $ \x -> WS.sendTextData x text

app :: IORef [WS.Connection] -> WS.PendingConnection -> IO ()
app socks pending = do
    sock <- WS.acceptRequest pending

    WS.sendTextData sock ("Welcome from Haskell!" :: Text)

    modifyIORef socks $ \x -> sock : x

    forever $ do
        text <- WS.receiveData sock :: IO (Text)

        broadcast socks text

main :: IO ()
main = do
    socks <- newIORef []
    WS.runServer "0.0.0.0" 5000 $ app socks
