{ pkgs, ... }: 
{
  # Steam
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode = {
      enable = true;
    };
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/hachi/.steam/root/compatibilitytools.d";
  };
}
