# anti-hangman
Anti-hangman like hangman games but it's difference, Using permutations method written in Bash script.

It's probably the easiest hangman-like game to play but why not give it a try? Have fun.


# Usage:


```bash anti-hangman.sh```

# Dependencies
- curl
- git
- crunch
- coreutils
- gawk
- gnugrep
- findutils

# Install

```sh
wget luisadha.github.io/anti-hangman && chmod +x ./anti-hangman
```

## install on Nix-on-droid

clone this project

```sh
git clone https://github.com/luisadha/anti-hangman.git && cd anti-hangman
```

a. build

```nix
nix-build
```
b. create nix virtual environment

```nix
nix-shell -p ./result
```
c. call the program

```sh
anti-hangman
```

## Tested
| Platform | Status |
| :---------------- | :------: | 
| Termux | ✅ | 
| Nix-on-droid | ✅ |

# References
- https://stackoverflow.com/questions/4687722/dynamic-case-statement-in-bash#19771433
- https://id.bitdegree.org/tutorial/ide-proyek-python
-https://github.com/jesstess/Scrabble/blob/master/scrabble/sowpods.txt
- https://youtu.be/vgatKi6crwE?feature=shared
- https://www.konsep-matematika.com/2016/01/permutasi-pada-peluang-dan-contohnya.html?m=1
- https://www.kompas.com/skola/read/2020/11/25/225717269/konsep-dan-contoh-soal-permutasi-pada-peluang
