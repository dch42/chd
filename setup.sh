#!/bin/sh

declare personal_bin="/Users/$USER/bin"
declare cfg=".bash_profile"
declare script="chda"

declare grn="\e[0;92m"
declare red="\e[0;91m"
declare reset="\e[0m"

function make_dir {
    printf "Creating dir $personal_bin...\n" && 
    mkdir $personal_bin
    }

function add_to_path {
    printf "Adding '$personal_bin' to \$PATH in $cfg...\n" & 
    echo export PATH="$personal_bin:\$PATH" >> /Users/$USER/$cfg
}

 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
###############################################################
 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

printf "\nAttempting installation of script '$script'...\n\n"

[ -n $ZSH_VERSION ] && 
cfg=".zprofile"

[[ ! -d $personal_bin ]] && 
make_dir ||
printf "'$personal_bin' exists...\n"

grep -q "$personal_bin" /Users/$USER/$cfg && 
printf "'$personal_bin' already in \$PATH...\n" ||
add_to_path

chmod +x ./${script}.sh &&
cp ./${script}.sh $personal_bin/${script} &&
printf "\n${grn}[SUCCESS]${reset} Script $script installed at '$personal_bin/$script'!\n\nInvoke with '$script -h' for more information.\n\n" ||
printf "\n${red}[ERROR]${reset} Something went wrong...\n\n"