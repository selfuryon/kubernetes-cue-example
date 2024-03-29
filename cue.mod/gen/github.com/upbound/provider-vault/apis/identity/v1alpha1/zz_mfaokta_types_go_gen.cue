// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-vault/apis/identity/v1alpha1

package v1alpha1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#MfaOktaInitParameters: {
	// The base domain to use for API requests.
	// The base domain to use for API requests.
	baseUrl?: null | string @go(BaseURL,*string)

	// Target namespace. (requires Enterprise)
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// Name of the organization to be used in the Okta API.
	// Name of the organization to be used in the Okta API.
	orgName?: null | string @go(OrgName,*string)

	// Only match the primary email for the account.
	// Only match the primary email for the account.
	primaryEmail?: null | bool @go(PrimaryEmail,*bool)

	// A template string for mapping Identity names to MFA methods.
	// A template string for mapping Identity names to MFA methods.
	usernameFormat?: null | string @go(UsernameFormat,*string)
}

#MfaOktaObservation: {
	// The base domain to use for API requests.
	// The base domain to use for API requests.
	baseUrl?: null | string @go(BaseURL,*string)
	id?:      null | string @go(ID,*string)

	// Method ID.
	// Method ID.
	methodId?: null | string @go(MethodID,*string)

	// Mount accessor.
	// Mount accessor.
	mountAccessor?: null | string @go(MountAccessor,*string)

	// Method name.
	name?: null | string @go(Name,*string)

	// Target namespace. (requires Enterprise)
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// Method's namespace ID.
	// Method's namespace ID.
	namespaceId?: null | string @go(NamespaceID,*string)

	// Method's namespace path.
	// Method's namespace path.
	namespacePath?: null | string @go(NamespacePath,*string)

	// Name of the organization to be used in the Okta API.
	// Name of the organization to be used in the Okta API.
	orgName?: null | string @go(OrgName,*string)

	// Only match the primary email for the account.
	// Only match the primary email for the account.
	primaryEmail?: null | bool @go(PrimaryEmail,*bool)

	// MFA type.
	// MFA type.
	type?: null | string @go(Type,*string)

	// Resource UUID.
	// Resource UUID.
	uuid?: null | string @go(UUID,*string)

	// A template string for mapping Identity names to MFA methods.
	// A template string for mapping Identity names to MFA methods.
	usernameFormat?: null | string @go(UsernameFormat,*string)
}

#MfaOktaParameters: {
	// Okta API token.
	// Okta API token.
	// +kubebuilder:validation:Optional
	apiTokenSecretRef: v1.#SecretKeySelector @go(APITokenSecretRef)

	// The base domain to use for API requests.
	// The base domain to use for API requests.
	// +kubebuilder:validation:Optional
	baseUrl?: null | string @go(BaseURL,*string)

	// Target namespace. (requires Enterprise)
	// Target namespace. (requires Enterprise)
	// +kubebuilder:validation:Optional
	namespace?: null | string @go(Namespace,*string)

	// Name of the organization to be used in the Okta API.
	// Name of the organization to be used in the Okta API.
	// +kubebuilder:validation:Optional
	orgName?: null | string @go(OrgName,*string)

	// Only match the primary email for the account.
	// Only match the primary email for the account.
	// +kubebuilder:validation:Optional
	primaryEmail?: null | bool @go(PrimaryEmail,*bool)

	// A template string for mapping Identity names to MFA methods.
	// A template string for mapping Identity names to MFA methods.
	// +kubebuilder:validation:Optional
	usernameFormat?: null | string @go(UsernameFormat,*string)
}

// MfaOktaSpec defines the desired state of MfaOkta
#MfaOktaSpec: {
	v1.#ResourceSpec
	forProvider: #MfaOktaParameters @go(ForProvider)

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
	initProvider?: #MfaOktaInitParameters @go(InitProvider)
}

// MfaOktaStatus defines the observed state of MfaOkta.
#MfaOktaStatus: {
	v1.#ResourceStatus
	atProvider?: #MfaOktaObservation @go(AtProvider)
}

// MfaOkta is the Schema for the MfaOktas API. Resource for configuring the okta MFA method.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,vault}
#MfaOkta: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.apiTokenSecretRef)",message="apiTokenSecretRef is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.orgName) || has(self.initProvider.orgName)",message="orgName is a required parameter"
	spec:    #MfaOktaSpec   @go(Spec)
	status?: #MfaOktaStatus @go(Status)
}

// MfaOktaList contains a list of MfaOktas
#MfaOktaList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#MfaOkta] @go(Items,[]MfaOkta)
}
