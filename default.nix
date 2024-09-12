{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "anti-hangman";
  version = "0.03";

  src = ./.;

  buildInputs = [ pkgs.bash ];

  buildPhase = ''
    mkdir -p $out/bin
    cp -r * $out/bin
  '';

  installPhase = ''
    cp -f ./anti-hangman.sh $out/bin/anti-hangman
    chmod +x $out/bin/anti-hangman
  '';

  meta = with pkgs.lib; {
    description = "Anti-hangman like hangman games but it's difference, Using permutations method written in Bash script.";
    license = licenses.gplv3.0;
    maintainers = with maintainers; [ luisadha ];
  };
}
