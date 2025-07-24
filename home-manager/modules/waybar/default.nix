{ config, pkgs, ... }:

{
  imports = [
    ./style.nix
  ];

  programs.waybar = {
    enable = true;

    settings = [
      {
        #Bar
        layer = "top";
        position = "top";
        modules-left = ["custom/launcher" "hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["cpu" "memory" "disk" "keyboard-state" "custom/wallpaper" "custom/automatico" "tray" "cava" "backlight" "pulseaudio" "battery" "clock" "custom/power"];

        #Modules
        pulseaudio = {
          tooltip = false;
          scroll-step = 5;
          format = "{icon}  {volume}%";
          format-muted = "muted";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          format-icons = {
            default = ["" "" ""];
          };
        };
        "hyprland/window" = {
          max-length = 100;
          separate-outputs = true;
          format = "{}";
          rewrite = {
            "(.*) — Mozilla Firefox" = "$1";
          };
        };
        "custom/wallpaper" = {
          format = "  ";
          on-click = "sh -c '$HOME/.config/hypr/Scripts/WallPaper.zsh'";
        };
        "custom/automatico" = {
          exec = "sh -c '$HOME/.config/hypr/Scripts/WallPaper.zsh'";
          interval = 600;
        };
        cava = {
          framerate = 240;
          autosens = 1;
          sensitivity = 5;
          bars = 6;
          lower_cutoff_freq = 20;
          higher_cutoff_freq = 22000;
          method = "pulse";
          source = "auto";
          stereo = false;
          reverse = false;
          bar_delimiter = 0;
          monstercat = true;
          waves = true;
          noise_reduction = 0.77;
          input_delay = 0;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };
        "custom/keybinds" = {
          format = "{icon} KB";
          format-icons = ["󰘳"];
          on-click = "bash ~/Documents/themes/keybinds/keybinds.sh";
        };
        backlight = {
          device = "intel_backlight";
          format = "{icon}  {percent}%";
          format-icons = ["" ""];
        };
        battery = {
          bat = "BAT0";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-icons = ["" "" "" "" ""];
          max-length = 25;
        };
        keyboard-state = {
          numlock = false;
          capslock = true;
          format = "{icon} {name}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        tray = {
          icon-size = 18;
          spacing = 10;
        };
        disk = {
          interval = 30;
          format = "  {percentage_used}%";
          path = "/";
        };
        privacy = {
          icon-spacing = 10;
          icon-size = 18;
          transition-duration = 250;
          tooltip = false;
          modules = [
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 24;
            }
            {
              type = "audio-out";
              tooltip = true;
              tooltip-icon-size = 24;
            }
            {
              type = "audio-in";
              tooltip = true;
              tooltip-icon-size = 24;
            }
          ];
        };
        "hyprland/language" = {
          format = "  {1}";
          tooltip = false;
        };
        cpu = {
          interval = 15;
          format = "  {}%";
          max-length = 10;
        };
        memory = {
          interval = 30;
          format = "  {}%";
          max-length = 10;
        };
        "custom/launcher" = {
          format = " ";
          on-click = "rofi -show drun";
          on-click-right = "killall rofi";
          tooltip = false;
        };
        "custom/power" = {
          format = "⏻ ";
          tooltip = false;
          on-click = "bash ~/.config/rofi/powermenu.sh";
          on-click-right = "killall rofi";
        };
        clock = {
          format = "{:%H:%M}";
	        format-alt = "{:%d/%m/%Y}";
	        tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          tooltip = false;
          format-icons = {
            "1" = " 󰞷 ";
            "2" = "  ";
            "3" = "  ";
            "4" = " 󰍹 ";
            "5" = " 󰍹 ";
          };
          on-click = "activate";
          persistent-workspaces = {
            "*" = 3;
          };
        };
      }
    ];
  };
}
