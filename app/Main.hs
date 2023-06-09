{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import DefaultFlows
import Economy (emptyEconomy, updateEconomy)
import Flow (validateFlow)
import FlowPairs (validFlowPairs)

main :: IO ()
main = do
  print $ validateFlow (privateExpenditureFlow 10) validFlowPairs
  let e' = updateEconomy emptyEconomy (privateExpenditureFlow 10)
  print e'
