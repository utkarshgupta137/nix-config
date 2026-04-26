_: {
  networking = {
    hostName = "utkarsh-mbp";
    localHostName = "utkarsh-mbp";
    computerName = "utkarsh-mbp";
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = "utkarsh";

    # System settings
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        AppleShowScrollBars = "Always";
        AppleWindowTabbingMode = "always";
        InitialKeyRepeat = 15;
        KeyRepeat = 1;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSMenuEnableActionImages = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
      };
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      WindowManager.EnableStandardClickToShowDesktop = false;
      controlcenter.BatteryShowPercentage = true;
      dock = {
        mru-spaces = false;
        tilesize = 56;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
        _FXSortFoldersFirst = true;
        _FXSortFoldersFirstOnDesktop = true;
      };
      menuExtraClock = {
        ShowDate = 2;
        ShowDayOfWeek = false;
        ShowSeconds = true;
      };
      trackpad = {
        Clicking = true;
        Dragging = true;
      };
    };

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
  };
}
