{ pkgs, inputs, ... }:

{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.hachi = {
      isNormalUser = true;
      description = "hachi";
      extraGroups = [ "networkmanager" "wheel" "inputs" ];
      packages = with pkgs; [];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "hachi";
}
