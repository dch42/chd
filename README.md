# chda

Simple shell script to expedite converting archived .bin/.cue pairs to compressed MAME .chd files using [p7zip](https://github.com/jinfeihan57/p7zip) & [chdman](https://github.com/mamedev/mame).

## Installation

Clone the repo and run setup.sh:

~~~
git clone https://github.com/dch42/chda.git && cd chda && chmod +x ./setup.sh && ./setup.sh
~~~

Running `setup.sh` will install the script as `chda` in /Users/$USER/bin and add to $PATH.

## Usage

Simply invoke as:
~~~
chda Super\ Cool\ Game\ \(USA\).zip
~~~

The script will unpack the archive, pass the .cue file to `chdman`, and cleanup the unpacked files when finished.