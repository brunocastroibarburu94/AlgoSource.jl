using AlgoSource
using Test
using DataFrames
using CSV

@testset "AlgoSource.jl" begin
    # AlgoSource sanity check
    @test AlgoSource.greet_your_package_name() == "Hello AlgoSource"
    @test AlgoSource.greet_your_package_name() != "Hello world!"

    # Python connection test
    # Extract data from yahooFinance and convert to DataFrames (test is just counting the rows)
    ticker = ["AAPL", "BA", "KO", "GOOGL", "DIS", "XOM"]
    stocks = AlgoSource.YFinance.pyconn.download(ticker;:start=>"2012-01-01",:end=>"2012-02-01")
    csv_data=CSV.read(IOBuffer(stocks.to_csv()), DataFrame;header=[1,2,3])
    @test size(csv_data)[1]==20
    
    # YFinance.interday_data test
    start_date="2012-01-01"
    end_date="2012-02-01"
    csv_data2=AlgoSource.YFinance.interday_data(ticker,start_date,end_date)
    @test size(csv_data2)[1]==20
end
