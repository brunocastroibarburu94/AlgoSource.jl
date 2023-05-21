# Julia Development Environment
Empty template for a new project using Julia, this version is using Julia 1.8.5-bullseye, ammend Dockerfile to change to the version of Julia you want to use.

### Creating an SSH key
```bash
ssh-keygen -t ed25519 -C "your@email.com"
chmod 400 ~/.ssh/id_ed25519 # Set read only permissions for  your key (surface it in /root/.ssh) it saves time as is the default configuration.
```

### Package Management ###
When developing using Docker, all the packages from the Manifest.toml will be installed during the build process.

To add/remove/update additional packages when developing, run a docker container and using the bash command line type
```bash
make julia
```
This will open a julia console using the project under "./project/". Press "]" to open the Pkg REPL and then proceed to add/remove/update packages.
```bash
add JuMP
```

### Executing files
If you want to run the julia script from a command line then just do
```bash
/path/to/julia script-name.jl
```
In the shell of your choice.

If you want to run it from the julia repl then you want something like so:
```bash
julia> include("path/to/script-name.jl")
```

### Debbugging
When using VScode as your editor, there are plugins to easily put breakpoints in your code.<br>

When running Julia from a command line do the following.
1. Edit the code in the file you want to inspect
```julia
# Some Code 
using Infiltrator
# Some more Code
@infiltrate true 
```
1. Open a Julia REPL console
```bash
make julia
```
1. Run the file from your REPL console
```julia
include("./src/main.jl")
```

Unlike Python, at the moment there is no way of executing a Julia script heat a breakpoint and open a console, the two options above are the only ways (I know of) to enter a debugging environment.