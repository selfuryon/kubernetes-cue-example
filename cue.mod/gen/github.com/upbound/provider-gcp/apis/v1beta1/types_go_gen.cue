// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/v1beta1

package v1beta1

import (
	xpv1 "github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// A ProviderConfigSpec defines the desired state of a ProviderConfig.
#ProviderConfigSpec: {
	// Credentials required to authenticate to this provider.
	credentials: #ProviderCredentials @go(Credentials)

	// ProjectID is the project name (not numerical ID) of this GCP ProviderConfig.
	projectID: string @go(ProjectID)
}

// ProviderCredentials required to authenticate.
#ProviderCredentials: {
	// Source of the provider credentials.
	// +kubebuilder:validation:Enum=None;Secret;AccessToken;ImpersonateServiceAccount;InjectedIdentity;Environment;Filesystem;Upbound
	source: xpv1.#CredentialsSource @go(Source)

	// Upbound defines the options for authenticating using Upbound as an
	// identity provider.
	upbound?: null | #Upbound @go(Upbound,*Upbound)

	xpv1.#CommonCredentialSelectors

	// Use GCP service account impersonation for authentication.
	impersonateServiceAccount?: #ImpersonateServiceAccountSpec @go(ImpersonateServiceAccountSpec)
}

#ImpersonateServiceAccountSpec: {
	// GCP service account email address
	name: string @go(Name)
}

// Upbound defines the options for authenticating using Upbound as an identity
// provider.
#Upbound: {
	// Federation is the configuration for federated identity.
	federation?: null | #Federation @go(Federation,*Federation)
}

// Federation defines the configuration for federated identity from an external
// provider.
#Federation: {
	// ProviderID is the fully-qualified identifier for the identity provider on
	// GCP. The format is
	// `projects/<project-id>/locations/global/workloadIdentityPools/<identity-pool>/providers/<identity-provider>`.
	// +kubebuilder:validation:MinLength=1
	providerID: string @go(ProviderID)

	// ServiceAccount is the email address for the attached service account.
	// +kubebuilder:validation:MinLength=1
	serviceAccount: string @go(ServiceAccount)
}

// A ProviderConfigStatus reflects the observed state of a ProviderConfig.
#ProviderConfigStatus: {
	xpv1.#ProviderConfigStatus
}

// A ProviderConfig configures a GCP provider.
// +kubebuilder:subresource:status
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:printcolumn:name="SECRET-NAME",type="string",JSONPath=".spec.credentials.secretRef.name",priority=1
// +kubebuilder:resource:scope=Cluster
// +kubebuilder:resource:scope=Cluster,categories={crossplane,providerconfig,gcp}
// +kubebuilder:storageversion
#ProviderConfig: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta    @go(ObjectMeta)
	spec:      #ProviderConfigSpec   @go(Spec)
	status?:   #ProviderConfigStatus @go(Status)
}

// ProviderConfigList contains a list of ProviderConfig.
#ProviderConfigList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ProviderConfig] @go(Items,[]ProviderConfig)
}

// A ProviderConfigUsage indicates that a resource is using a ProviderConfig.
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:printcolumn:name="CONFIG-NAME",type="string",JSONPath=".providerConfigRef.name"
// +kubebuilder:printcolumn:name="RESOURCE-KIND",type="string",JSONPath=".resourceRef.kind"
// +kubebuilder:printcolumn:name="RESOURCE-NAME",type="string",JSONPath=".resourceRef.name"
// +kubebuilder:resource:scope=Cluster,categories={crossplane,providerconfig,gcp}
// +kubebuilder:storageversion
#ProviderConfigUsage: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	xpv1.#ProviderConfigUsage
}

// ProviderConfigUsageList contains a list of ProviderConfigUsage
#ProviderConfigUsageList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ProviderConfigUsage] @go(Items,[]ProviderConfigUsage)
}
