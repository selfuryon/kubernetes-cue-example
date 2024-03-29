// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#RegionNetworkFirewallPolicyInitParameters: {
	// An optional description of this resource. Provide this property when you create the resource.
	description?: null | string @go(Description,*string)

	// The project for the resource
	project?: null | string @go(Project,*string)
}

#RegionNetworkFirewallPolicyObservation: {
	// Creation timestamp in RFC3339 text format.
	creationTimestamp?: null | string @go(CreationTimestamp,*string)

	// An optional description of this resource. Provide this property when you create the resource.
	description?: null | string @go(Description,*string)

	// Fingerprint of the resource. This field is used internally during updates of this resource.
	fingerprint?: null | string @go(Fingerprint,*string)

	// an identifier for the resource with format projects/{{project}}/regions/{{region}}/firewallPolicies/{{name}}
	id?: null | string @go(ID,*string)

	// The project for the resource
	project?: null | string @go(Project,*string)

	// The location of this resource.
	region?: null | string @go(Region,*string)

	// The unique identifier for the resource. This identifier is defined by the server.
	regionNetworkFirewallPolicyId?: null | string @go(RegionNetworkFirewallPolicyID,*string)

	// Total count of all firewall policy rule tuples. A firewall policy can not exceed a set number of tuples.
	ruleTupleCount?: null | float64 @go(RuleTupleCount,*float64)

	// Server-defined URL for the resource.
	selfLink?: null | string @go(SelfLink,*string)

	// Server-defined URL for this resource with the resource id.
	selfLinkWithId?: null | string @go(SelfLinkWithID,*string)
}

#RegionNetworkFirewallPolicyParameters: {
	// An optional description of this resource. Provide this property when you create the resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The project for the resource
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The location of this resource.
	// +kubebuilder:validation:Optional
	region?: null | string @go(Region,*string)
}

// RegionNetworkFirewallPolicySpec defines the desired state of RegionNetworkFirewallPolicy
#RegionNetworkFirewallPolicySpec: {
	v1.#ResourceSpec
	forProvider: #RegionNetworkFirewallPolicyParameters @go(ForProvider)

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
	initProvider?: #RegionNetworkFirewallPolicyInitParameters @go(InitProvider)
}

// RegionNetworkFirewallPolicyStatus defines the observed state of RegionNetworkFirewallPolicy.
#RegionNetworkFirewallPolicyStatus: {
	v1.#ResourceStatus
	atProvider?: #RegionNetworkFirewallPolicyObservation @go(AtProvider)
}

// RegionNetworkFirewallPolicy is the Schema for the RegionNetworkFirewallPolicys API. The Compute NetworkFirewallPolicy resource
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#RegionNetworkFirewallPolicy: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta                 @go(ObjectMeta)
	spec:      #RegionNetworkFirewallPolicySpec   @go(Spec)
	status?:   #RegionNetworkFirewallPolicyStatus @go(Status)
}

// RegionNetworkFirewallPolicyList contains a list of RegionNetworkFirewallPolicys
#RegionNetworkFirewallPolicyList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#RegionNetworkFirewallPolicy] @go(Items,[]RegionNetworkFirewallPolicy)
}
