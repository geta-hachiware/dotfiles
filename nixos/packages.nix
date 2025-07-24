{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  # Flatpak
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    obs-studio
    discord
    kdePackages.kate
    mpv
    unzip

    # Gaming
    mangohud
    protonup
    lutris
    bottles
    heroic

    # CLI utils
    wget
    git
    vim
    fastfetch

    # GUI utils
    mako

    # Sound
    pipewire
    pulseaudio
    pamixer
  ];
}
