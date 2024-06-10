{inputs, ...}: {
  perSystem = {
    inputs',
    system,
    config,
    ...
  }: let
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    inherit (inputs'.ethereum-nix.packages) ethdo;
    google-env = pkgs.google-cloud-sdk.withExtraComponents [pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin];
  in {
    devshells.default = {
      name = "example";
      packages = with pkgs; [
        argocd
        argocd-vault-plugin
        fluxctl
        awscli2
        cue
        cilium-cli
        ethdo
        google-env
        go
        k9s
        krew
        kubectl
        kubectx
        kubelogin-oidc
        kubernetes-helm
        kustomize
        shellcheck
        statix
        talosctl
        yaml-language-server
        vault-bin
      ];
      devshell.startup = {
        pre-commit.text = config.pre-commit.installationScript;
      };
    };
  };
}
