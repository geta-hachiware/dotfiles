{ config, pkgs, ... }:

{
  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERM = "xterm-256color";
    RANGER_LOAD_DEFAULT_RC = "FALSE";
  };

  #Portals
  xdg.portal = {
    enable = true;
    config.common.default = "hyprland";
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };
 }
