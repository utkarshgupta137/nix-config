{ inputs, outputs, lib, config, pkgs, ... }: {
  services.interception-tools =
    let
      dfkConfig = pkgs.writeText "dual-function-keys.yaml" ''
        TIMING:
          TAP_MILLISEC: 300
          DOUBLE_TAP_MILLISEC: 0
          SYNTHETIC_KEYS_PAUSE_MILLISEC: 0

        MAPPINGS:
          - KEY: KEY_CAPSLOCK
            TAP: KEY_ESC
            HOLD: KEY_LEFTCTRL
          - KEY: KEY_TAB
            TAP: KEY_TAB
            HOLD: KEY_LEFTALT
      '';

      pkg = pkgs.interception-tools;
      plugins = pkgs.interception-tools-plugins;
    in
    {
      enable = true;

      plugins = lib.mkForce [
        pkgs.interception-tools-plugins.dual-function-keys
      ];

      udevmonConfig = ''
        - JOB: "${pkg}/bin/intercept -g $DEVNODE | ${plugins.dual-function-keys}/bin/dual-function-keys -c ${dfkConfig} | ${pkg}/bin/uinput -d $DEVNODE"
          DEVICE:
            EVENTS:
              EV_KEY: [KEY_CAPSLOCK, KEY_TAB]
      '';
    };
}
