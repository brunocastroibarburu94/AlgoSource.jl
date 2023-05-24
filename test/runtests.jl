using AlgoSource
using Test
using DataFrames
using CSV
@testset "AlgoSource.jl" begin
    @test AlgoSource.greet_your_package_name() == "Hello AlgoSource"
    @test AlgoSource.greet_your_package_name() != "Hello world!"

    # Extract data from yahooFinance and convert to DataFrames (test is just counting the rows)
    ticker = ["AAPL", "BA", "KO", "GOOGL", "DIS", "XOM"]
    stocks = AlgoSource.yfinance.download(ticker;:start=>"2012-01-01",:end=>"2012-02-01")
    csv_data=CSV.read(IOBuffer(stocks.to_csv()), DataFrame;header=[1,2,3])
    @test size(csv_data)[1]==20

end
