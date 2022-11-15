{ config, pkgs, ... }:
{
  home.packages = with pkgs; [


    # utils
    jq # json parser
    bat # cat with syntax highlighting and Git integration
    exa # ls replacement
    
      # keepassxc # password manager
    
    xclip # clipboard
    htop # better top
    wget # for downloading files
    curl # for downloading files
    zip # for zip/unzip
    unzip # unzip
    neovim rclone # cloud storage
    croc # file transfer
    syncthing # sync files between devices
    fd # find files
    ripgrep # grep replacement
    fzf # fuzzy finder
    entr # run commands when files change

    # communication
    tdesktop

    # browsers
    firefox
    brave
    chromium

    # media
    mpv # media player
    youtube-dl # download youtube videos
    ffmpeg # convert videos
    vlc # media player
    imagemagick # image manipulation
    gimp # image manipulation
    inkscape # vector graphics
    audacity # audio editor
    obs-studio # screen recorder
    kdenlive # video editor
    handbrake # video converter
    blender # 3d modeling
    darktable # photo editor
    krita # painting

    # developement
    git # version control
    docker # containerization
    gnome.gnome-boxes # virtual machines
    podman # containerization
    bun # js environment
    # nodejs # js environment
    # node
    # nodejs-16_x # js runtime environment
    nodePackages.npm # js package manager
    nodePackages.typescript # js language
    nodePackages.ts-node # ts-node
    yarn # js package manager
    go # programming language
    python3 # programming language
    python3Packages.pip # python package manager
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy

    # work
    slack # chat
    azure-cli # cloud

    # other
    discord
    
    # Starship
    starship # prompt
  ];
}
