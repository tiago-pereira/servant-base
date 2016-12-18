module Stocks.Messages exposing (..)

import Http
import Stocks.Models exposing (Stock, Model)
import Material


type Msg
    = FetchAllDone (List Stock)
    | FetchAllFail Http.Error
    | ShowStocks
    | ShowStock Int
    | Raise Stock Int
    | Mdl (Material.Msg Msg)
