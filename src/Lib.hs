module Lib where

import           Network.Wai                    ( Application
                                                , responseLBS
                                                )
import           Network.HTTP.Types             ( status200 )
import           Html                           ( lucidHtml )
import           Lucid                          ( renderBST )

app :: Application
app _ respond = do
    bs <- renderBST lucidHtml
    respond $ responseLBS status200 [] bs
