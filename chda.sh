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

function cleanup {
    declare local name="$1"
    for ext in cue bin;
    do
        eval rm -v ${name}*.${ext}
    done
}

# check dependencies

for dep in brew 7z chdman;
do
    while ! command -v $dep &> /dev/null
    do
        echo "==> $dep not installed. ❌"
        install_deps "$dep"
    done
done

# unpack archive & create chd

echo "Unpacking archive $archive..."
eval 7z e $archive
echo "Creating CHD file '${name}.chd'..."
eval chdman createcd -v -i "${name}.cue" -o "${name}.chd" &&
echo "[SUCCESS] ${name}.chd created!" ||
echo "[ERROR] Something went wrong..."

# rm unpacked bin/cue files

echo "Cleaning up unpacked bin/cue files..."
cleanup "$name"

echo "Done!"
exit 0