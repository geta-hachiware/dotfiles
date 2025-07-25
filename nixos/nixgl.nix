{ pkgs, inputs, lib, config, ... }: 
let
  system = pkgs.system;
in {
  environment.systemPackages = with pkgs; [
    inputs.nixgl.packages.${system}.nixGLNvidia
  ];
}
