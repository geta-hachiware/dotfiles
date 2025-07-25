{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      "$mainMod" = "SUPER";
      
      #Monitor
      monitor = [ 
      "DP-1,1920x1080@144,0x0,1"
      ];

      #Start
      exec-once = [
        "~/.config/hypr/start.sh"
        "waybar"
      ];

      #Env
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "GDK_BACKEND,wayland,x11,*"
        "NIXOS_OZONE_WL,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "MOZ_ENABLE_WAYLAND,1"
        "OZONE_PLATFORM,wayland"
        "EGL_PLATFORM,wayland"
        "CLUTTER_BACKEND,wayland"
        "SDL_VIDEODRIVER,wayland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "NIXPKGS_ALLOW_UNFREE,1"
      ];

      #Look and Feel
      general = {
        gaps_in = 2;
        gaps_out = 6;
        border_size = 2;

        #Bordes Eva-01 style
        "col.active_border" = "rgba(c4a7e7ff) rgba(f6c177ff) 45deg";
        "col.inactive_border" = "rgba(393552dd)";

        resize_on_border = true;
	layout = "dwindle";

	allow_tearing = false;

	snap = {
	  enabled = true;
	  window_gap = 10;
	  monitor_gap = 10;
	  border_overlap = false;
	};
      };

      #Input
      input = {

        #Keyboard
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        
        #Numlock
        numlock_by_default = true;  
        
        #Mouse
        follow_mouse = 1;
        sensitivity = 0;

        #Touchpad
        touchpad = {
          natural_scroll = false;
        };
      };

      workspace = [
        "1, monitor:DP-1, default:true"
      ];

      #decoration
      decoration = {
        rounding = 7;
        rounding_power = 2;
        
        windowrule = [
          "opacity 1.0 override 0.85 override 1 override, title:^(YouTube|Netflix|Crunchyroll|Max)"
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        ];
        windowrulev2 = [
          "idleinhibit fullscreen, class:.*"
        ];


        active_opacity = 0.90;
        inactive_opacity = 0.85;
        
        shadow = {
          enabled = true;
          range = 12;
          render_power = 2;
          color = "rgba(393552dd)";
        };

        blur = {
          enabled = true;
	  xray = true;
          size = 4;
          passes = 1;
          vibrancy = 0.10;
	  new_optimizations = true;
	  popups = true;
	  popups_ignorealpha = 0.6;
        };
      };

      #animations
      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeinoutcubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 8, easeOutQuint, slide"
          "workspacesIn, 1, 8, easeOutQuint, slide"
          "workspacesOut, 1, 8, easeOutQuint, slide"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      render = {
        explicit_sync = 2;
        explicit_sync_kms = 2;
        direct_scanout = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      #Gestos
      gestures = {
        workspace_swipe = false;
      };

      #Device
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      #Binds
      bind = [
        "$mainMod, Return, exec, ghostty"
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        "SUPER, E, exec, dolphin"
        "SUPER, V, togglefloating"
        "SUPER, D, exec, rofi -dmenu -show-icons"
        "SUPER, P, pseudo"
        "SUPER, J, togglesplit"
        "SUPER, F, fullscreen"

        # Move focus with mainMod + arrow keys
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        #workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        #MoveWindows
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        #ScreenShot
        "SUPER, S, exec, hyprshot -m region"
        "SUPER SHIFT, S, exec, hyprshot -m region"

        #Scroll workspaces
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
      ];

      #MouseBind
      bindm = [
        #Rezise
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      #EspecialKey
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      #Multimedia
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
}
