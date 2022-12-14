from pandas_datareader import data
import datetime

start = datetime.datetime(2017, 10, 4)
end = datetime.datetime(2017, 12, 4)

#SAM is boston beer company, fitting for any college student
f = data.DataReader("SAM", 'yahoo', start, end)
f.to_csv('stocks.csv')

