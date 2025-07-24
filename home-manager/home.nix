{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];
  home = {
    username = "hachi";
    homeDirectory = "/home/hachi";
    stateVersion = "25.05"; # Please read the comment before changing.
  };

  programs.git = {
    enable = true;
    userName = "geta-hachiware";
    userEmail = "toorucookies@gmail.com";
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    neovim
    btop
    swww
    waybar
    rofi-wayland
    fastfetch
    cava
    hyprshot
    brightnessctl
    hyprlock
    wl-clipboard
    pulseaudio
    feh
    spotify
    libreoffice-qt6-fresh
    imagemagick
    hypridle
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/rofi/colors.rasi".source = ./Dots/rofi/colors.rasi;
    ".config/rofi/config.rasi".source = ./Dots/rofi/config.rasi;
    ".config/rofi/fonts.rasi".source = ./Dots/rofi/fonts.rasi;
    ".config/rofi/menu.rasi".source = ./Dots/rofi/menu.rasi;
    ".config/rofi/powermenu.sh".source = ./Dots/rofi/powermenu.sh;
    ".config/rofi/powermenu.rasi".source = ./Dots/rofi/powermenu.rasi;
    ".config/hypr/Scripts/WallPaper.zsh".executable = true;
    ".config/hypr/WallPaper" = {
      source = ./Wallpaper;
      recursive = true;
    };
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
