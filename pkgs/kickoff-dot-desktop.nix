{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "kickoff-dot-desktop";
  version = "unstable-2023-06-17";

  src = fetchFromGitHub {
    owner = "j0ru";
    repo = "kickoff-dot-desktop";
    rev = "ba3e8788c7120c95c4ee963abf3904eb0736cb24";
    hash = "sha256-exMmqOkDKuyAEdda8gG/uF3+tnQzhJnOJK+sEtZbsZc=";
  };

  cargoHash = "sha256-4x9kEBnYPhhYej0mNmV7jibw6sH8SxVau9tIkIVTen8=";

  meta = {
    description = "Smol program to read in relevant desktop files and print them in a kickoff compatible format";
    homepage = "https://github.com/j0ru/kickoff-dot-desktop";
    maintainers = with lib.maintainers; [ ];
    mainProgram = "kickoff-dot-desktop";
  };
}
