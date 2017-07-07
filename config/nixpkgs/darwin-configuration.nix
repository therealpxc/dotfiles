{ config, lib, pkgs, ... }:
{

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
      nix-repl
      # needed for some of my configurations, which use
      # /run/current-system/sw/bin/bash
      bash
      powerline-fonts
  ];

  # Create /etc/bashrc that loads the nix-darwin environment.
  #programs.bash.enable = true;
  #programs.bash.enableCompletion = true;

  # jk i use fish :)
  programs.fish.enable = true;
  programs.man.enable = true;
  programs.info.enable = true;

  # Recreate /run/current-system symlink after boot.
  services.activate-system.enable = true;

}