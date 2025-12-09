{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "kickoff-dot-desktop";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "j0ru";
    repo = "kickoff-dot-desktop";
    rev = "ba3e8788c7120c95c4ee963abf3904eb0736cb24";
    hash = "sha256-U8Y/vSLFG8ptEV696TARflhdko7r+9ZmzFyGZTbfeCQ=";
  };

  cargoHash = "sha256-yAmHacaSPbK0w7zN7h0tUvyyekbv3BS6FyPuSzvJofo=";

  meta = {
    description = "Smol program to read in relevant desktop files and print them in a kickoff compatible format";
    homepage = "https://github.com/j0ru/kickoff-dot-desktop";
    maintainers = with lib.maintainers; [ ];
    mainProgram = "kickoff-dot-desktop";
  };
}
