# Edit this configuration file to define what should be installed on
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.extraModprobeConfig = "
    options snd-intel-dspcfg dsp_driver=1
  ";

  # boot.extraModulePackages = [ ### For droidcam!!!
  #   pkgs.linuxPackages.v4l2loopback # Webcam loopback
  # ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ ### For droidcam!!!
    v4l2loopback # Webcam loopback
  ];
  # Activate kernel module(s).
  boot.kernelModules = [
    # Virtual camera.
    "v4l2loopback"
    # Virtual Microphone. Custom DroidCam v4l2loopback driver needed for audio.
    # "snd-aloop"
  ];


  hardware = {
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true; ## If compatibility with 32-bit applications is desired.
    # pulseaudio.extraConfig = "load-module module-combine-sink";
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cagatay = {
    isNormalUser = true;
    description = "cagatay";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = (with pkgs; [
    google-chrome
    firefox
    obs-studio
    vlc # video player
    hyprpicker # color picker
    # dolphin # finder
    slack
    # rofi-wayland # menu
    xdotool # Rofi emoji dep for pasting
    grimblast # screenshot | grimblast save area
    virtualbox
    # wf-recorder # screen recorder

    # nwg-look # changing the system look, like cursor size etc. commands
    # glib # nwg-look's dependency
    # gtk3 # ui settings
    gtk4
    nwg-displays # monitor arrangement
    wlr-randr # nwg-displays' dependency
    # helix

    lua
    luajit
    # steam-run # TODO: Use nix-ld https://unix.stackexchange.com/questions/522822/different-methods-to-run-a-non-nixos-executable-on-nixos/522823#522823

    wget
    git

    nodejs
    bun
    corepack_22 # pnpm, yarn

    rustup # Rust

    go # Golang
    gopls

    tmux
    psmisc # useful commands like killall
    libgccjit # compiler collection like gcc
    gcc
    fzf # finder, fzf command
    dunst # notification daemon use mako instead
    # btop # system activity monitor
    monitor # system activity monitor with ui
    brightnessctl # set brightness
    playerctl # media player controller
    wlsunset # screen color temperature

    xdg-desktop-portal-hyprland # for screen sharing, link opening etc.
    pipewire # screen sharing -- Not working for now
    wireplumber # screen sharing -- Not working for now
    grim
    slurp

    openssl # for prisma

    # For tauri --
    # webkitgtk
    # librsvg
    # pkg-config
    # dbus
    # openssl_3
    # gtk3
    # libsoup
    # -----------

    python3 # for stable diffusion and probably for other things too
    libGL # for stable diffusion
    gperftools # for stable diffusion


    ripgrep # required by neovim, searcher
    tree-sitter # TreeSitter, couldn't figure out yet
    wl-clipboard # clipboard manager
    wtype # simulating keyboard input

    waybar # topbar
    # pamixer
    upower # wanted by pulseaudio

    # wlsunset
    # networkmanagerapplet

    swww # wallpaper manager

    # xsel

    # acpi # for asus but not sure if works
    # fdk-aac-encoder # sound encoder

    # bluez5-experimental # for bluetoothctl disabled it test if errors
    blueman # bluetooth gui tools I guess
    bluez # something required for bluetooth and pulseaudio

    # # pulseaudioFull # audio control software
    # pulseaudio
    # pavucontrol # pulseaudio's 
    # alsa-utils
    # pamixer # used this and then on pavu changed configs, then worked

    protonplus # many game clients gaming compatibility layer
    heroic
    wofi
    # qalculate-qt # calculator
    bc # shell calculator
    fastfetch # system info

    # rofi-wayland # menu
    # rofi # menu

    droidcam # connect phone as webcam
    v4l-utils
    android-tools
    adb-sync
  ])

  ++

  (with pkgs-unstable; [
    alacritty
    gleam
    pulseaudioFull # audio control software
    # pulseaudio
    pavucontrol # pulseaudio's 
    # neovim
    # pkgs-unstable.pulseaudio
  ]);

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  xdg.portal.enable = true; # Screen sharing, link opening etc.
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ]; # Same above
  # xdg-desktop-portal-hyprland

  programs = {
    nix-ld.enable = true; # for running non-nixos executables
    neovim.enable = true;
    fish.enable = true;
    xfconf.enable = true; # for configuring thunar
    thunar.enable = true; # file manager

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };

  environment.sessionVariables = {
    # If cursor becomes invisible for hyprland
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron to use wayland for hyprland
    NIXOS_OZONE_WL = "1";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.blueman.enable = true;
  services.tumbler.enable = true; # Thumbnail support for images
  services.usbmuxd.enable = true; # Droidcam for usb connection
  services.xserver = {
    # Configure keymap in X11
    # xkb.layout = "us";
    xkb = {
      layout = "us";
      variant = "";
    };
    # layout = "us";
    # xkbVariant = "";
  };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
