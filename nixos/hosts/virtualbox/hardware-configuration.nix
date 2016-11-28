# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/cc35e9cd-52b5-4b92-ada1-056fdfe3ffa9";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" "discard"];
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 2;
  virtualisation.virtualbox.guest.enable = true;
}
