if Sys.islinux()
    println("Hello, this is a Linux machine")
elseif Sys.iswindows()
    println("Hello, this is a Windows machine")
elseif Sys.isapple()
    println("Hello, this is a MacOS machine")
end