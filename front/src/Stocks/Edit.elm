module Stocks.Edit exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)
import Html.Attributes exposing (class)
import Debug
import Stocks.Messages exposing (..)
import Stocks.Models exposing (Stock, Model)
import Material.Card as Card
import Material.Color as Color
import Material.Elevation as Elevation
import Material.Options as Options exposing (cs, css)
import Material.Typography as Typography


view : Stock -> Html Msg
view stock =
    div []
        [ nav stock
        , form stock
        ]


nav : Stock -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listBtn ]


form : Stock -> Html Msg
form stock =
    div [ class "m3" ]
        [ h1 [] [ text stock.code ]
        , formLevel stock
        ]


formLevel : Stock -> Html Msg
formLevel stock =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Level" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString stock.code) ]
            , btnLevelDecrease stock
            , btnLevelIncrease stock
            ]
        ]


listBtn : Html Msg
listBtn =
    button
        [ class "btn regular"
        , onClick ShowStocks
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]


btnLevelDecrease : Stock -> Html Msg
btnLevelDecrease stock =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-minus-circle" ] [] ]


btnLevelIncrease : Stock -> Html Msg
btnLevelIncrease stock =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-plus-circle" ] [] ]
