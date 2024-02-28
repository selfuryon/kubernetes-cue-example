// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#GlobalNetworkEndpointInitParameters: {
	// Fully qualified domain name of network endpoint.
	// This can only be specified when network_endpoint_type of the NEG is INTERNET_FQDN_PORT.
	fqdn?: null | string @go(Fqdn,*string)

	// IPv4 address external endpoint.
	ipAddress?: null | string @go(IPAddress,*string)

	// Port number of the external endpoint.
	port?: null | float64 @go(Port,*float64)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#GlobalNetworkEndpointObservation: {
	// Fully qualified domain name of network endpoint.
	// This can only be specified when network_endpoint_type of the NEG is INTERNET_FQDN_PORT.
	fqdn?: null | string @go(Fqdn,*string)

	// The global network endpoint group this endpoint is part of.
	globalNetworkEndpointGroup?: null | string @go(GlobalNetworkEndpointGroup,*string)

	// an identifier for the resource with format {{project}}/{{global_network_endpoint_group}}/{{ip_address}}/{{fqdn}}/{{port}}
	id?: null | string @go(ID,*string)

	// IPv4 address external endpoint.
	ipAddress?: null | string @go(IPAddress,*string)

	// Port number of the external endpoint.
	port?: null | float64 @go(Port,*float64)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#GlobalNetworkEndpointParameters: {
	// Fully qualified domain name of network endpoint.
	// This can only be specified when network_endpoint_type of the NEG is INTERNET_FQDN_PORT.
	// +kubebuilder:validation:Optional
	fqdn?: null | string @go(Fqdn,*string)

	// The global network endpoint group this endpoint is part of.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.GlobalNetworkEndpointGroup
	// +kubebuilder:validation:Optional
	globalNetworkEndpointGroup?: null | string @go(GlobalNetworkEndpointGroup,*string)

	// Reference to a GlobalNetworkEndpointGroup in compute to populate globalNetworkEndpointGroup.
	// +kubebuilder:validation:Optional
	globalNetworkEndpointGroupRef?: null | v1.#Reference @go(GlobalNetworkEndpointGroupRef,*v1.Reference)

	// Selector for a GlobalNetworkEndpointGroup in compute to populate globalNetworkEndpointGroup.
	// +kubebuilder:validation:Optional
	globalNetworkEndpointGroupSelector?: null | v1.#Selector @go(GlobalNetworkEndpointGroupSelector,*v1.Selector)

	// IPv4 address external endpoint.
	// +kubebuilder:validation:Optional
	ipAddress?: null | string @go(IPAddress,*string)

	// Port number of the external endpoint.
	// +kubebuilder:validation:Optional
	port?: null | float64 @go(Port,*float64)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)
}

// GlobalNetworkEndpointSpec defines the desired state of GlobalNetworkEndpoint
#GlobalNetworkEndpointSpec: {
	v1.#ResourceSpec
	forProvider: #GlobalNetworkEndpointParameters @go(ForProvider)

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
	initProvider?: #GlobalNetworkEndpointInitParameters @go(InitProvider)
}

// GlobalNetworkEndpointStatus defines the observed state of GlobalNetworkEndpoint.
#GlobalNetworkEndpointStatus: {
	v1.#ResourceStatus
	atProvider?: #GlobalNetworkEndpointObservation @go(AtProvider)
}

// GlobalNetworkEndpoint is the Schema for the GlobalNetworkEndpoints API. A Global Network endpoint represents a IP address and port combination that exists outside of GCP.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#GlobalNetworkEndpoint: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.port) || (has(self.initProvider) && has(self.initProvider.port))",message="spec.forProvider.port is a required parameter"
	spec:    #GlobalNetworkEndpointSpec   @go(Spec)
	status?: #GlobalNetworkEndpointStatus @go(Status)
}

// GlobalNetworkEndpointList contains a list of GlobalNetworkEndpoints
#GlobalNetworkEndpointList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#GlobalNetworkEndpoint] @go(Items,[]GlobalNetworkEndpoint)
}
