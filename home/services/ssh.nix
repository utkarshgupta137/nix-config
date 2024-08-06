{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.ssh = {
    enable = true;

    addKeysToAgent = "yes";
    compression = true;

    controlMaster = "auto";
    controlPath = "~/.local/run/ssh/master-%r@%h:%p";
    controlPersist = "10m";

    serverAliveInterval = 60;

    matchBlocks = {
      "*" = {
        identityFile = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };
    };
  };

  services.ssh-agent = lib.mkIf (pkgs.stdenv.isLinux) { enable = true; };
}
