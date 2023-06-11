module Stock where

import Flow (Flow (..))
import Sector (Sector)

data Stock = Stock
  { sector :: Sector,
    value :: Float
  }
  deriving (Show, Eq)

updateStock :: Flow -> Stock -> Stock
updateStock flow stock
  | sector stock == flowTo flow = Stock (sector stock) (value stock + flowAmount flow)
  | sector stock == flowFrom flow = Stock (sector stock) (value stock - flowAmount flow)
  | otherwise = stock