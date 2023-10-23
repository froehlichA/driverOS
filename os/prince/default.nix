{ pkgs, config, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime

    ../features
    ../features/optional/gpu-nvidia.nix
    ../features/optional/uefi.nix
  ];

  # Services
  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-6_0;
  };
  services.redis.servers."".enable = true;
  services.postgresql.enable = true;
  environment.sessionVariables = {
  	CHROME_BIN = "${pkgs.chromium}/bin/chromium";
  };

  networking.hostName = "prince";
  system.stateVersion = "23.05"; # LEAVE THIS ALONE (see https://nixos.org/nixos/options.html)
}
