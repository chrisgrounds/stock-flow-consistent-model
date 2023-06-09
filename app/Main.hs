{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

data FlowType
  = PrivateExpenditure
  | GovernmentExpenditureOnGoods
  | GovernmentExpenditureOnServices
  | GovernmentExpenditureOnInterestPayments
  deriving (Show, Eq)

data FlowStatus
  = FlowValid
  | FlowInvalid
  deriving (Show, Eq)

type ValidFlowPairs = [(FlowType, (Sector, Sector))]

validFlowPairs :: ValidFlowPairs
validFlowPairs =
  [ (PrivateExpenditure, (Household, Firms)),
    (GovernmentExpenditureOnGoods, (Government, Firms)),
    (GovernmentExpenditureOnServices, (Government, Firms)),
    (GovernmentExpenditureOnInterestPayments, (Government, InterestPool))
  ]

validateFlow :: Flow -> ValidFlowPairs -> FlowStatus
validateFlow _ [] = FlowInvalid
validateFlow (Flow flowType flowFrom flowTo _) pairs =
  if (flowType, (flowFrom, flowTo)) `elem` pairs
    then FlowValid
    else FlowInvalid

data Sector
  = Household
  | Firms
  | Banks
  | Government
  | InterestPool
  | Foreign
  deriving (Show, Eq)

data Stock = Stock
  { sector :: Sector,
    value :: Float
  }
  deriving (Show, Eq)

data Flow = Flow
  { flowType :: FlowType,
    flowFrom :: Sector,
    flowTo :: Sector,
    flowAmount :: Float
  }
  deriving (Show, Eq)

data Economy = Economy
  { stocks :: [Stock],
    flows :: [Flow]
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

processFlowEvent :: Economy -> Flow -> Economy
processFlowEvent e flow = e {stocks = updatedStocks, flows = flows e ++ [flow]}
  where
    updatedStocks = map (updateStock flow) (stocks e)

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

privateExpenditureFlow :: Float -> Flow
privateExpenditureFlow amount = Flow {flowType = PrivateExpenditure, flowFrom = Household, flowTo = Firms, flowAmount = amount}

main :: IO ()
main = do
  print $ validateFlow (privateExpenditureFlow 10) validFlowPairs
  let e' = processFlowEvent emptyEconomy (privateExpenditureFlow 10)
  print e'
