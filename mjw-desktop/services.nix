{ config, pkgs, ... }:

{
  # A service to start a python webserver on port 8000
  systemd.user.services.python-http-server = {
    description = "Python HTTP Server";
    wantedBy = [ 
      "default.target"
    ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.python3}/bin/python3 -m http.server 8000";
    };
  };

  # A service to mount an rclone remote
  #systemd.user.services.rclone-mount = {
  #  enable
  #};
}
