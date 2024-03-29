// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#GlobalAddressInitParameters: {
	// The IP address or beginning of the address range represented by this
	// resource. This can be supplied as an input to reserve a specific
	// address or omitted to allow GCP to choose a valid one for you.
	address?: null | string @go(Address,*string)

	// The type of the address to reserve.
	addressType?: null | string @go(AddressType,*string)

	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// The IP Version that will be used by this address. The default value is IPV4.
	// Possible values are: IPV4, IPV6.
	ipVersion?: null | string @go(IPVersion,*string)

	// The prefix length of the IP range. If not present, it means the
	// address field is a single IP address.
	// This field is not applicable to addresses with addressType=INTERNAL
	// when purpose=PRIVATE_SERVICE_CONNECT
	prefixLength?: null | float64 @go(PrefixLength,*float64)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The purpose of the resource. Possible values include:
	purpose?: null | string @go(Purpose,*string)
}

#GlobalAddressObservation: {
	// The IP address or beginning of the address range represented by this
	// resource. This can be supplied as an input to reserve a specific
	// address or omitted to allow GCP to choose a valid one for you.
	address?: null | string @go(Address,*string)

	// The type of the address to reserve.
	addressType?: null | string @go(AddressType,*string)

	// Creation timestamp in RFC3339 text format.
	creationTimestamp?: null | string @go(CreationTimestamp,*string)

	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// an identifier for the resource with format projects/{{project}}/global/addresses/{{name}}
	id?: null | string @go(ID,*string)

	// The IP Version that will be used by this address. The default value is IPV4.
	// Possible values are: IPV4, IPV6.
	ipVersion?: null | string @go(IPVersion,*string)

	// The URL of the network in which to reserve the IP range. The IP range
	// must be in RFC1918 space. The network cannot be deleted if there are
	// any reserved IP ranges referring to it.
	// This should only be set when using an Internal address.
	network?: null | string @go(Network,*string)

	// The prefix length of the IP range. If not present, it means the
	// address field is a single IP address.
	// This field is not applicable to addresses with addressType=INTERNAL
	// when purpose=PRIVATE_SERVICE_CONNECT
	prefixLength?: null | float64 @go(PrefixLength,*float64)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The purpose of the resource. Possible values include:
	purpose?: null | string @go(Purpose,*string)

	// The URI of the created resource.
	selfLink?: null | string @go(SelfLink,*string)
}

#GlobalAddressParameters: {
	// The IP address or beginning of the address range represented by this
	// resource. This can be supplied as an input to reserve a specific
	// address or omitted to allow GCP to choose a valid one for you.
	// +kubebuilder:validation:Optional
	address?: null | string @go(Address,*string)

	// The type of the address to reserve.
	// +kubebuilder:validation:Optional
	addressType?: null | string @go(AddressType,*string)

	// An optional description of this resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The IP Version that will be used by this address. The default value is IPV4.
	// Possible values are: IPV4, IPV6.
	// +kubebuilder:validation:Optional
	ipVersion?: null | string @go(IPVersion,*string)

	// The URL of the network in which to reserve the IP range. The IP range
	// must be in RFC1918 space. The network cannot be deleted if there are
	// any reserved IP ranges referring to it.
	// This should only be set when using an Internal address.
	// +crossplane:generate:reference:type=Network
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.ExtractResourceID()
	// +kubebuilder:validation:Optional
	network?: null | string @go(Network,*string)

	// Reference to a Network to populate network.
	// +kubebuilder:validation:Optional
	networkRef?: null | v1.#Reference @go(NetworkRef,*v1.Reference)

	// Selector for a Network to populate network.
	// +kubebuilder:validation:Optional
	networkSelector?: null | v1.#Selector @go(NetworkSelector,*v1.Selector)

	// The prefix length of the IP range. If not present, it means the
	// address field is a single IP address.
	// This field is not applicable to addresses with addressType=INTERNAL
	// when purpose=PRIVATE_SERVICE_CONNECT
	// +kubebuilder:validation:Optional
	prefixLength?: null | float64 @go(PrefixLength,*float64)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The purpose of the resource. Possible values include:
	// +kubebuilder:validation:Optional
	purpose?: null | string @go(Purpose,*string)
}

// GlobalAddressSpec defines the desired state of GlobalAddress
#GlobalAddressSpec: {
	v1.#ResourceSpec
	forProvider: #GlobalAddressParameters @go(ForProvider)

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
	initProvider?: #GlobalAddressInitParameters @go(InitProvider)
}

// GlobalAddressStatus defines the observed state of GlobalAddress.
#GlobalAddressStatus: {
	v1.#ResourceStatus
	atProvider?: #GlobalAddressObservation @go(AtProvider)
}

// GlobalAddress is the Schema for the GlobalAddresss API. Represents a Global Address resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#GlobalAddress: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta   @go(ObjectMeta)
	spec:      #GlobalAddressSpec   @go(Spec)
	status?:   #GlobalAddressStatus @go(Status)
}

// GlobalAddressList contains a list of GlobalAddresss
#GlobalAddressList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#GlobalAddress] @go(Items,[]GlobalAddress)
}
