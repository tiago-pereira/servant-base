module Players.Update exposing (..)

import Players.Messages exposing (Msg(..))
import Players.Models exposing (Player)
import Navigation


update : Msg -> List Player -> ( List Player, Cmd Msg )
update message players =
    case message of
        FetchAll (Ok newPlayers) ->
            ( newPlayers, Cmd.none )

        FetchAll (Err _) ->
            ( players, Cmd.none )

        ShowPlayers ->
            ( players, Navigation.newUrl "#players" )

        ShowPlayer id ->
            ( players, Navigation.newUrl ("#players/" ++ (toString id)) )
