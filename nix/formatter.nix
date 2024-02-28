{inputs, ...}: {
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = {config, ...}: {
    treefmt = {
      projectRootFile = ".git/config";
      programs = {
        alejandra.enable = true;
        prettier.enable = true;
        cue.enable = false; # See https://github.com/cue-lang/cue/issues/2523
      };
      settings.global.excludes = ["cue.mod/**/" "flake.lock"];
    };
    formatter = config.treefmt.build.wrapper;
  };
}
