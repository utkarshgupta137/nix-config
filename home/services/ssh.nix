{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.ssh = {
    enable = true;

    compression = true;

    controlMaster = "auto";
    controlPath = "~/.local/run/ssh/master-%r@%h:%p";
    controlPersist = "10m";

    serverAliveInterval = 60;

    matchBlocks = {
      "github.com" = {
        identityFile = "${config.home.homeDirectory}/.ssh/id_rsa";
      };
    };
  };
}
