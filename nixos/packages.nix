{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  # Flatpak
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    obs-studio
    kdePackages.kate
    mpv
    unzip

    # Gaming
    mangohud
    protonup
    lutris
    bottles
    heroic
    gamescope
    steam-run
    kdePackages.xwaylandvideobridge

    # CLI utils
    wget
    git
    vim

    # GUI utils
    mako

    # Sound
    pamixer 
  ];
}
