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
    wl-clipboard
    pulseaudio
    feh
    libreoffice-qt6-fresh
    imagemagick
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
