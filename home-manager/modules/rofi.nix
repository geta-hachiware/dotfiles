{ pkgs, ...}:{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "ghostty";

    extraConfig = {
      modi = "drun, run";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      drun-display-format = "{icon} {name}";
    };
  };

  home.packages = with pkgs; [
    glib
    papirus-icon-theme
  ];
}
