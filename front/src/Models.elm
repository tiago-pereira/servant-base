module Models exposing (..)

import Players.Models exposing (Player)
import Stocks.Models
import Routing


type alias Model =
    { players : List Player
    , stocks : Stocks.Models.Model
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { players = []
    , stocks = Stocks.Models.initialModel
    , route = route
    }
