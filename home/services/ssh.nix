{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.ssh = {
    enable = true;

    compression = true;

    controlMaster = "auto";
    controlPath = "~/.local/run/ssh/master-%r@%h:%p";
    controlPersist = "10m";

    serverAliveInterval = 60;

    matchBlocks = {
      "*" = {
        extraOptions = {
          IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
        };
      };
    };
  };
}
