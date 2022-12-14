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
    # Set up Transfer.sh
    function transfer --description 'Easy file sharing from the command line using http://transfer.sh'
    if test (count $argv) -eq 0
        echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
        return 1; 
    end
    set tmpfile ( mktemp -t transferXXX ); 
    if tty -s
        set basefile (basename $argv[1] | sed -e 's/[^a-zA-Z0-9._-]/-/g');
        curl --progress-bar --upload-file $argv[1] "https://transfer.sh/$basefile" >> $tmpfile; 
    else 
        curl --progress-bar --upload-file "-" "https://transfer.sh/$argv[1]" >> $tmpfile ; 
    end; 
    cat $tmpfile; 
    rm -f $tmpfile;
end


    # Set up Nix environment
    set -x NIX_PATH nixpkgs=${pkgs.path}:$NIX_PATH:$HOME/.nix-defexpr/channels
    export NIX_PATH=$HOME/.nix-defexpr/channels:$NIX_PATH
        
    export DOTFILES=$HOME/.config/nixpkgs/common/dotfiles
    export EDITOR=/usr/bin/nvim
  
    # initiate starship
    starship init fish | source
    '';
    shellAliases = {
      # Shell Abbreviations
      ls = "exa";
      nv = "nvim";
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      rcm = "rclone mount cryptdrive: ~/Cryptdrive --vfs-cache-mode=full --allow-other --buffer-size 32M --config /home/matthias/.config/rclone/rclone.conf --password-command 'pass rclone/config_password' &";
    mkdir = "mkdir -p";
    hms = "home-manager switch";
    
    # Flatpaks

    ## Spotify
    "spotify" = "flatpak run com.spotify.Client"; # Spotify

    ## Obsidian
    "obsidian" = "flatpak run md.obsidian.Obsidian"; # Obsidian
    
    ## icat
    "icat" = "kitty +kitten icat"; # icat
  };
  functions = {
    # all fish functions
    fish_greeting = {
      description = "Greeting to show when starting a fish shell";
      body = ''
  figlet "mjw-desktop"
  echo ""
  # curl "wttr.in/Berlin?format=3" # removed because of quota issues
  echo ""
  fortune
        '';
        };
    };
  };
}
