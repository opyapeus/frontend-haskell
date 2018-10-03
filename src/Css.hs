module Css where

import           Clay
import           Data.List.NonEmpty
import           IdClass

halfPercent :: Size Percentage
halfPercent = 50

zero :: Size LengthUnit
zero = 0

clayCss :: Css
clayCss = do
    body ? do
        sym margin  zero
        sym padding zero
        fontSize (px 16)
        backgroundColor "#c0c0c0"

    "*:focus" ? outlineStyle none

    toAttr (Class Container) ? do
        sym2 padding 0 (em 1)
        h1 ? do
            color "#6144b3"
            fontSize (px 32)

    toAttr (Class Button) ? do
        backgroundColor "#6144b3"
        borderStyle none
        color "#ffffff"
        sym2 padding (px 15) (px 32)
        textAlign center
        textDecoration none
        display inlineBlock
        fontSize $ px 16
        sym2 margin (px 4) (px 2)
        cursor pointer
        transitionDuration $ sec 0.4

    toAttr (Class Button) # ":hover" ? do
        boxShadow $ fromList
            [ bsColor (rgba 0 0 0 0.24) $ shadowWithSpread 0 (px 12) (px 16) 0
            , bsColor (rgba 0 0 0 0.19) $ shadowWithSpread 0 (px 17) (px 50) 0
            ]
