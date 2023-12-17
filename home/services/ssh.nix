{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.ssh = {
    enable = true;

    addKeysToAgent = "yes";
    compression = true;

    controlMaster = "auto";
    controlPath = "~/.local/run/ssh/master-%r@%h:%p";
    controlPersist = "10m";

    serverAliveInterval = 60;

    matchBlocks = {
      "*" = lib.mkMerge [
        (lib.optionalAttrs (pkgs.stdenv.isDarwin) {
          extraOptions = {
            IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
          };
        })

        (lib.optionalAttrs (pkgs.stdenv.isLinux) {
          identityFile = "${config.home.homeDirectory}/.ssh/id_rsa";
        })
      ];
    };
  };

  services.ssh-agent = lib.mkIf (pkgs.stdenv.isLinux) {
    enable = true;
  };
}
