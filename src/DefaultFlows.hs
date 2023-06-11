module DefaultFlows where

import Flow (Flow (..))
import FlowType (FlowType (..))
import Sector (Sector (..))

flowEvent :: FlowType -> Sector -> Sector -> Float -> Flow
flowEvent flowType flowFrom flowTo amount =
  Flow
    { flowType = flowType,
      flowFrom = flowFrom,
      flowTo = flowTo,
      flowAmount = amount
    }

privateExpenditureFlow :: Float -> Flow
privateExpenditureFlow = flowEvent PrivateExpenditure Household Firms
