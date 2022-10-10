{ config, pkgs, ... }:
{programs.fish = {
    enable = true;
    plugins = [
    # Need this when using Fish as a default macOS shell in order to pick
    # up ~/.nix-profile/bin
    {
      name = "nix-env";
      src = pkgs.fetchFromGitHub {
        owner = "lilyball";
        repo = "nix-env.fish";
        rev = "00c6cc762427efe08ac0bd0d1b1d12048d3ca727";
        sha256 = "1hrl22dd0aaszdanhvddvqz3aq40jp9zi2zn0v1hjnf7fx4bgpma";
      };
    }
    {
      name = "z";
      src = pkgs.fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
        rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
        sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
      };
    }
  ];
  shellInit = ''
    set -x NIX_PATH nixpkgs=${pkgs.path}:$NIX_PATH:$HOME/.nix-defexpr/channels
    export NIX_PATH=$HOME/.nix-defexpr/channels:$NIX_PATH
    '';
  shellAliases = {
    rm = "rm -i";
    cp = "cp -i";
    mv = "mv -i";
    rcm = "rclone mount cryptdrive: ~/Cryptdrive --vfs-cache-mode=full --allow-other --buffer-size 32M --config /home/matthias/.config/rclone/rclone.conf --password-command 'pass rclone/config_password' &";
    mkdir = "mkdir -p";
    hms = "home-manager switch -f nix-config/home.nix";
  };
  functions = {
    # all fish functions
    fish_greeting = {
      description = "Greeting to show when starting a fish shell";
      body = ''
  figlet "mjw-desktop"
  echo ""
  curl "wttr.in/Berlin?format=3"
  echo ""
  fortune
        '';
        };
    };
  };
}
