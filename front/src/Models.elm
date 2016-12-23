module Models exposing (..)

import Players.Models exposing (Player)
import Routing


type alias Model =
    { players : List Player
    , route : Routing.Route
    , scrolled : Bool
    }


initialModel : Routing.Route -> Model
initialModel route =
    { players = []
    , route = route
    , scrolled = False
    }
