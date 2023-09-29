{ inputs, outputs, lib, config, pkgs, ... }: {
  networking = {
    hostName = "utkarsh-mbp";
    localHostName = "utkarsh-mbp";
    computerName = "utkarsh-mbp";
  };

  security.pam.enableSudoTouchIdAuth = true;

  # System settings
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  system.defaults.NSGlobalDomain.AppleShowScrollBars = "Always";
  system.defaults.NSGlobalDomain.AppleWindowTabbingMode = "always";
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
  system.defaults.NSGlobalDomain.KeyRepeat = 1;
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
  system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
  system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;
  system.defaults.NSGlobalDomain.PMPrintingExpandedStateForPrint = true;
  system.defaults.NSGlobalDomain.PMPrintingExpandedStateForPrint2 = true;
  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
  system.defaults.dock.mru-spaces = false;
  system.defaults.dock.tilesize = 56;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = true;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;
  system.defaults.finder.FXPreferredViewStyle = "clmv";
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder.ShowStatusBar = true;
  system.defaults.finder._FXShowPosixPathInTitle = true;
  system.defaults.menuExtraClock.ShowDate = 2;
  system.defaults.menuExtraClock.ShowDayOfWeek = false;
  system.defaults.menuExtraClock.ShowSeconds = true;
  system.defaults.trackpad.Clicking = true;
  system.defaults.trackpad.Dragging = true;

  system.defaults.CustomSystemPreferences = {
    NSGlobalDomain = {
      AppleMenuBarVisibleInFullscreen = true;
      AppleReduceDesktopTinting = 1;
      _HIHideMenuBar = 0;
    };
    "com.apple.finder" = {
      FXArrangeGroupViewBy = "kind";
      FXPreferredGroupBy = "Kind";
    };
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon = {
    enable = true;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
