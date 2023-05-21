run:
	julia --project=./project ./srjumpstart_srcc/main.jl 

julia:
	julia --project=./project

createPackage:
	julia --project=./project ./jumpstart_src/new_package.jl

test:
	julia --project=./project ./jumpstart_src/main.jl

sync:
	julia --project=./project -e 'using Pkg; Pkg.instantiate()'

pluto:
	julia --project=./project ./jumpstart_src/launch_pluto.jl

setgit:
	git config --global user.email ${GITHUB_EMAIL}
	git config --global user.name ${GITHUB_NAME}