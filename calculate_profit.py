def check_profitability(amount, gas_price, arb_spread):
    aave_fee = amount * 0.0005
    gross_profit = amount * arb_spread
    net_profit = gross_profit - aave_fee - (gas_price * 210000)
    return net_profit > 0
