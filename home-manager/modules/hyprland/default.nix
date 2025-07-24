let
  terminal = "kitty";
  filemanager = "dolphin";
  menu = "rofi -show drun ";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      
      # Monitor
      monitor = [ 
      "DP-1,1920x1080@144,0x0,1"
      ];

      # Auto start
      exec-once = [
        "waybar"
      ];

      # Env
      env = [
        "XCURSOR_SIZE = 15"
        "HYPRCURSOR_SIZE = 15"
        "XDG_SESSION_TYPE = wayland"
        "XDG_CURRENT_DESKTOP = Hyprland"
        "QT_QPA_PLATFORM = wayland"
        "MOZ_ENABLE_WAYLAND = 1"
      ];

      #Look and Feel
      general = {
        gaps_in = 2;
        gaps_out = 6;
        border_size = 2;

        #Bordes Eva-01 style
        "col.active_border" = "rgba(965fd4ff) rgba(8bd450ff) 45deg";
        "col.inactive_border" = "rgba(3f6d4eee)";

        resize_on_border = true;

        allow_tearing = true;
        layout = "dwindle";
      };

      #decoration
      decoration = {
        rounding = 7;
        rounding_power = 2;
        
        windowrule = [
          "opacity 1.0 override 0.85 override 1 override, title:.*youtube.*"
          "opacity 1.0 override 0.85 override 1 override, title:.*Crunchyroll.*"
          "opacity 1.0 override 0.85 override 1 override, title:.*Netflix.*"
          "opacity 1.0 override 0.85 override 1 override, title:.*Max.*"
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
          range = 9;
          render_power = 4;
          color = "rgba(734f9aff)";
        };

        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          vibrancy = 0.6;
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

      #Layout
      dwindle = {

        pseudotile = true;
        preserve_split = true;
      };
      master = {

        new_status = "master";
      };
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      # Keyboard
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
      "$mainMod" = "SUPER";

      bind = [
        # Window/Session actions
        "$mainMod, Return, exec, ${terminal}"
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        "$mainMod, E, exec, ${filemanager}"
        "$mainMod, V, togglefloating"
        "$mainMod, D, exec, ${menu}"
        "$mainMod, P, pseudo"
        "$mainMod, J, togglesplit"
        "$mainMod, F, fullscreen"

        #ScreenShot
        "$mainMod, S, exec, hyprshot -m region"
        "$mainMod SHIFT, S, exec, hyprshot -m region"

        #Scroll workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move focused window to a workspace silently
        "$mainMod+Alt, 1, movetoworkspacesilent, 1"
        "$mainMod+Alt, 2, movetoworkspacesilent, 2"
        "$mainMod+Alt, 3, movetoworkspacesilent, 3"
        "$mainMod+Alt, 4, movetoworkspacesilent, 4"
        "$mainMod+Alt, 5, movetoworkspacesilent, 5"
        "$mainMod+Alt, 6, movetoworkspacesilent, 6"
        "$mainMod+Alt, 7, movetoworkspacesilent, 7"
        "$mainMod+Alt, 8, movetoworkspacesilent, 8"
        "$mainMod+Alt, 9, movetoworkspacesilent, 9"
        "$mainMod+Alt, 0, movetoworkspacesilent, 10"

        # Move focused window to a workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];

      # MouseBind
      bindm = [
        #Rezise
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # SpecialKey
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
