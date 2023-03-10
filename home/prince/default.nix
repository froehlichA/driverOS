{ pkgs, ... }:
{
  imports = [
    ../features
  ];

  wallpaper = ./wallpaper.jpg;
  monitors = [
    { name = "DP-1"; width = 5120; height = 1440; }
  ];

  wayland.windowManager.hyprland.nvidiaPatches = true;

  home.stateVersion = "23.05";  # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
