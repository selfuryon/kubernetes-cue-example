package crossplane

import (
	"strings"
	vault_auth_v1alpha1 "github.com/upbound/provider-vault/apis/auth/v1alpha1"
	vault_gcp_v1alpha1 "github.com/upbound/provider-vault/apis/gcp/v1alpha1"
	vault_aws_v1alpha1 "github.com/upbound/provider-vault/apis/aws/v1alpha1"
	vault_identity_v1alpha1 "github.com/upbound/provider-vault/apis/identity/v1alpha1"
	vault_jwt_v1alpha1 "github.com/upbound/provider-vault/apis/jwt/v1alpha1"
	vault_kubernetes_v1alpha1 "github.com/upbound/provider-vault/apis/kubernetes/v1alpha1"
	vault_pki_v1alpha1 "github.com/upbound/provider-vault/apis/pki/v1alpha1"
	vault_v1beta1 "github.com/upbound/provider-vault/apis/v1beta1"
	vault_vault_v1alpha1 "github.com/upbound/provider-vault/apis/vault/v1alpha1"
)

// Vault Crossplane Provider
vaultProvider: [TYPE=_]: [ID=_]: {
	apiVersion: *"vault.upbound.io/v1beta1" | string
	kind:       *strings.ToTitle(TYPE) | string
	metadata: name:      *ID | string
	metadata: namespace: _crossplaneNS
	if TYPE != "providerConfig" {
		spec: providerConfigRef: name: _vault
	}
}

// Vault
vaultProvider: close({
	providerConfig: [string]: vault_v1beta1.#ProviderConfig
	authBackendConfigKubernetes: [string]: vault_kubernetes_v1alpha1.#AuthBackendConfig & {
		kind:       "AuthBackendConfig"
		apiVersion: "kubernetes.vault.upbound.io/v1alpha1"
	}
	authBackendRoleKubernetes: [string]: vault_kubernetes_v1alpha1.#AuthBackendRole & {
		kind:       "AuthBackendRole"
		apiVersion: "kubernetes.vault.upbound.io/v1alpha1"
	}
	authBackendGCP: [string]: vault_gcp_v1alpha1.#AuthBackend & {
		kind:       "AuthBackend"
		apiVersion: "gcp.vault.upbound.io/v1alpha1"
	}
	authBackendJWT: [string]: vault_jwt_v1alpha1.#AuthBackend & {
		kind:       "AuthBackend"
		apiVersion: "jwt.vault.upbound.io/v1alpha1"
	}
	authBackendRoleGCP: [string]: vault_gcp_v1alpha1.#AuthBackendRole & {
		kind:       "AuthBackendRole"
		apiVersion: "gcp.vault.upbound.io/v1alpha1"
	}
	authBackendRoleJWT: [string]: vault_jwt_v1alpha1.#AuthBackendRole & {
		kind:       "AuthBackendRole"
		apiVersion: "jwt.vault.upbound.io/v1alpha1"
	}
	backendAuth: [string]: vault_auth_v1alpha1.#Backend & {
		apiVersion: "auth.vault.upbound.io/v1alpha1"
		kind:       "Backend"
	}
	entity: [string]: vault_identity_v1alpha1.#Entity & {
		apiVersion: "identity.vault.upbound.io/v1alpha1"
	}
	entityAlias: [string]: vault_identity_v1alpha1.#EntityAlias & {
		apiVersion: "identity.vault.upbound.io/v1alpha1"
	}
	group: [string]: vault_identity_v1alpha1.#Group & {
		apiVersion: "identity.vault.upbound.io/v1alpha1"
	}
	oidcClient: [string]: vault_identity_v1alpha1.#OidcClient & {
		apiVersion: "identity.vault.upbound.io/v1alpha1"
	}
	oidcProvider: [string]: vault_identity_v1alpha1.#OidcProvider & {
		apiVersion: "identity.vault.upbound.io/v1alpha1"
	}
	oidcScope: [string]: vault_identity_v1alpha1.#OidcScope & {
		apiVersion: "identity.vault.upbound.io/v1alpha1"
	}
	policy: [string]: vault_vault_v1alpha1.#Policy & {
		apiVersion: "vault.vault.upbound.io/v1alpha1"
	}
	mount: [string]: vault_vault_v1alpha1.#Mount & {
		apiVersion: "vault.vault.upbound.io/v1alpha1"
	}
	secretBackendAWS: [string]: vault_aws_v1alpha1.#SecretBackend & {
		apiVersion: "aws.vault.upbound.io/v1alpha1"
		kind:       "SecretBackend"
	}
	secretBackendRoleAWS: [string]: vault_aws_v1alpha1.#SecretBackendRole & {
		apiVersion: "aws.vault.upbound.io/v1alpha1"
		kind:       "SecretBackendRole"
	}
	secretBackendGCP: [string]: vault_gcp_v1alpha1.#SecretBackend & {
		apiVersion: "gcp.vault.upbound.io/v1alpha1"
		kind:       "SecretBackend"
	}
	secretStaticAccount: [string]: vault_gcp_v1alpha1.#SecretStaticAccount & {
		apiVersion: "gcp.vault.upbound.io/v1alpha1"
		kind:       "SecretStaticAccount"
	}
	secretBackendRootCert: [string]: vault_pki_v1alpha1.#SecretBackendRootCert & {
		apiVersion: "pki.vault.upbound.io/v1alpha1"
		kind:       "SecretBackendRootCert"
	}
	secretBackendConfigUrls: [string]: vault_pki_v1alpha1.#SecretBackendConfigUrls & {
		apiVersion: "pki.vault.upbound.io/v1alpha1"
		kind:       "SecretBackendConfigUrls"
	}
	secretBackendRolePKI: [string]: vault_pki_v1alpha1.#SecretBackendRole & {
		apiVersion: "pki.vault.upbound.io/v1alpha1"
		kind:       "SecretBackendRole"
	}
})
