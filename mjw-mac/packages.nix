{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    docker # containerization
    podman # containerization
    bun # js environment

    kitty # terminal emulator
    
    nodejs-16_x # nodejs for copilot
    python3 # python
    python3Packages.pip # pip
    python3Packages.virtualenv # virtualenv

    jq # json parser
    ripgrep # grep
    fzf # fuzzy finder
    bat # cat
    exa # ls
    cheat # cheatsheets
    tldr # cheatsheets
    zoxide # cd

    pywal # color scheme generator
    
    speedtest-cli # speedtest
  ];
}
