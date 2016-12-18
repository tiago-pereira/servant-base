module Stocks.Models exposing (..)

import Material


type alias Stock =
    { id : Int
    , currentPrice : Float
    , code : String
    , buyPrice : Float
    , sellPrice : Maybe Float
    , amount : Int
    , revenue : Float
    , raised : Int
    }


type alias Model =
    { stocks : List Stock
    , mdl : Material.Model
    }


initialModel : Model
initialModel =
    { stocks = []
    , mdl = Material.model
    }
