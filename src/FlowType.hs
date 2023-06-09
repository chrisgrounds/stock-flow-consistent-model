module FlowType where

data FlowType
  = PrivateExpenditure
  | GovernmentExpenditureOnGoods
  | GovernmentExpenditureOnServices
  | GovernmentExpenditureOnInterestPayments
  deriving (Show, Eq)