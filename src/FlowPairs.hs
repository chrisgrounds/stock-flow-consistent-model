module FlowPairs where

import FlowType (FlowType (..))
import Sector (Sector (..))

type ValidFlowPairs = [(FlowType, (Sector, Sector))]

validFlowPairs :: ValidFlowPairs
validFlowPairs =
  [ (PrivateExpenditure, (Household, Firms)),
    (GovernmentExpenditureOnGoods, (Government, Firms)),
    (GovernmentExpenditureOnServices, (Government, Firms)),
    (GovernmentExpenditureOnInterestPayments, (Government, InterestPool))
  ]