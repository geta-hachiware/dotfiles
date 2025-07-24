{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  # Flatpak
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    neovim
    ghostty
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
    neofetch
    tree
    tree
    wget
    git
    vim
    fastfetch
    htop
    cava
    ranger

    # GUI utils
    mako

    # Wayland stuff
    wl-clipboard
    hyprlock
    hypridle

    # WMs and stuff
    waybar
    swww
    brightnessctl

    # Sound
    pipewire
    pulseaudio
    pamixer

    # Screenshotting
    hyprshot
  ];
}
