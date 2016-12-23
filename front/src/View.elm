module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.List
import Players.Edit
import Players.Models exposing (PlayerId)
import Routing exposing (Route(..))
import Html.Attributes exposing (class)


view : Model -> Html Msg
view model =
    let
        hasScrolled =
              if model.scrolled then "blog has-scrolled" else "blog"
    in
        div [ class hasScrolled]
            [ nav model
            , page model ]

nav : Model -> Html Msg
nav model =
    div [class "blog__page__nav"][
        Html.nav [ class "blog__page__nav__wrapper" ]
                 [ div [ class "" ] [ text "Blog" ]
                 , div [ class "" ] [ text "Portfolio" ]
                 ]
        ]

page : Model -> Html Msg
page model =
    case model.route of

        PlayersRoute ->
            Html.map PlayersMsg (Players.List.view model.players)

        PlayerRoute id ->
            div [] [text <| toString model.scrolled , playerEditPage model id]

        NotFoundRoute ->
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
                Html.map PlayersMsg (Players.Edit.view player)

            Nothing ->
                notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
