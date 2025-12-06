{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
  pkgs,
}:

rustPlatform.buildRustPackage rec {
  pname = "break-enforcer";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "evavh";
    repo = "break-enforcer";
    rev = version;
    hash = "sha256-I1tr37DQyXFB4ucutQv84tbK8VtuF1kVXSb7ayyfkGY=";
  };

  cargoHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  packages = with pkgs; [
  	alsa-utils
  ];

  meta = {
    description = "Software break enforcer, with activity detection";
    homepage = "https://github.com/evavh/break-enforcer";
    changelog = "https://github.com/evavh/break-enforcer/blob/${src.rev}/CHANGELOG.md";
    maintainers = with lib.maintainers; [ ];
    mainProgram = "break-enforcer";
  };
}
