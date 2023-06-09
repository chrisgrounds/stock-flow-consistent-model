module Sector where

data Sector
  = Household
  | Firms
  | Banks
  | Government
  | InterestPool
  | Foreign
  deriving (Show, Eq)