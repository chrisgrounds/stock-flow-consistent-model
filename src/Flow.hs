module Flow where

import FlowPairs (ValidFlowPairs)
import FlowType (FlowType)
import Sector

data Flow = Flow
  { flowType :: FlowType,
    flowFrom :: Sector,
    flowTo :: Sector,
    flowAmount :: Float
  }
  deriving (Show, Eq)

data FlowStatus
  = FlowValid
  | FlowInvalid
  deriving (Show, Eq)

validateFlow :: Flow -> ValidFlowPairs -> FlowStatus
validateFlow _ [] = FlowInvalid
validateFlow (Flow flowType flowFrom flowTo _) pairs =
  if (flowType, (flowFrom, flowTo)) `elem` pairs
    then FlowValid
    else FlowInvalid
