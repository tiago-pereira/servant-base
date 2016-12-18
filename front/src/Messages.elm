module Messages exposing (..)

import Players.Messages
import Stocks.Messages


type Msg
    = PlayersMsg Players.Messages.Msg
    | StocksMsg Stocks.Messages.Msg
