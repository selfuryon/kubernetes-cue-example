{
  perSystem = {
    devshells.default = {
      name = "example";
      env = [
        {
          name = "AWS_CONFIG_FILE";
          eval = "$PRJ_ROOT/.secrets/aws/config";
        }
        {
          name = "AWS_SHARED_CREDENTIALS_FILE";
          eval = "$PRJ_ROOT/.secrets/aws/credentials";
        }
        {
          name = "CLOUDSDK_CONFIG";
          eval = "$PRJ_ROOT/.secrets/gcloud";
        }
        {
          name = "GOOGLE_APPLICATION_CREDENTIALS";
          eval = "$PRJ_ROOT/.secrets/gcloud/application_default_credentials.json";
        }
        {
          name = "USE_GKE_GCLOUD_AUTH_PLUGIN";
          value = "true";
        }
        {
          name = "KUBECONFIG";
          eval = "$PRJ_ROOT/.secrets/kubernetes/config";
        }
        {
          name = "AVP_TYPE";
          eval = "gcpsecretmanager";
        }
        {
          name = "ARGOCD_SERVER";
          eval = "https://argocd.whatever";
        }
        {
          name = "ARGOCD_AUTH_TOKEN";
          eval = "$PRJ_ROOT/.secrets/argocd/token.json";
        }
        {
          name = "ARGOCD_OPTS";
          eval = "--config=$PRJ_ROOT/.secrets/argocd/config";
        }
        {
          name = "TALOSCONFIG";
          eval = "$PRJ_ROOT/.secrets/talos/config";
        }
        {
          name = "VAULT_ADDR";
          eval = "https://vault.whatever";
        }
        {
          name = "VAULT_TOKEN_PATH";
          eval = "$PRJ_ROOT/.secrets/vault/token";
        }
      ];
    };
  };
}
