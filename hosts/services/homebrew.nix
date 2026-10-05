_: {
  homebrew = {
    enable = true;
    enableFishIntegration = true;

    taps = [
      {
        name = "LouisBrunner/valgrind";
        trusted = true;
      }
    ];

    brews = [
      "LouisBrunner/valgrind/valgrind"
    ];

    casks = [
      "1password"
      "alacritty"
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
