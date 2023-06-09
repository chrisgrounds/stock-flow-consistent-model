module Economy where

import Flow (Flow (..))
import Sector (Sector (..))
import Stock (Stock (..), updateStock)

data Economy = Economy
  { stocks :: [Stock],
    flows :: [Flow]
  }
  deriving (Show, Eq)

emptyEconomy :: Economy
emptyEconomy =
  Economy
    { stocks =
        [ Stock {sector = Household, value = 0},
          Stock {sector = Firms, value = 0},
          Stock {sector = Banks, value = 0},
          Stock {sector = Government, value = 0},
          Stock {sector = InterestPool, value = 0},
          Stock {sector = Foreign, value = 0}
        ],
      flows = []
    }

updateEconomy :: Economy -> Flow -> Economy
updateEconomy e flow = e {stocks = updatedStocks, flows = flows e ++ [flow]}
  where
    updatedStocks = map (updateStock flow) (stocks e)
