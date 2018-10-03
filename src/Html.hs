{-# LANGUAGE OverloadedStrings #-}

module Html where

import           Control.Monad.IO.Class         ( MonadIO
                                                , liftIO
                                                )
import           Data.List                      ( intercalate )
import           Lucid
import           Clay                           ( render )
import           Css                            ( clayCss )
import           Js                             ( sunroofJs )
import           IdClass

lucidHtml :: MonadIO m => HtmlT m ()
lucidHtml = do
    doctype_
    html_ $ do
        head_ $ do
            meta_ [charset_ "UTF-8"]
            -- recet css
            style_
                [ rel_ "stylesheet"
                , src_ "https://unpkg.com/ress/dist/ress.min.css"
                ]
                ("" :: String)
            -- jquery
            script_
                [ src_ "https://code.jquery.com/jquery-3.3.1.min.js"
                , integrity_
                    "sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
                , crossorigin_ "anonymous"
                ]
                ("" :: String)
            -- put css
            style_ [type_ "text/css"] $ render clayCss
            title_ "haskellでモダンなフロントエンド開発"
        body_ $ do
            div_ [toAttr (Class Container)] $ do
                h1_ [] "haskellでモダンなフロントエンド開発"
                h2_ [] "怠惰"
                pre_ []
                    . toHtml
                    . intercalate "\n"
                    $ [ "全体の労力を減らすために手間を惜しまない気質。"
                      , "この気質の持ち主は、役立つプログラムを書いてみんなの苦労を減らしたり、同じ質問に何度も答えなくてもいいように文書を書いたりする。"
                      , "よって、プログラマーの第一の美徳である。"
                      ]
                div_ [] $ button_
                    [toAttr (Id ActionButton), toAttr (Class Button)]
                    "押すなよ、絶対押すなよ！"
            -- put js
            js <- liftIO sunroofJs
            script_ [type_ "text/javascript"] js

