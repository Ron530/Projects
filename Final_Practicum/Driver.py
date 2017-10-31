import pandas as pd
import pandas_datareader.data as web
#import pandas.io.data as web   # Package and modules for importing data; this code may change depending on pandas version
import datetime
import matplotlib.pyplot as plt
from matplotlib.dates import date2num
import pylab
from matplotlib.dates import DateFormatter, WeekdayLocator, DayLocator, MONDAY
from matplotlib.finance import candlestick_ohlc
import numpy as np



%matplotlib inline


start = datetime.datetime(2010, 1, 1)
end = datetime.datetime(2013, 1, 27)
amzn = web.get_quote_yahoo('AMZN')

f = web.DataReader("F", 'google', start, end)

start = datetime.datetime(2016,2,24)
end = datetime.date.today()

techstocks= ["TSLA","AAPL","MSFT","GOOG","AMD","NVDA"]

nividia = web.DataReader("NVDA", "google", start, end)
amd = web.DataReader("AMD", "google", start, end)
tesla = web.DataReader("TSLA", "google", start, end)
apple = web.DataReader("AAPL", "google", start, end)
microsoft = web.DataReader("MSFT", "google", start, end)
google = web.DataReader("GOOG", "google", start, end)
SPY = web.DataReader("SPY", "google", start, end)
jdst=web.DataReader("JDST","google",start,end)
jnug= web.DataReader("JNUG","google",start,end)


pylab.rcParams['figure.figsize'] = (15, 9)   # Change the size of plots


jnug["10d"] =jnug["Close"].rolling(window=10, center = False).mean()
jnug["30d"] =jnug["Close"].rolling(window=30, center = False).mean()


jnug["10d"].plot(grid=True)
jnug["30d"].plot(grid=True)
jnug["Close"].plot(grid=True)






start = datetime.datetime(2016,2,4)
end = datetime.datetime(2016,3,22)


jdst = web.DataReader("GOOGL", "google", start, end)

adj_data = ohlc_adj(jdst)

# This next code repeats all the earlier analysis we did on the adjusted data
day1= "1d"
day2="2d"
dif="1d-2d"
adj_data[day1] = adj_data["Close"].rolling(window = 20, center = False).mean()
adj_data[day2] = adj_data["Close"].rolling(window = 50, center = False).mean()



adj_data[dif] = adj_data[day1] - adj_data[day2]

print (adj_data)

# np.where() is a vectorized if-else function, where a condition is checked for each component of a vector, and the first argument passed is used when the condition holds, and the other passed if it does not
adj_data["Regime"] = np.where(adj_data[dif] > 0, 1, 0)
# We have 1's for bullish regimes and 0's for everything else. Below I replace bearish regimes's values with -1, and to maintain the rest of the vector, the second argument is apple["Regime"]
adj_data["Regime"] = np.where(adj_data[dif] < 0, -1, adj_data["Regime"])
# To ensure that all trades close out, I temporarily change the regime of the last row to 0
regime_orig = adj_data.ix[-1, "Regime"]
adj_data.ix[-1, "Regime"] = 0
adj_data["Signal"] = np.sign(adj_data["Regime"] - adj_data["Regime"].shift(1))
# Restore original regime data
adj_data.ix[-1, "Regime"] = regime_orig

print (adj_data)

# Create a DataFrame with trades, including the price at the trade and the regime under which the trade is made.
adj_data_signals = pd.concat([
        pd.DataFrame({"Price": adj_data.loc[adj_data["Signal"] == 1, "Close"],
                     "Regime": adj_data.loc[adj_data["Signal"] == 1, "Regime"],
                     "Signal": "Buy"}),
        pd.DataFrame({"Price": adj_data.loc[adj_data["Signal"] == -1, "Close"],
                     "Regime": adj_data.loc[adj_data["Signal"] == -1, "Regime"],
                     "Signal": "Sell"}),
    ])



adj_data_signals.sort_index(inplace = True)

#print (adj_data["Signal"])
#print (adj_data_signals)



adj_data_long_profits = pd.DataFrame({
        "Price": adj_data_signals.loc[(adj_data_signals["Signal"] == "Buy") &
                                  adj_data_signals["Regime"] == 1, "Price"],
        "Profit": pd.Series(adj_data_signals["Price"] - adj_data_signals["Price"].shift(1)).loc[
            adj_data_signals.loc[(adj_data_signals["Signal"].shift(1) == "Buy") & (adj_data_signals["Regime"].shift(1) == 1)].index
        ].tolist(),
        "End Date": adj_data_signals["Price"].loc[
            adj_data_signals.loc[(adj_data_signals["Signal"].shift(1) == "Buy") & (adj_data_signals["Regime"].shift(1) == 1)].index
        ].index
    })


print (adj_data_long_profits)




tradeperiods = pd.DataFrame({"Start": adj_data_long_profits.index,
                        "End": adj_data_long_profits["End Date"]})
#adj_data_long_profits["Low"] = tradeperiods.apply(lambda x: min(adj_data.loc[x["Start"]:x["End"], "Low"]), axis = 1)




cash = 10000
backtest = pd.DataFrame({"Start Port. Value": [],
                         "End Port. Value": [],
                         "End Date": [],
                         "Shares": [],
                         "Share Price": [],
                         "Trade Value": [],
                         "Profit per Share": [],
                         "Total Profit": [],
                         "Stop-Loss Triggered": []})
port_value = 1  # Max proportion of portfolio bet on any trade
batch = 1      # Number of shares bought per batch
stoploss = .03   # % of trade loss that would trigger a stoploss
for index, row in adj_data_long_profits.iterrows():
    temp=adj_data.loc[index:row["End Date"], "Close"]
    print (temp)
    batches = np.floor(cash * port_value) // np.ceil(batch * row["Price"]) # Maximum number of batches of stocks invested in
    trade_val = batches * batch * row["Price"] # How much money is put on the line with each trade
    
    
    [stop_trig,share_profit]=profitt(temp,stoploss)
    
    
        #if row["Low"] < (1 - stoploss) * row["Price"]:   # Account for the stop-loss
        #share_profit = (1 - stoploss) * row["Profit"]
            
        #else:
            #share_profit = row["Profit"]
            #stop_trig = False
    profit = share_profit * batches * batch # Compute profits
    # Add a row to the backtest data frame containing the results of the trade
    backtest = backtest.append(pd.DataFrame({
                "Start Port. Value": cash,
                "End Port. Value": cash + profit,
                "End Date": row["End Date"],
                "Shares": batch * batches,
                "Share Price": row["Price"],
                "Trade Value": trade_val,
                "Profit per Share": share_profit,
                "Total Profit": profit,
                "Stop-Loss Triggered": stop_trig
            }, index = [index]))
    cash = max(0, cash + profit)

backtest


n=len(backtest)
print (backtest)
#beggining=backtest["Start Port. Value"][0]
#ending=backtest["End Port. Value"][n-1]
#v= ending-beggining
#percentage= (v/beggining)*100
#print (percentage)
#backtest["End Port. Value"].plot()


adj_data[day1].plot(grid=True)
adj_data[day2].plot(grid=True)
jdst["Close"].plot(grid=True)
