{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, aeson, base, bytestring, containers, lens
      , stdenv, text
      }:
      mkDerivation {
        pname = "purescript-packages2nix";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = true;
        isExecutable = true;
        libraryHaskellDepends = [ aeson base containers lens text ];
        executableHaskellDepends = [
          aeson base bytestring containers lens text
        ];
        testHaskellDepends = [ base ];
        homepage = "https://github.com/ElvishJerricco/purescript-packages2nix#readme";
        description = "Convert the purescript package set to a nix expression";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
