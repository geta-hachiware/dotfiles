{ config, pkgs, ... }:

{
  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERM = "xterm-256color";
    RANGER_LOAD_DEFAULT_RC = "FALSE";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  #Portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
 }
