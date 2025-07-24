{ pkgs, ... }:

 {
  # Discord
  nixpkgs.overlays = [
    (self: super: {
        discord = super.discord.overrideAttrs (
            _: { src = builtins.fetchTarball {
              url = "https://discord.com/api/download?platform=linux&format=tar.gz";

                sha256 = "0bgvmdw65q5pr671chfihgv1wlqjkkr3rnbllr93zlf03ihx62iq";
              }; }
          );
      })
  ];
}
