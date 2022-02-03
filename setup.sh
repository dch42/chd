#!/bin/sh

declare personal_bin="/Users/$USER/bin"
declare cfg=".bash_profile"
declare script="chda"

[ -n $ZSH_VERSION ] && 
cfg=".zprofile"

[[ -d $personal_bin ]] || mkdir $personal_bin &&
echo export PATH="$personal_bin:\$PATH" >> /Users/$USER/$cfg

chmod +x ./${script}.sh &&
cp ./${script}.sh $personal_bin/${script}