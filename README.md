[![Nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Nix/NixOS&color=5277C3&style=for-the-badge)](https://nixos.org/)
[![ArgoCD](https://img.shields.io/static/v1?logo=argo&logoColor=white&label=&message=ArgoCD&color=EF7B4D&style=for-the-badge)](https://argoproj.github.io/cd/)
[![Kubernetes](https://img.shields.io/static/v1?logo=kubernetes&logoColor=white&label=&message=Kubernetes&color=326CE5&style=for-the-badge)](https://kubernetes.io/)

# Example Gitops with CUE for Crossplane and Kubernetes

Current folder structure:

- `gitops` is a folder for kubernetes configuration for ArgoCD
  - `apps` contains templates for ArgoCD applications for installing them into different clusters
  - `bootstrap` manages application bootsrap for particular cluster in ArgoCD
  - `clusters` manages different manifests for particular cluster (`manifest` application in ArgoCD)
- `crossplane` is a folder for crossplane configuration for Crossplane Controllers managed by ArgoCD
  - `providers` used for installing different providers for Crossplane
  - `aws` used for managing particular project in AWS
  - `gcp` used for managing particular project in GCP
  - `vault` used for managing particular Vault instance

## Direnv

To allow direnv to check changes in devShell we need to use this .envrc

```bash
watch_file ./nix/*
use flake
```
