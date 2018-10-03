module Main where

import           Network.Wai.Handler.Warp       ( run )
import           Lib                            ( app )

-- | Just a server on port 3000
main :: IO ()
main = run 3000 app
