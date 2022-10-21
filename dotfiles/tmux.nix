{ config, pkgs, ... }:
{
    # raw config files
    home.file.".tmux.conf".source = ./tmux.conf;
}
