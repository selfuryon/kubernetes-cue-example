// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-vault/apis/identity/v1alpha1

package v1alpha1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#OidcAssignmentInitParameters: {
	// A set of Vault entity IDs.
	// A list of Vault entity IDs.
	entityIds?: [...null | string] @go(EntityIds,[]*string)

	// A set of Vault group IDs.
	// A list of Vault group IDs.
	groupIds?: [...null | string] @go(GroupIds,[]*string)

	// The name of the assignment.
	// The name of the assignment.
	name?: null | string @go(Name,*string)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)
}

#OidcAssignmentObservation: {
	// A set of Vault entity IDs.
	// A list of Vault entity IDs.
	entityIds?: [...null | string] @go(EntityIds,[]*string)

	// A set of Vault group IDs.
	// A list of Vault group IDs.
	groupIds?: [...null | string] @go(GroupIds,[]*string)
	id?: null | string @go(ID,*string)

	// The name of the assignment.
	// The name of the assignment.
	name?: null | string @go(Name,*string)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	namespace?: null | string @go(Namespace,*string)
}

#OidcAssignmentParameters: {
	// A set of Vault entity IDs.
	// A list of Vault entity IDs.
	// +kubebuilder:validation:Optional
	entityIds?: [...null | string] @go(EntityIds,[]*string)

	// A set of Vault group IDs.
	// A list of Vault group IDs.
	// +kubebuilder:validation:Optional
	groupIds?: [...null | string] @go(GroupIds,[]*string)

	// The name of the assignment.
	// The name of the assignment.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The namespace to provision the resource in.
	// The value should not contain leading or trailing forward slashes.
	// The namespace is always relative to the provider's configured namespace.
	// Available only for Vault Enterprise.
	// Target namespace. (requires Enterprise)
	// +kubebuilder:validation:Optional
	namespace?: null | string @go(Namespace,*string)
}

// OidcAssignmentSpec defines the desired state of OidcAssignment
#OidcAssignmentSpec: {
	v1.#ResourceSpec
	forProvider: #OidcAssignmentParameters @go(ForProvider)

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
	initProvider?: #OidcAssignmentInitParameters @go(InitProvider)
}

// OidcAssignmentStatus defines the observed state of OidcAssignment.
#OidcAssignmentStatus: {
	v1.#ResourceStatus
	atProvider?: #OidcAssignmentObservation @go(AtProvider)
}

// OidcAssignment is the Schema for the OidcAssignments API. Provision OIDC Assignments in Vault.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,vault}
#OidcAssignment: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || has(self.initProvider.name)",message="name is a required parameter"
	spec:    #OidcAssignmentSpec   @go(Spec)
	status?: #OidcAssignmentStatus @go(Status)
}

// OidcAssignmentList contains a list of OidcAssignments
#OidcAssignmentList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#OidcAssignment] @go(Items,[]OidcAssignment)
}
