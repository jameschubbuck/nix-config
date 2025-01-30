{
  pkgs,
  lib,
  ...
}: {
  programs.bash = {
    enable = true;
    initExtra = ''
      if uwsm check may-start; then
        exec uwsm start default
      fi
    '';
  };
  home.packages = [
    pkgs.adwaita-icon-theme
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = "monitor=DP-5,2560x1600@60,auto,auto";
    settings = {
      "monitor" = ", highrr, auto, 1";
      "$mod" = "SUPER";
      "$menu" = "rofi -show drun -theme /config/modules/hm-modules/rofi/config.rasi";
      "$switcher" = "rofi -show window -theme /config/modules/hm-modules/rofi/config.rasi";
      bind =
        [
          "$mod, Q, killactive"
          "$mod, SPACE, exec, $menu"
          "$mod, tab, exec, $switcher"
          "$mod, F, fullscreen,"
          "$mod, G, exec, ghostty"
        ]
        ++ (builtins.concatLists (builtins.genList (i: let
            ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ])
          9));
      general = {
        border_size = "1";
        gaps_in = "8";
        gaps_out = "8";
        "col.active_border" = lib.mkForce "rgb(585b70)";
      };
      decoration = {
        rounding = "8";
        shadow = {
          enabled = "true";
        };
        active_opacity = "0.9";
        inactive_opacity = "0.9";
        blur = {
          enabled = "true";
          size = "10";
          passes = "2";
          popups = "false";
        };
      };
      animations = {
        animation = "global, 1, 1, default";
      };
      xwayland = {
        enabled = "true";
        force_zero_scaling = "true";
      };
      cursor = {
        no_hardware_cursors = "true";
      };
      render = {
        explicit_sync = "true";
        explicit_sync_kms = "true";
        direct_scanout = "true";
      };
      opengl = {
        force_introspection = "1";
      };
      misc = {
        disable_hyprland_logo = "true";
        disable_splash_rendering = "true";
        force_default_wallpaper = "-1";
        vfr = "true";
        disable_autoreload = "true";
        render_unfocused_fps = "12";
      };
    };
  };
}
