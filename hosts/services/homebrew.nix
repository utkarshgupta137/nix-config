_: {
  homebrew = {
    enable = true;

    taps = [
      "LouisBrunner/valgrind"
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
      "obsidian"
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
