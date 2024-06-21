{ config, pkgs, ... }:

{
  imports = [
    ./modules/bundle.nix
  ];

  home = {
    username = "cagatay";
    homeDirectory = "/home/cagatay";

    stateVersion = "23.11"; # Please read the comment before changing.

    packages = [];

    # file = {
    #   "~/.config/rofi/conf.txt" = {
    #     text = "Test";
    #   };
    # };

    sessionVariables = {
      # EDITOR = "emacs";
    };

    # home-manager.users.cagatay = {
    #   dconf.settings = {
    #     "org/gnome/desktop/background" = {
    #       picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
    #     };
    #     "org/gnome/desktop/interface" = {
    #       color-scheme = "prefer-dark";
    #     };
    #   };
    # };
  };
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
  };

  # Wayland, X, etc. support for session vars
  systemd.user.sessionVariables = config.home-manager.users.cagatay.home.sessionVariables;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  programs.home-manager.enable = true;
}
