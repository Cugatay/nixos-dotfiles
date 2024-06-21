{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    plugins = [
      pkgs.rofi-calc
      # pkgs.rofi-dmenu
      # pkgs.rofi-pass
      # pkgs.rofi-power-menu
      # pkgs.rofi-surfraw
      # pkgs.rofi-unicode
      pkgs.rofi-emoji
    ];
    # theme = builtins.readFile ./theme.rasi;
    # theme = "~/.config/home-manager/modules/rofi/theme.rasi";
    theme = "~/.config/home-manager/modules/rofi/theme.rasi";
  };

  # home.file."~/.config/rofi/config.rasi".text = builtins.readFile ./theme.rasi;
  # home.file."~/.config/rofi/config.conf".text = "Test";
  # home.file = {
  #   "~/.config/rofi/config.rasi" = {
  #     text = "Test";
  #   };
  # };
}

# programs.rofi = {
#   enable = true;
#   plugins = [
#     pkgs.rofi-calc
#     # pkgs.rofi-dmenu
#     # pkgs.rofi-pass
#     # pkgs.rofi-power-menu
#     # pkgs.rofi-surfraw
#     # pkgs.rofi-unicode
#     pkgs.rofi-emoji
#   ];
#
#   # theme = "~/.config/home-manager/config.rasi";
# };
