module DefaultFlows where

import Flow (Flow (..))
import FlowType (FlowType (..))
import Sector (Sector (..))

privateExpenditureFlow :: Float -> Flow
privateExpenditureFlow amount = Flow {flowType = PrivateExpenditure, flowFrom = Household, flowTo = Firms, flowAmount = amount}
