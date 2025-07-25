{ config, pkgs, inputs, ... }:

{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
    inputs.nixcord.homeModules.nixcord
    inputs.spicetify-nix.homeManagerModules.spicetify
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
    feh
    libreoffice-qt6-fresh
    imagemagick
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    nerd-fonts.fira-code
    protonup-qt
  ];

  fonts.fontconfig.enable = true;
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    GTK_THEM = "rose-pine-moon";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
