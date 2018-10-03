module Js where

import           Prelude                 hiding ( log )
import           Data.Default.Class             ( def )
import           Language.Sunroof
import           Language.Sunroof.JS.Browser
import           Language.Sunroof.JS.JQuery
import           IdClass

sunroofJs :: IO String
sunroofJs = sunroofCompileJSA def "main" content

-- | NOTE: unsafe
content :: JSA ()
content = jq "body" >>= on
    "click"
    (toAttr (Id ActionButton))
    (\() -> do
        this # attr "innerText" := ("もうどうにでもな～れ" :: JSString)
        alert "∩(´･ω･`)つ―*``*:.｡. .｡.:*･゜ﾟ･*"
    )
