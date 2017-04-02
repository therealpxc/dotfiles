{ stdenv, fetchurl, cmake, pkgconfig, buildEnv
  , boost, protobuf, ninja, gcc-arm-embedded, git
  , unzip, zip, ddd, eigen, ncurses, genromfs
  , opencv, gazeboSimulator, ogre, ignition, tinyxml
  , freeimage, libav, tbb
  , gdbCross
  , pythonPackages, empy ? pythonPackages.empy
}:

stdenv.mkDerivation rec {
  name = "px4fw";
  version = "0.0.0.1";
  src = ./.;

  propagatedBuildInputs = with pythonPackages; [
    argparse
    pyserial
    empy
  ];

  buildInputs = [
    stdenv
    ncurses
    genromfs
    zip
    unzip
    ddd
    eigen
    git               # needed by px4's messed-up build system

    # below are gazebo and dependencies which appear to be shared with it
    gazeboSimulator.gazebo6
    opencv
    gazeboSimulator.sdformat3
    ogre
    ignition.math2
    tinyxml
    freeimage
    libav
    tbb
  ];

  nativeBuildInputs = [
    pkgconfig cmake ninja boost protobuf stdenv gcc-arm-embedded
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

  env = buildEnv {
    name = "${name}-env";
    paths = [
      zip
      unzip
      gdbCross
    ] ++ buildInputs ++ propagatedBuildInputs ++ nativeBuildInputs;
  };
}


