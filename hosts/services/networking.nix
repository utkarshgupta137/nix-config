{ inputs, outputs, lib, config, pkgs, ... }: {
  networking = {
    dns = [ "8.8.8.8" "8.8.4.4" "2001:4860:4860::8888" "2001:4860:4860::8844" ];

    knownNetworkServices = [ "Wi-Fi" ];
  };
}
