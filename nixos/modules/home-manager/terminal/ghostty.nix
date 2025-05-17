{ pkgs, lib, config, ...} : {
  config = {
    programs.ghostty = {
        enable = true;
        settings = {
            theme = "Adwaita Dark";
            font-family = "Jetbrains mono";
            font-size = 14;
            window-padding-x = 0;
            window-padding-y = 0;
            shell-integration-features = "sudo";
        };
    };
  };
}
