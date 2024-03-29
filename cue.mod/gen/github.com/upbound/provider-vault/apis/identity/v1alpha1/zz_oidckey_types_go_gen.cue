// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-vault/apis/identity/v1alpha1

package v1alpha1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#OidcKeyInitParameters: {
	// Signing algorithm to use. Signing algorithm to use.
	// Allowed values are: RS256 (default), RS384, RS512, ES256, ES384, ES512, EdDSA.
	// Signing algorithm to use. Signing algorithm to use. Allowed values are: RS256 (default), RS384, RS512, ES256, ES384, ES512, EdDSA.
	algorithm?: null | string @go(Algorithm,*string)

	// : Array of role client ID allowed to use this key for signing. If
	// empty, no roles are allowed. If ["*"], all roles are allowed.
	// Array of role client ids allowed to use this key for signing. If empty, no roles are allowed. If "*", all roles are allowed.
	allowedClientIds?: [...null | string] @go(AllowedClientIds,[]*string)

	// Name of the OIDC Key to create.
	// Name of the key.
	name?: null | string @go(Name,*string)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// How often to generate a new signing key in number of seconds
	// How often to generate a new signing key in number of seconds
	rotationPeriod?: null | float64 @go(RotationPeriod,*float64)

	// "Controls how long the public portion of a signing key will be
	// available for verification after being rotated in seconds.
	// Controls how long the public portion of a signing key will be available for verification after being rotated in seconds.
	verificationTtl?: null | float64 @go(VerificationTTL,*float64)
}

#OidcKeyObservation: {
	// Signing algorithm to use. Signing algorithm to use.
	// Allowed values are: RS256 (default), RS384, RS512, ES256, ES384, ES512, EdDSA.
	// Signing algorithm to use. Signing algorithm to use. Allowed values are: RS256 (default), RS384, RS512, ES256, ES384, ES512, EdDSA.
	algorithm?: null | string @go(Algorithm,*string)

	// : Array of role client ID allowed to use this key for signing. If
	// empty, no roles are allowed. If ["*"], all roles are allowed.
	// Array of role client ids allowed to use this key for signing. If empty, no roles are allowed. If "*", all roles are allowed.
	allowedClientIds?: [...null | string] @go(AllowedClientIds,[]*string)

	// The name of the created key.
	id?: null | string @go(ID,*string)

	// Name of the OIDC Key to create.
	// Name of the key.
	name?: null | string @go(Name,*string)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)

	// How often to generate a new signing key in number of seconds
	// How often to generate a new signing key in number of seconds
	rotationPeriod?: null | float64 @go(RotationPeriod,*float64)

	// "Controls how long the public portion of a signing key will be
	// available for verification after being rotated in seconds.
	// Controls how long the public portion of a signing key will be available for verification after being rotated in seconds.
	verificationTtl?: null | float64 @go(VerificationTTL,*float64)
}

#OidcKeyParameters: {
	// Signing algorithm to use. Signing algorithm to use.
	// Allowed values are: RS256 (default), RS384, RS512, ES256, ES384, ES512, EdDSA.
	// Signing algorithm to use. Signing algorithm to use. Allowed values are: RS256 (default), RS384, RS512, ES256, ES384, ES512, EdDSA.
	// +kubebuilder:validation:Optional
	algorithm?: null | string @go(Algorithm,*string)

	// : Array of role client ID allowed to use this key for signing. If
	// empty, no roles are allowed. If ["*"], all roles are allowed.
	// Array of role client ids allowed to use this key for signing. If empty, no roles are allowed. If "*", all roles are allowed.
	// +kubebuilder:validation:Optional
	allowedClientIds?: [...null | string] @go(AllowedClientIds,[]*string)

	// Name of the OIDC Key to create.
	// Name of the key.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	// +kubebuilder:validation:Optional
	namespace?: null | string @go(Namespace,*string)

	// How often to generate a new signing key in number of seconds
	// How often to generate a new signing key in number of seconds
	// +kubebuilder:validation:Optional
	rotationPeriod?: null | float64 @go(RotationPeriod,*float64)

	// "Controls how long the public portion of a signing key will be
	// available for verification after being rotated in seconds.
	// Controls how long the public portion of a signing key will be available for verification after being rotated in seconds.
	// +kubebuilder:validation:Optional
	verificationTtl?: null | float64 @go(VerificationTTL,*float64)
}

// OidcKeySpec defines the desired state of OidcKey
#OidcKeySpec: {
	v1.#ResourceSpec
	forProvider: #OidcKeyParameters @go(ForProvider)

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
	initProvider?: #OidcKeyInitParameters @go(InitProvider)
}

// OidcKeyStatus defines the observed state of OidcKey.
#OidcKeyStatus: {
	v1.#ResourceStatus
	atProvider?: #OidcKeyObservation @go(AtProvider)
}

// OidcKey is the Schema for the OidcKeys API. Creates an Identity OIDC Named Key for Vault
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,vault}
#OidcKey: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || has(self.initProvider.name)",message="name is a required parameter"
	spec:    #OidcKeySpec   @go(Spec)
	status?: #OidcKeyStatus @go(Status)
}

// OidcKeyList contains a list of OidcKeys
#OidcKeyList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#OidcKey] @go(Items,[]OidcKey)
}
