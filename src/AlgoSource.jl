__precompile__() # this module is safe to precompile

module AlgoSource

export greet_your_package_name
export yfinance

include("functions.jl")
include("yfinance.jl")
end
