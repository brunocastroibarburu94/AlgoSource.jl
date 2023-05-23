using AlgoSource
using Test

@testset "AlgoSource.jl" begin
    @test AlgoSource.greet_your_package_name() == "Hello AlgoSource"
    @test AlgoSource.greet_your_package_name() != "Hello world!"
end
