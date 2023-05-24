
### Approach using Conda and PyCall

using Conda
using PyCall

const yfinance = PyNULL()

function __init__()
    Conda.add("yfinance")
    copy!(yfinance, pyimport_conda("yfinance", "yfinance"))
end
