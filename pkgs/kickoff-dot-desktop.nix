{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "kickoff-dot-desktop";
  version = "unstable-2023-04-17";

  src = fetchFromGitHub {
    owner = "j0ru";
    repo = "kickoff-dot-desktop";
    rev = "86be4cead8b8649860823fc890fb16416b3a3590";
    hash = "sha256-LMl3E23wcM+FMo61ms9OMyMxXAO6pUdqOddBFcdN12c=";
  };

  cargoHash = "sha256-R6wfF4MDZuXnb94Bc/NyvKm8KNBIds3z4R9zsCVeQRM=";

  meta = {
    description = "Smol program to read in relevant desktop files and print them in a kickoff compatible format";
    homepage = "https://github.com/j0ru/kickoff-dot-desktop";
    maintainers = with lib.maintainers; [ ];
    mainProgram = "kickoff-dot-desktop";
  };
}
