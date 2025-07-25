{
  programs.waybar.style = ''
    * {
      font-family: "FiraCode Nerd Font";
      font-size: 13px;
      color: #e0def4;
      background: transparent;
    }

    window#waybar {
      background: rgba(24, 23, 37, 0.8);
      border: none;
    }

    #workspaces button {
      padding: 0 5px;
      border: none;
      background: transparent;
      color: #e0def4;
    }

    #workspaces button.active {
      color: #9ccfd8; /* cyan */
    }

    #workspaces button:hover {
      background: rgba(255, 255, 255, 0.05);
    }

    #hyprland-window {
      font-weight: bold;
      color: #f6c177;
    }

    #cava,
    #pulseaudio,
    #network,
    #cpu,
    #memory,
    #disk,
    #temperature,
    #battery,
    #clock,
    #tray {
      padding: 0 8px;
    }

    #cava {
      font-family: monospace;
      color: #eb6f92;
    }
  '';
}

