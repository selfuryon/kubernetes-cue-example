package gitops

import (
	"strings"

	argo_v1alpha1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
	external_secrets_v1beta1 "github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1"
	vault_secrets_v1beta1 "github.com/hashicorp/vault-secrets-operator/api/v1beta1"
	vmoperator_v1beta1 "github.com/VictoriaMetrics/operator/api/v1beta1"

	// Kubernetes
	core_v1 "k8s.io/api/core/v1"
	rbac_v1 "k8s.io/api/rbac/v1"
	snapshot_storage_v1 "k8s.io/api/storage/snapshot/v1"
	storage_v1 "k8s.io/api/storage/v1"

	// GCP
	frontend_config_v1beta1 "k8s.io/ingress-gce/pkg/apis/frontendconfig/v1beta1"
	backend_config_v1 "k8s.io/ingress-gce/pkg/apis/backendconfig/v1"
)

// ArgoCD
argocd: [TYPE=_]: [ID=_]: {
	apiVersion: "argoproj.io/v1alpha1"
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

argocd: close({
	application: [string]: argo_v1alpha1.#Application
	appProject: [string]:  argo_v1alpha1.#AppProject
})

// External Secrets
externalSecrets: [TYPE=_]: [ID=_]: {
	apiVersion: "external-secrets.io/v1beta1"
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

externalSecrets: close({
	clusterSecretStore: [string]: external_secrets_v1beta1.#ClusterSecretStore
	secretStore: [string]:        external_secrets_v1beta1.#SecretStore
	externalSecret: [ID=_]: external_secrets_v1beta1.#ExternalSecret & {
		spec: target: name: *ID | string
	}
})

// Vault Secrets Operator
vaultSecrets: [TYPE=_]: [ID=_]: {
	apiVersion: "secrets.hashicorp.com/v1beta1"
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

vaultSecrets: close({
	vaultConnection: [string]: vault_secrets_v1beta1.#VaultConnection
	vaultAuth: [string]:       vault_secrets_v1beta1.#VaultAuth
	vaultStaticSecret: [ID=_]: vault_secrets_v1beta1.#VaultStaticSecret & {
		spec: destination: name: *ID | string
	}
	vaultPKISecret: [string]:     vault_secrets_v1beta1.#VaultPKISecret
	vaultDynamicSecret: [string]: vault_secrets_v1beta1.#VaultDynamicSecret
})

// Internal Kubernetes
kube: [TYPE=_]: [ID=_]: {
	apiVersion: *"v1" | string
	kind:       strings.ToTitle(TYPE)
	metadata: name: *ID | string
}

kube: close({
	namespace: [string]:      core_v1.#Namespace
	serviceAccount: [string]: core_v1.#ServiceAccount
	secret: [string]:         core_v1.#Secret
	storageClass: [string]: storage_v1.#StorageClass & {
		apiVersion: "storage.k8s.io/v1"
	}
	volumeSnapshotClass: [string]: snapshot_storage_v1.#VolumeSnapshotClass & {
		apiVersion: "snapshot.storage.k8s.io/v1"
	}
	frontendConfig: [string]: frontend_config_v1beta1.#FrontendConfig & {
		apiVersion: "networking.gke.io/v1beta1"
	}
	backendConfig: [string]: backend_config_v1.#BackendConfig & {
		apiVersion: "cloud.google.com/v1"
	}
	clusterRole: [string]: rbac_v1.#ClusterRole & {
		apiVersion: "rbac.authorization.k8s.io/v1"
	}
	clusterRoleBinding: [string]: rbac_v1.#ClusterRoleBinding & {
		apiVersion: "rbac.authorization.k8s.io/v1"
	}
})

// Victoria Metrics Operator
vmOperator: [TYPE=_]: [ID=_]: {
	apiVersion: "operator.victoriametrics.com/v1beta1"
	kind:       strings.Replace(TYPE, "vm", "VM", 1)
	metadata: name: *ID | string
}
vmOperator: close({
	vmAgent: [string]:         vmoperator_v1beta1.#VMAgent
	vmServiceScrape: [string]: vmoperator_v1beta1.#VMServiceScrape
	vmAlert: [string]:         vmoperator_v1beta1.#VMAlert
	vmAlertmanager: [ID=_]: vmoperator_v1beta1.#VMAlertmanager & {
		spec: configSecret: *ID | string
	}
	vmAlertmanagerConfig: [string]: vmoperator_v1beta1.#VMAlertmanagerConfig
	vmAuth: [string]:               vmoperator_v1beta1.#VMAuth
	vmRule: [string]:               vmoperator_v1beta1.#VMRule
	vmSingle: [string]:             vmoperator_v1beta1.#VMSingle
	vmUser: [string]:               vmoperator_v1beta1.#VMUser
})
