module Stocks.Update exposing (..)

import Stocks.Messages exposing (Msg(..))
import Stocks.Models exposing (Stock, Model)
import Navigation
import Material


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Mdl message' ->
            Material.update message' model

        Raise stock k ->
            let
                newStocks =
                    List.map
                        (\s ->
                            if s.id == stock.id then
                                { s | raised = k }
                            else
                                s
                        )
                        model.stocks
            in
                ( { model | stocks = newStocks }, Cmd.none )

        FetchAllDone newStocks ->
            ( { model | stocks = newStocks }, Cmd.none )

        FetchAllFail error ->
            ( model, Cmd.none )

        ShowStocks ->
            ( model, Navigation.newUrl "#stocks" )

        ShowStock id ->
            ( model, Navigation.newUrl ("#stocks/" ++ (toString id)) )
