# stock-flow-consistent-model

SFC models are a class of macroeconomic models that were developed with the intention of ensuring that accounting identities hold true in all periods of simulation. These models are particularly useful for economic simulations as they maintain a precise and consistent account of stocks and flows within the system, ensuring that all resources are accounted for at any given point in time.

## Key Concepts

**Stocks**: These are quantities that are measured at one specific point in time. Examples include bank balances, debts, wealth, and number of employees in a firm.

**Flows**: These are quantities that are measured per unit of time. Examples include consumption, income, investment, and the number of people hired/fired.

**Consistency**: All flows in the model must come from somewhere and go somewhere - this is the main principle behind stock-flow consistency. For instance, if a household sector's income increases (a flow), there must be a corresponding increase in their bank balances (a stock) and a decrease in the stock that contributed to this flow. Conversely, if a household spends money (a flow), there should be a corresponding decrease in their bank balances and an increase in the respective stock that caused the flow.

On this model and as implemented, a flow like "tax" is a function from Sector to Sector which changes the stock of each sector.

## Getting Started

The model is built with Haskell. You can use stack to build and run:

```
stack build
stack run stock-flow-consistent-model-exe
```

## Contribution

I encourage contributions to this repository. Whether it's adding new models, improving the existing ones, or enhancing the documentation, all contributions are welcome. Please read through the contribution guidelines before submitting a pull request.

