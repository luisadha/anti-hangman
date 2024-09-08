#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux.nix/files/usr/bin/bash

# Anti-Hangman v.0.03 
# - nix-on-droid tested
version="0.03"
# Reference :
# - https://stackoverflow.com/questions/4687722/dynamic-case-statement-in-bash#19771433
# - https://id.bitdegree.org/tutorial/ide-proyek-python
# - https://github.com/jesstess/Scrabble/blob/master/scrabble/sowpods.txt

# Dependend
# - crunch
# - coreutils
# - awk
#
#

if [ ! $(type -p crunch 2>/dev/null ) ]; then
  echo "Downlading requirments..."
  pkg install crunch || nix-env -iA nixpkgs.crunch
  echo "Berhasil"
  echo
fi

if [ ! -f $PREFIX/var/games/anti-hangman/sowpods.txt ]; then
  echo "Data kamus diperlukan, Unduh?"
  read CONT
  mkdir -p $PREFIX/var/games/anti-hangman
  curl -fSsl https://raw.githubusercontent.com/jesstess/Scrabble/master/scrabble/sowpods.txt -o $PREFIX/var/games/anti-hangman/sowpods.txt
  if [ $? -eq 0 ]; then
    echo "Berhasil download data, silahkan jalankan ulang!"
    exit 0
    else
    echo "Download tidak berhasil"; exit 1;
    fi
  else

  echo -e "======================================================="
  echo -e "Selamat datang di game Tebak-tebakan."
  echo -e "Uji pengetahuan bahasa inggris umum-mu sekarang juga!"
  echo -e "-----=[ tele: t.me/adharudin14 ]=-----(c)-(2024)--------"
  echo -e "======================================================="
fi

while true; do

get_pharse=$(mapfile -t word_arr < $PREFIX/var/games/anti-hangman/sowpods.txt && printf '%s\n' "${word_arr[@]}" |shuf -n 1)

hangman_simulation=$(echo $get_pharse | awk 'BEGIN{FS=""}{for(i=1;i<=NF;i++) if(seen[$i]++) $i="_"}1')

permute_test=$(echo $get_pharse | grep -o . | sort | uniq -d | xargs | tr -d ' ')

# eval echo $get_pharse # Uncomment this if your a noob player
eval echo $hangman_simulation
# eval echo $permute_test

valid=$(crunch 1 1 -p $permute_test 2>/dev/null | xargs | tr ' ' '|' )

if [[ "$hangman_simulation" =~ ^[[:alpha:]]+$ ]]; then
  echo "Tidak ada tebakan hari ini, Kembali lagi nanti :)"
  exit 2
fi
echo
read -p "Munculkan huruf yang tersembunyi: " choice
[[ -n $choice ]] || { echo "Apa itu? Coba lagi" >&2; continue; }

eval "case \"$choice\" in
    $valid)
        echo "Selamat, tebakan anda benar"
        break;
        ;;
      *)
        echo "Coba lagi!"
        continue;
        ;;
esac" 2>/dev/null
done
