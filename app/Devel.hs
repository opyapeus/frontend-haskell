module Devel where

import           Network.Wai.Handler.Warp       ( run )
import           Network.Wai.Middleware.RequestLogger
                                                ( logStdoutDev )
import           Control.Concurrent             ( threadDelay )
import           Control.Concurrent.Async       ( race_ )
import           System.Directory               ( doesFileExist )
import           System.Environment             ( getEnv )
import           Lib                            ( app )

-- | Yesod devel server for non-Yesod application
-- | ref: https://github.com/yesodweb/yesod/tree/master/yesod-bin/devel-example
main :: IO ()
main = race_ watchTermFile $ do
    port        <- fmap read $ getEnv "PORT"
    displayPort <- getEnv "DISPLAY_PORT"
    putStrLn $ "Running in development mode on port " ++ show port
    putStrLn $ "But you should connect to port " ++ displayPort
    run port $ logStdoutDev app

-- | Would certainly be more efficient to use fsnotify, but this is simpler.
watchTermFile :: IO ()
watchTermFile = loop
  where
    loop = do
        exists <- doesFileExist "yesod-devel/devel-terminate"
        if exists
            then return ()
            else do
                threadDelay 100000
                loop
