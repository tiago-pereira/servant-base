module Players.List exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Players.Messages exposing (..)
import Players.Models exposing (Player)


view : List Player -> Html Msg
view players =
    div [ class "blog__page" ]
        [ list players
        ]


list : List Player -> Html Msg
list players =
    div [ class "p2" ]
        [ Html.section [] (List.map postCard players) ]


editBtn : Player -> Html Msg
editBtn player =
    button
        [ class "btn regular"
        , onClick (ShowPlayer player.id)
        ]
        [ i [ class "fa fa-pencil mr1" ] [], text "Edit" ]


postCard : Player -> Html Msg
postCard player =
    Html.article [ class "post-section" ]
        [ div [ class "post-section__card" ]
            [ Html.h1 [] [ text "TITULO" ]
            , Html.p [] [ text "Esse aqui é um teste de post que eu to escrevendo, esse é o sumário, convida o usuário a ler esse post" ]
            ]
        ]
