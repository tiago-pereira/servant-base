port module Main exposing (..)

import Navigation exposing (Location)
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Players.Commands exposing (fetchAll)
import Routing exposing (Route)


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, Cmd.map PlayersMsg fetchAll )


port windowScrolled : (Bool -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    windowScrolled WindowScrolled


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
