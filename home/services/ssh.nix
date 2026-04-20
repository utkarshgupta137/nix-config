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

        identityAgent =
          if pkgs.stdenv.isDarwin then
            "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\""
          else
            "~/.1password/agent.sock";

        serverAliveInterval = 60;
      };
    };
  };

  services.ssh-agent = lib.mkIf pkgs.stdenv.isLinux { enable = true; };
}
