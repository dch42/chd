#!/bin/sh

declare archive=$(printf '%q' "$1")
declare name=$(basename "${archive%.*}")

function install_deps {
    declare local dep=$1
    echo "Installing dependency $dep..."
    case "${dep}" in 
        7z) eval brew install p7zip ;;
        chdman) eval brew install rom-tools ;;
        brew) /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    esac
}

# check dependencies

for dep in brew 7z chdman;
do
    while command -v $dep &> /dev/null
    do
        echo "==> $dep not installed. ❌"
        install_deps "$dep"
    done
done

eval 7z e $archive
eval chdman createcd -v -i "${name}.cue" -o "${name}.chd"
echo "Done!"
exit 0