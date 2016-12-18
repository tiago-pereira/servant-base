module View exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.List
import Stocks.List
import Stocks.Edit
import Players.Edit
import Players.Models exposing (PlayerId)
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        StocksRoute ->
            Html.App.map StocksMsg (Stocks.List.view model.stocks)

        PlayersRoute ->
            Html.App.map PlayersMsg (Players.List.view model.players)

        PlayerRoute id ->
            playerEditPage model id

        StockRoute id ->
            stockEditPage model id

        NotFoundRoute ->
            notFoundView


stockEditPage : Model -> Int -> Html Msg
stockEditPage model stockId =
    let
        maybeStock =
            model.stocks.stocks
                |> List.filter (\stock -> stock.id == stockId)
                |> List.head
    in
        case maybeStock of
            Just stock ->
                Html.App.map StocksMsg (Stocks.Edit.view stock)

            Nothing ->
                notFoundView


playerEditPage : Model -> PlayerId -> Html Msg
playerEditPage model playerId =
    let
        maybePlayer =
            model.players
                |> List.filter (\player -> player.id == playerId)
                |> List.head
    in
        case maybePlayer of
            Just player ->
                Html.App.map PlayersMsg (Players.Edit.view player)

            Nothing ->
                notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
