
### Approach using Conda and PyCall

using Conda
Conda.add("yfinance")
using PyCall

const yfinance = PyNULL()

function __init__()
    copy!(yfinance, pyimport_conda("yfinance", "yfinance"))
end
