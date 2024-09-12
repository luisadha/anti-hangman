{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "anti-hangman";
  version = "0.03";

  src = ./.;

  buildInputs = [
    pkgs.bash
    pkgs.curl
    pkgs.coreutils
    pkgs.crunch
    pkgs.git
    pkgs.gnugrep
    pkgs.gawk
    pkgs.findutils
  ];

  buildPhase = ''
  mkdir -p $out/bin
'';

  installPhase = ''
  mkdir -p $out/share/doc/anti-hangman
  cp -f ./LICENSE $out/share/doc/anti-hangman/LICENSE
  cp -f ./README.md $out/share/doc/anti-hangman/README.md
  cp -f ./anti-hangman.sh $out/bin/anti-hangman
  chmod +x $out/bin/anti-hangman
'';

  meta = with pkgs.lib; {
    description = "Anti-hangman like hangman games but it's difference, Using permutations method written in Bash script.";
    license = licenses.gpl3;
    maintainers = with maintainers; [ luisadha ];
  };
}
