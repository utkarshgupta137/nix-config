{ inputs, outputs, lib, config, pkgs, ... }: {
  boot = {
    kernelParams = [ "nosmt" "isolcpus=0-23" ];
  };
}
