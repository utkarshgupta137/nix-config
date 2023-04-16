{ inputs, outputs, lib, config, pkgs, ... }: {
  powerManagement = {
    cpuFreqGovernor = "ondemand";

    powertop = {
      enable = true;
    };
  };

  services.auto-cpufreq = {
    enable = true;
  };
}
