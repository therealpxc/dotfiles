#{ stdenv, fetchurl, cmake, pkgconfig }:

with import <nixpkgs> {};
with import ./pypi-deps.nix {};
with stdenv.lib; {
  px4env = stdenv.mkDerivation rec {
    name = "px4env";
    version = "0.0.0.1";
    src = ./.;

    propagatedBuildInputs = with pythonPackages; [
      argparse
      pyserial
      empy
    ];

    genromfs = callPackage ./genromfs.nix { } ;

    buildInputs = [
      stdenv
      ncurses
      pkgconfig
      boost
      cmake
      ninja             # optional 'better' build system
      gcc-arm-embedded
      genromfs
      gdbCross
      pkgs.zip
      unzip
      ddd
      eigen
      git               # needed by px4's messed-up build system

      # below are gazebo and dependencies which appear to be shared with it
      gazebo6
      opencv
      sdformat
      ogre
      ogrepaged
      ignition-math2
      protobuf
      tinyxml
      freeimage
      libav
      tbb
    ];

    preConfigure = ''
      patchShebangs Tools/
      git submodule init
      git submodule sync --recursive
      patchShebangs .
    '';

    configurePhase = ''
      make
    '';
  };

}

