# chd

Simple shell script to expedite converting archived .bin/.cue pairs to compressed MAME .chd files using [p7zip](https://github.com/jinfeihan57/p7zip) & [chdman](https://github.com/mamedev/mame).

## Installation

Clone the repo and run setup.sh:

~~~
git clone https://github.com/dch42/chd.git && cd chd && chmod +x ./setup.sh && ./setup.sh
~~~

Running `setup.sh` will install the script as `chd` in Users/$USER/bin and add $PATH.

## Usage

Simply invoke as:
~~~
chd Super\ Cool\ Game\ \(USA\).zip
~~~

The script will unpack the archive, pass the .cue file to `chdman`, and cleanup the unpacked files when finished.