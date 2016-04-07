{ pkgs, self, pythonPackages}:
let
  inherit (pythonPackages) buildPythonPackage;
  inherit (pkgs) fetchurl lib;
in {
   "empy" = buildPythonPackage {
     name = "empy-3.3.2";
     src = fetchurl {
       url = "https://pypi.python.org/packages/source/E/EmPy/empy-3.3.2.tar.gz";
       md5 = "fbb34761cdf9acc4c65e298c9eced395";
     };
     doCheck = false;
     propagatedBuildInputs = [  ];
     meta = {
     };
   };
}
