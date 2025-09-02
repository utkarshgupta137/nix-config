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
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        compression = true;

        controlMaster = "auto";
        controlPath = "~/.local/run/ssh/master-%r@%h:%p";
        controlPersist = "10m";

        identityFile = "~/.ssh/id_ed25519";

        serverAliveInterval = 60;
      };
    };
  };

  services.ssh-agent = lib.mkIf (pkgs.stdenv.isLinux) { enable = true; };
}
