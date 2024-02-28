// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/servicenetworking/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ConnectionInitParameters: {
	// Provider peering service that is managing peering connectivity for a
	// service provider organization. For Google services that support this functionality it is
	// 'servicenetworking.googleapis.com'.
	service?: null | string @go(Service,*string)
}

#ConnectionObservation: {
	id?: null | string @go(ID,*string)

	// Name of VPC network connected with service producers using VPC peering.
	network?: null | string @go(Network,*string)

	// (Computed) The name of the VPC Network Peering connection that was created by the service producer.
	peering?: null | string @go(Peering,*string)

	// Named IP address range(s) of PEERING type reserved for
	// this service provider. Note that invoking this method with a different range when connection
	// is already established will not reallocate already provisioned service producer subnetworks.
	reservedPeeringRanges?: [...null | string] @go(ReservedPeeringRanges,[]*string)

	// Provider peering service that is managing peering connectivity for a
	// service provider organization. For Google services that support this functionality it is
	// 'servicenetworking.googleapis.com'.
	service?: null | string @go(Service,*string)
}

#ConnectionParameters: {
	// Name of VPC network connected with service producers using VPC peering.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Network
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	network?: null | string @go(Network,*string)

	// Reference to a Network in compute to populate network.
	// +kubebuilder:validation:Optional
	networkRef?: null | v1.#Reference @go(NetworkRef,*v1.Reference)

	// Selector for a Network in compute to populate network.
	// +kubebuilder:validation:Optional
	networkSelector?: null | v1.#Selector @go(NetworkSelector,*v1.Selector)

	// Named IP address range(s) of PEERING type reserved for
	// this service provider. Note that invoking this method with a different range when connection
	// is already established will not reallocate already provisioned service producer subnetworks.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.GlobalAddress
	// +kubebuilder:validation:Optional
	reservedPeeringRanges?: [...null | string] @go(ReservedPeeringRanges,[]*string)

	// References to GlobalAddress in compute to populate reservedPeeringRanges.
	// +kubebuilder:validation:Optional
	reservedPeeringRangesRefs?: [...v1.#Reference] @go(ReservedPeeringRangesRefs,[]v1.Reference)

	// Selector for a list of GlobalAddress in compute to populate reservedPeeringRanges.
	// +kubebuilder:validation:Optional
	reservedPeeringRangesSelector?: null | v1.#Selector @go(ReservedPeeringRangesSelector,*v1.Selector)

	// Provider peering service that is managing peering connectivity for a
	// service provider organization. For Google services that support this functionality it is
	// 'servicenetworking.googleapis.com'.
	// +kubebuilder:validation:Optional
	service?: null | string @go(Service,*string)
}

// ConnectionSpec defines the desired state of Connection
#ConnectionSpec: {
	v1.#ResourceSpec
	forProvider: #ConnectionParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #ConnectionInitParameters @go(InitProvider)
}

// ConnectionStatus defines the observed state of Connection.
#ConnectionStatus: {
	v1.#ResourceStatus
	atProvider?: #ConnectionObservation @go(AtProvider)
}

// Connection is the Schema for the Connections API. Manages creating a private VPC connection to a service provider.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Connection: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.service) || (has(self.initProvider) && has(self.initProvider.service))",message="spec.forProvider.service is a required parameter"
	spec:    #ConnectionSpec   @go(Spec)
	status?: #ConnectionStatus @go(Status)
}

// ConnectionList contains a list of Connections
#ConnectionList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Connection] @go(Items,[]Connection)
}
