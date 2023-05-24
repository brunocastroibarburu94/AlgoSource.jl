module YFinance
### Approach using Conda and PyCall

using Conda
using PyCall
using CSV
using DataFrames


export pyconn
export interday_data

const pyconn = PyNULL()

function __init__()
    Conda.add("yfinance")
    copy!(pyconn, pyimport_conda("yfinance", "yfinance"))
end

_name_cleaner(x)=strip(replace(replace(x,r"Column[0-9_]"=>"") , r"[0-9]"=>""),'_')


"""
    download(tickers,start_date,end_date)

Downloads interday data from tickers between a start and an end date.
Returns a DataFrame object with the columns
"""
function interday_data(tickers,start_date,end_date)
    raw_data = pyconn.download(tickers;:start=>start_date,:end=>end_date) # Python object 
    df=CSV.read(IOBuffer(raw_data.to_csv()), DataFrame;header=[1,2,3]) # DataFrame (columns are rough)
    rename!(_name_cleaner, df)
    return df
end

end