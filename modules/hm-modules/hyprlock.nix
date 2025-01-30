{ lib, ... }: {
  wayland.windowManager.hyprland.extraConfig = "exec-once = hyprlock";
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = lib.mkForce {
    general = {
      disable_loading_bar = true;
      hide_cursor = true;
    };
    background = [
      {
        path = "/config/assets/wallpapers/wallpaper.png";
	blur_passes = 3;
	blur_size = 8;
      }
    ];
    input-field = [
      {
        size = "200, 50";
	position = "0,0";
	dots_center = true;
	outline_thickness = 1;
	placeholder_text = "<i>Password</i>";
      }
    ];
  };
}
