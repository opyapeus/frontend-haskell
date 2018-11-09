{-# LANGUAGE FlexibleInstances           #-}

module IdClass where

import           Data.Text                      ( pack )
import           Text.Casing                    ( kebab )
import           Lucid                          ( Attribute
                                                , id_
                                                , class_
                                                )
import           Clay                           ( Selector )
import           Clay.Selector                  ( selectorFromText )
import           Language.Sunroof               ( JSString
                                                , string
                                                )

-- | Type class for attribute types of each DSLs
class ToAttribute a where
    toAttr :: IdClass -> a

-- | Define toAttr function of html DSL
instance ToAttribute Attribute where
    toAttr (Id v) = id_ . pack . kebab . show $ v
    toAttr (Class v) = class_ . pack . kebab. show $ v

-- | Define toAttr function of css DSL
instance ToAttribute Selector where
    toAttr (Id v) = selectorFromText . mappend "#" . pack . kebab . show $ v
    toAttr (Class v) = selectorFromText . mappend "." . pack . kebab . show $ v

-- | Define toAttr function of js DSL
instance ToAttribute JSString where
    toAttr (Id v) = string . mappend "#" . kebab . show $ v
    toAttr (Class v) = string . mappend "." . kebab . show $ v

-- | Id and Class type
data IdClass = Id I | Class C
    deriving (Show, Eq)

-- | Define your ids
data I
    = ActionButton
    deriving (Show, Eq)

-- | Define your classes
data C
    = Container
    | Button
    deriving (Show, Eq)
