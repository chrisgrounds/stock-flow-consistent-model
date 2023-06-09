module Stock where

import Flow (Flow (..))
import Sector

data Stock = Stock
  { sector :: Sector,
    value :: Float
  }
  deriving (Show, Eq)

updateStock :: Flow -> Stock -> Stock
updateStock flow stock =
  if sector stock == flowTo flow
    then Stock (sector stock) (value stock + flowAmount flow)
    else
      if sector stock == flowFrom flow
        then Stock (sector stock) (value stock - flowAmount flow)
        else stock