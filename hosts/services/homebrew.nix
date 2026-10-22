_: {
  homebrew = {
    enable = true;
    enableFishIntegration = true;

    taps = [
      {
        name = "open-tap/casks";
        trusted = true;
      }
      {
        name = "LouisBrunner/valgrind";
        trusted = true;
      }
    ];

    brews = [
      "zellij"
      "LouisBrunner/valgrind/valgrind"
    ];

    casks = [
      "1password"
      "open-tap/casks/alacritty"
      "bluesnooze"
      "firefox"
      "itsycal"
      "karabiner-elements"
      "keyboardcleantool"
      "orion"
      "qlstephen"
      "wireshark-app"
    ];

    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
