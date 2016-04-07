pkgs :

{
  allowUnfree = true;
  virtualbox = { enableExtensionPack = true; };
  gazebo = { withQuickBuild = true; };

  #packageOverrides = pkgs:
  #rec {
  
  packageOverrides = super: let pkgs = super.pkgs; in
  with pkgs;
  with import ./pkgs/python.nix;
  rec {
    pythonSupplements = pkgs.callPackage ./pkgs/python.nix { };
    inherit (pythonSupplements) empy;
    px4fw = pkgs.callPackage ./pkgs/px4fw.nix {  };
  };
}
