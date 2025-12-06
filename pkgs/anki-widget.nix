{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  protobuf,
  bzip2,
  sqlite,
  vulkan-loader,
  zstd,
  stdenv,
}:

rustPlatform.buildRustPackage rec {
  pname = "anki-widget";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "evavh";
    repo = "anki-widget";
    rev = "v${version}";
    hash = "sha256-U8Y/vSLFG8ptEV696TARflhdko7r+9ZmzFyGZTbfeCQ=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "anki-0.0.0" = "sha256-0l6457h+gkdXpnjXzJoZ5FT8hXd6hJ8t36c4tIdpwW0=";
      "percent-encoding-iri-2.2.0" = "sha256-kCBeS1PNExyJd4jWfDfctxq6iTdAq69jtxFQgCCQ8kQ=";
    };
  };

  nativeBuildInputs = [
    pkg-config
    protobuf
  ];

  buildInputs = [
    bzip2
    sqlite
    vulkan-loader
    zstd
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  meta = {
    description = "Anki card count text widget";
    homepage = "https://github.com/evavh/anki-widget";
    changelog = "https://github.com/evavh/anki-widget/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "anki-widget";
  };
}
