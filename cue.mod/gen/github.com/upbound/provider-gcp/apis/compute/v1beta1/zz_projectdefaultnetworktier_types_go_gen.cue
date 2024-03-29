// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ProjectDefaultNetworkTierInitParameters: {
	// The default network tier to be configured for the project.
	// This field can take the following values: PREMIUM or STANDARD.
	networkTier?: null | string @go(NetworkTier,*string)

	// The ID of the project in which the resource belongs. If it
	// is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#ProjectDefaultNetworkTierObservation: {
	// an identifier for the resource with format {{project}}
	id?: null | string @go(ID,*string)

	// The default network tier to be configured for the project.
	// This field can take the following values: PREMIUM or STANDARD.
	networkTier?: null | string @go(NetworkTier,*string)

	// The ID of the project in which the resource belongs. If it
	// is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#ProjectDefaultNetworkTierParameters: {
	// The default network tier to be configured for the project.
	// This field can take the following values: PREMIUM or STANDARD.
	// +kubebuilder:validation:Optional
	networkTier?: null | string @go(NetworkTier,*string)

	// The ID of the project in which the resource belongs. If it
	// is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)
}

// ProjectDefaultNetworkTierSpec defines the desired state of ProjectDefaultNetworkTier
#ProjectDefaultNetworkTierSpec: {
	v1.#ResourceSpec
	forProvider: #ProjectDefaultNetworkTierParameters @go(ForProvider)

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
	initProvider?: #ProjectDefaultNetworkTierInitParameters @go(InitProvider)
}

// ProjectDefaultNetworkTierStatus defines the observed state of ProjectDefaultNetworkTier.
#ProjectDefaultNetworkTierStatus: {
	v1.#ResourceStatus
	atProvider?: #ProjectDefaultNetworkTierObservation @go(AtProvider)
}

// ProjectDefaultNetworkTier is the Schema for the ProjectDefaultNetworkTiers API. Configures the default network tier for a project.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ProjectDefaultNetworkTier: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.networkTier) || (has(self.initProvider) && has(self.initProvider.networkTier))",message="spec.forProvider.networkTier is a required parameter"
	spec:    #ProjectDefaultNetworkTierSpec   @go(Spec)
	status?: #ProjectDefaultNetworkTierStatus @go(Status)
}

// ProjectDefaultNetworkTierList contains a list of ProjectDefaultNetworkTiers
#ProjectDefaultNetworkTierList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ProjectDefaultNetworkTier] @go(Items,[]ProjectDefaultNetworkTier)
}
