// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-vault/apis/kubernetes/v1alpha1

package v1alpha1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#SecretBackendInitParameters: {
	// List of managed key registry entry names that the mount in question is allowed to access
	allowedManagedKeys?: [...null | string] @go(AllowedManagedKeys,[]*string)

	// Specifies the list of keys that will not be HMAC'd by audit devices in the request data object.
	auditNonHmacRequestKeys?: [...null | string] @go(AuditNonHMACRequestKeys,[]*string)

	// Specifies the list of keys that will not be HMAC'd by audit devices in the response data object.
	auditNonHmacResponseKeys?: [...null | string] @go(AuditNonHMACResponseKeys,[]*string)

	// Default lease duration for tokens and secrets in seconds
	defaultLeaseTtlSeconds?: null | float64 @go(DefaultLeaseTTLSeconds,*float64)

	// Human-friendly description of the mount
	description?: null | string @go(Description,*string)

	// Disable defaulting to the local CA certificate and
	// service account JWT when Vault is running in a Kubernetes pod.
	// Disable defaulting to the local CA certificate and service account JWT when running in a Kubernetes pod.
	disableLocalCaJwt?: null | bool @go(DisableLocalCAJwt,*bool)

	// Enable the secrets engine to access Vault's external entropy source
	externalEntropyAccess?: null | bool @go(ExternalEntropyAccess,*bool)

	// A PEM-encoded CA certificate used by the
	// secrets engine to verify the Kubernetes API server certificate. Defaults to the local
	// pod’s CA if Vault is running in Kubernetes. Otherwise, defaults to the root CA set where
	// Vault is running.
	// A PEM-encoded CA certificate used by the secret engine to verify the Kubernetes API server certificate. Defaults to the local pod’s CA if found, or otherwise the host's root CA set.
	kubernetesCaCert?: null | string @go(KubernetesCACert,*string)

	// The Kubernetes API URL to connect to. Required if the
	// standard pod environment variables KUBERNETES_SERVICE_HOST or KUBERNETES_SERVICE_PORT
	// are not set on the host that Vault is running on.
	// The Kubernetes API URL to connect to.
	kubernetesHost?: null | string @go(KubernetesHost,*string)

	// Local mount flag that can be explicitly set to true to enforce local mount in HA environment
	local?: null | bool @go(Local,*bool)

	// Maximum possible lease duration for tokens and secrets in seconds
	maxLeaseTtlSeconds?: null | float64 @go(MaxLeaseTTLSeconds,*float64)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// Specifies mount type specific options that are passed to the backend
	options?: {[string]: null | string} @go(Options,map[string]*string)

	// Where the secret backend will be mounted
	path?: null | string @go(Path,*string)

	// Enable seal wrapping for the mount, causing values stored by the mount to be wrapped by the seal's encryption capability
	sealWrap?: null | bool @go(SealWrap,*bool)
}

#SecretBackendObservation: {
	// Accessor of the mount
	accessor?: null | string @go(Accessor,*string)

	// List of managed key registry entry names that the mount in question is allowed to access
	allowedManagedKeys?: [...null | string] @go(AllowedManagedKeys,[]*string)

	// Specifies the list of keys that will not be HMAC'd by audit devices in the request data object.
	auditNonHmacRequestKeys?: [...null | string] @go(AuditNonHMACRequestKeys,[]*string)

	// Specifies the list of keys that will not be HMAC'd by audit devices in the response data object.
	auditNonHmacResponseKeys?: [...null | string] @go(AuditNonHMACResponseKeys,[]*string)

	// Default lease duration for tokens and secrets in seconds
	defaultLeaseTtlSeconds?: null | float64 @go(DefaultLeaseTTLSeconds,*float64)

	// Human-friendly description of the mount
	description?: null | string @go(Description,*string)

	// Disable defaulting to the local CA certificate and
	// service account JWT when Vault is running in a Kubernetes pod.
	// Disable defaulting to the local CA certificate and service account JWT when running in a Kubernetes pod.
	disableLocalCaJwt?: null | bool @go(DisableLocalCAJwt,*bool)

	// Enable the secrets engine to access Vault's external entropy source
	externalEntropyAccess?: null | bool   @go(ExternalEntropyAccess,*bool)
	id?:                    null | string @go(ID,*string)

	// A PEM-encoded CA certificate used by the
	// secrets engine to verify the Kubernetes API server certificate. Defaults to the local
	// pod’s CA if Vault is running in Kubernetes. Otherwise, defaults to the root CA set where
	// Vault is running.
	// A PEM-encoded CA certificate used by the secret engine to verify the Kubernetes API server certificate. Defaults to the local pod’s CA if found, or otherwise the host's root CA set.
	kubernetesCaCert?: null | string @go(KubernetesCACert,*string)

	// The Kubernetes API URL to connect to. Required if the
	// standard pod environment variables KUBERNETES_SERVICE_HOST or KUBERNETES_SERVICE_PORT
	// are not set on the host that Vault is running on.
	// The Kubernetes API URL to connect to.
	kubernetesHost?: null | string @go(KubernetesHost,*string)

	// Local mount flag that can be explicitly set to true to enforce local mount in HA environment
	local?: null | bool @go(Local,*bool)

	// Maximum possible lease duration for tokens and secrets in seconds
	maxLeaseTtlSeconds?: null | float64 @go(MaxLeaseTTLSeconds,*float64)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// Specifies mount type specific options that are passed to the backend
	options?: {[string]: null | string} @go(Options,map[string]*string)

	// Where the secret backend will be mounted
	path?: null | string @go(Path,*string)

	// Enable seal wrapping for the mount, causing values stored by the mount to be wrapped by the seal's encryption capability
	sealWrap?: null | bool @go(SealWrap,*bool)
}

#SecretBackendParameters: {
	// List of managed key registry entry names that the mount in question is allowed to access
	// +kubebuilder:validation:Optional
	allowedManagedKeys?: [...null | string] @go(AllowedManagedKeys,[]*string)

	// Specifies the list of keys that will not be HMAC'd by audit devices in the request data object.
	// +kubebuilder:validation:Optional
	auditNonHmacRequestKeys?: [...null | string] @go(AuditNonHMACRequestKeys,[]*string)

	// Specifies the list of keys that will not be HMAC'd by audit devices in the response data object.
	// +kubebuilder:validation:Optional
	auditNonHmacResponseKeys?: [...null | string] @go(AuditNonHMACResponseKeys,[]*string)

	// Default lease duration for tokens and secrets in seconds
	// +kubebuilder:validation:Optional
	defaultLeaseTtlSeconds?: null | float64 @go(DefaultLeaseTTLSeconds,*float64)

	// Human-friendly description of the mount
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Disable defaulting to the local CA certificate and
	// service account JWT when Vault is running in a Kubernetes pod.
	// Disable defaulting to the local CA certificate and service account JWT when running in a Kubernetes pod.
	// +kubebuilder:validation:Optional
	disableLocalCaJwt?: null | bool @go(DisableLocalCAJwt,*bool)

	// Enable the secrets engine to access Vault's external entropy source
	// +kubebuilder:validation:Optional
	externalEntropyAccess?: null | bool @go(ExternalEntropyAccess,*bool)

	// A PEM-encoded CA certificate used by the
	// secrets engine to verify the Kubernetes API server certificate. Defaults to the local
	// pod’s CA if Vault is running in Kubernetes. Otherwise, defaults to the root CA set where
	// Vault is running.
	// A PEM-encoded CA certificate used by the secret engine to verify the Kubernetes API server certificate. Defaults to the local pod’s CA if found, or otherwise the host's root CA set.
	// +kubebuilder:validation:Optional
	kubernetesCaCert?: null | string @go(KubernetesCACert,*string)

	// The Kubernetes API URL to connect to. Required if the
	// standard pod environment variables KUBERNETES_SERVICE_HOST or KUBERNETES_SERVICE_PORT
	// are not set on the host that Vault is running on.
	// The Kubernetes API URL to connect to.
	// +kubebuilder:validation:Optional
	kubernetesHost?: null | string @go(KubernetesHost,*string)

	// Local mount flag that can be explicitly set to true to enforce local mount in HA environment
	// +kubebuilder:validation:Optional
	local?: null | bool @go(Local,*bool)

	// Maximum possible lease duration for tokens and secrets in seconds
	// +kubebuilder:validation:Optional
	maxLeaseTtlSeconds?: null | float64 @go(MaxLeaseTTLSeconds,*float64)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	// +kubebuilder:validation:Optional
	namespace?: null | string @go(Namespace,*string)

	// Specifies mount type specific options that are passed to the backend
	// +kubebuilder:validation:Optional
	options?: {[string]: null | string} @go(Options,map[string]*string)

	// Where the secret backend will be mounted
	// +kubebuilder:validation:Optional
	path?: null | string @go(Path,*string)

	// Enable seal wrapping for the mount, causing values stored by the mount to be wrapped by the seal's encryption capability
	// +kubebuilder:validation:Optional
	sealWrap?: null | bool @go(SealWrap,*bool)

	// The JSON web token of the service account used by the
	// secrets engine to manage Kubernetes credentials. Defaults to the local pod’s JWT if Vault
	// is running in Kubernetes.
	// The JSON web token of the service account used by the secrets engine to manage Kubernetes credentials. Defaults to the local pod’s JWT if found.
	// +kubebuilder:validation:Optional
	serviceAccountJwtSecretRef?: null | v1.#SecretKeySelector @go(ServiceAccountJwtSecretRef,*v1.SecretKeySelector)
}

// SecretBackendSpec defines the desired state of SecretBackend
#SecretBackendSpec: {
	v1.#ResourceSpec
	forProvider: #SecretBackendParameters @go(ForProvider)

	// THIS IS AN ALPHA FIELD. Do not use it in production. It is not honored
	// unless the relevant Crossplane feature flag is enabled, and may be
	// changed or removed without notice.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #SecretBackendInitParameters @go(InitProvider)
}

// SecretBackendStatus defines the observed state of SecretBackend.
#SecretBackendStatus: {
	v1.#ResourceStatus
	atProvider?: #SecretBackendObservation @go(AtProvider)
}

// SecretBackend is the Schema for the SecretBackends API. Creates a Kubernetes Secrets Engine in Vault.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,vault}
#SecretBackend: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.path) || has(self.initProvider.path)",message="path is a required parameter"
	spec:    #SecretBackendSpec   @go(Spec)
	status?: #SecretBackendStatus @go(Status)
}

// SecretBackendList contains a list of SecretBackends
#SecretBackendList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#SecretBackend] @go(Items,[]SecretBackend)
}
