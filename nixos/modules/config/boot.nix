{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [ "nvidia" "nvme" "xhci_pci" "usbhid" "sd_mod" ];
      kernelModules = [ "nvidia" ];
    };

    kernelParams = [
      "nvidia-drm.modeset=1"
      "nvidia_drm.fbdev=1"
      "quiet"
      "loglevel=3"
    ];

    kernelModules = [ "kvm-intel" ];

    kernel.sysctl = {
      "vm.swappiness" = 10;
      "kernel.nmi_watchdog" = 0;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
