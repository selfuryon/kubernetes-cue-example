// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#AdvertisedIPRangesInitParameters: {
	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// The IP range to advertise. The value must be a
	// CIDR-formatted string.
	range?: null | string @go(Range,*string)
}

#AdvertisedIPRangesObservation: {
	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// The IP range to advertise. The value must be a
	// CIDR-formatted string.
	range?: null | string @go(Range,*string)
}

#AdvertisedIPRangesParameters: {
	// An optional description of this resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The IP range to advertise. The value must be a
	// CIDR-formatted string.
	// +kubebuilder:validation:Optional
	range?: null | string @go(Range,*string)
}

#BGPInitParameters: {
	// User-specified flag to indicate which mode to use for advertisement.
	// Default value is DEFAULT.
	// Possible values are: DEFAULT, CUSTOM.
	advertiseMode?: null | string @go(AdvertiseMode,*string)

	// User-specified list of prefix groups to advertise in custom mode.
	// This field can only be populated if advertiseMode is CUSTOM and
	// is advertised to all peers of the router. These groups will be
	// advertised in addition to any specified prefixes. Leave this field
	// blank to advertise no custom groups.
	// This enum field has the one valid value: ALL_SUBNETS
	advertisedGroups?: [...null | string] @go(AdvertisedGroups,[]*string)

	// User-specified list of individual IP ranges to advertise in
	// custom mode. This field can only be populated if advertiseMode
	// is CUSTOM and is advertised to all peers of the router. These IP
	// ranges will be advertised in addition to any specified groups.
	// Leave this field blank to advertise no custom IP ranges.
	// Structure is documented below.
	advertisedIpRanges?: [...#AdvertisedIPRangesInitParameters] @go(AdvertisedIPRanges,[]AdvertisedIPRangesInitParameters)

	// Local BGP Autonomous System Number (ASN). Must be an RFC6996
	// private ASN, either 16-bit or 32-bit. The value will be fixed for
	// this router resource. All VPN tunnels that link to this router
	// will have the same local ASN.
	asn?: null | float64 @go(Asn,*float64)

	// The interval in seconds between BGP keepalive messages that are sent
	// to the peer. Hold time is three times the interval at which keepalive
	// messages are sent, and the hold time is the maximum number of seconds
	// allowed to elapse between successive keepalive messages that BGP
	// receives from a peer.
	// BGP will use the smaller of either the local hold time value or the
	// peer's hold time value as the hold time for the BGP connection
	// between the two peers. If set, this value must be between 20 and 60.
	// The default is 20.
	keepaliveInterval?: null | float64 @go(KeepaliveInterval,*float64)
}

#BGPObservation: {
	// User-specified flag to indicate which mode to use for advertisement.
	// Default value is DEFAULT.
	// Possible values are: DEFAULT, CUSTOM.
	advertiseMode?: null | string @go(AdvertiseMode,*string)

	// User-specified list of prefix groups to advertise in custom mode.
	// This field can only be populated if advertiseMode is CUSTOM and
	// is advertised to all peers of the router. These groups will be
	// advertised in addition to any specified prefixes. Leave this field
	// blank to advertise no custom groups.
	// This enum field has the one valid value: ALL_SUBNETS
	advertisedGroups?: [...null | string] @go(AdvertisedGroups,[]*string)

	// User-specified list of individual IP ranges to advertise in
	// custom mode. This field can only be populated if advertiseMode
	// is CUSTOM and is advertised to all peers of the router. These IP
	// ranges will be advertised in addition to any specified groups.
	// Leave this field blank to advertise no custom IP ranges.
	// Structure is documented below.
	advertisedIpRanges?: [...#AdvertisedIPRangesObservation] @go(AdvertisedIPRanges,[]AdvertisedIPRangesObservation)

	// Local BGP Autonomous System Number (ASN). Must be an RFC6996
	// private ASN, either 16-bit or 32-bit. The value will be fixed for
	// this router resource. All VPN tunnels that link to this router
	// will have the same local ASN.
	asn?: null | float64 @go(Asn,*float64)

	// The interval in seconds between BGP keepalive messages that are sent
	// to the peer. Hold time is three times the interval at which keepalive
	// messages are sent, and the hold time is the maximum number of seconds
	// allowed to elapse between successive keepalive messages that BGP
	// receives from a peer.
	// BGP will use the smaller of either the local hold time value or the
	// peer's hold time value as the hold time for the BGP connection
	// between the two peers. If set, this value must be between 20 and 60.
	// The default is 20.
	keepaliveInterval?: null | float64 @go(KeepaliveInterval,*float64)
}

#BGPParameters: {
	// User-specified flag to indicate which mode to use for advertisement.
	// Default value is DEFAULT.
	// Possible values are: DEFAULT, CUSTOM.
	// +kubebuilder:validation:Optional
	advertiseMode?: null | string @go(AdvertiseMode,*string)

	// User-specified list of prefix groups to advertise in custom mode.
	// This field can only be populated if advertiseMode is CUSTOM and
	// is advertised to all peers of the router. These groups will be
	// advertised in addition to any specified prefixes. Leave this field
	// blank to advertise no custom groups.
	// This enum field has the one valid value: ALL_SUBNETS
	// +kubebuilder:validation:Optional
	advertisedGroups?: [...null | string] @go(AdvertisedGroups,[]*string)

	// User-specified list of individual IP ranges to advertise in
	// custom mode. This field can only be populated if advertiseMode
	// is CUSTOM and is advertised to all peers of the router. These IP
	// ranges will be advertised in addition to any specified groups.
	// Leave this field blank to advertise no custom IP ranges.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	advertisedIpRanges?: [...#AdvertisedIPRangesParameters] @go(AdvertisedIPRanges,[]AdvertisedIPRangesParameters)

	// Local BGP Autonomous System Number (ASN). Must be an RFC6996
	// private ASN, either 16-bit or 32-bit. The value will be fixed for
	// this router resource. All VPN tunnels that link to this router
	// will have the same local ASN.
	// +kubebuilder:validation:Optional
	asn?: null | float64 @go(Asn,*float64)

	// The interval in seconds between BGP keepalive messages that are sent
	// to the peer. Hold time is three times the interval at which keepalive
	// messages are sent, and the hold time is the maximum number of seconds
	// allowed to elapse between successive keepalive messages that BGP
	// receives from a peer.
	// BGP will use the smaller of either the local hold time value or the
	// peer's hold time value as the hold time for the BGP connection
	// between the two peers. If set, this value must be between 20 and 60.
	// The default is 20.
	// +kubebuilder:validation:Optional
	keepaliveInterval?: null | float64 @go(KeepaliveInterval,*float64)
}

#RouterInitParameters: {
	// BGP information specific to this router.
	// Structure is documented below.
	bgp?: [...#BGPInitParameters] @go(BGP,[]BGPInitParameters)

	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// Indicates if a router is dedicated for use with encrypted VLAN
	// attachments (interconnectAttachments).
	encryptedInterconnectRouter?: null | bool @go(EncryptedInterconnectRouter,*bool)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#RouterObservation: {
	// BGP information specific to this router.
	// Structure is documented below.
	bgp?: [...#BGPObservation] @go(BGP,[]BGPObservation)

	// Creation timestamp in RFC3339 text format.
	creationTimestamp?: null | string @go(CreationTimestamp,*string)

	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// Indicates if a router is dedicated for use with encrypted VLAN
	// attachments (interconnectAttachments).
	encryptedInterconnectRouter?: null | bool @go(EncryptedInterconnectRouter,*bool)

	// an identifier for the resource with format projects/{{project}}/regions/{{region}}/routers/{{name}}
	id?: null | string @go(ID,*string)

	// A reference to the network to which this router belongs.
	network?: null | string @go(Network,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Region where the router resides.
	region?: null | string @go(Region,*string)

	// The URI of the created resource.
	selfLink?: null | string @go(SelfLink,*string)
}

#RouterParameters: {
	// BGP information specific to this router.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	bgp?: [...#BGPParameters] @go(BGP,[]BGPParameters)

	// An optional description of this resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Indicates if a router is dedicated for use with encrypted VLAN
	// attachments (interconnectAttachments).
	// +kubebuilder:validation:Optional
	encryptedInterconnectRouter?: null | bool @go(EncryptedInterconnectRouter,*bool)

	// A reference to the network to which this router belongs.
	// +crossplane:generate:reference:type=Network
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.SelfLinkExtractor()
	// +kubebuilder:validation:Optional
	network?: null | string @go(Network,*string)

	// Reference to a Network to populate network.
	// +kubebuilder:validation:Optional
	networkRef?: null | v1.#Reference @go(NetworkRef,*v1.Reference)

	// Selector for a Network to populate network.
	// +kubebuilder:validation:Optional
	networkSelector?: null | v1.#Selector @go(NetworkSelector,*v1.Selector)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Region where the router resides.
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// RouterSpec defines the desired state of Router
#RouterSpec: {
	v1.#ResourceSpec
	forProvider: #RouterParameters @go(ForProvider)

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
	initProvider?: #RouterInitParameters @go(InitProvider)
}

// RouterStatus defines the observed state of Router.
#RouterStatus: {
	v1.#ResourceStatus
	atProvider?: #RouterObservation @go(AtProvider)
}

// Router is the Schema for the Routers API. Represents a Router resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Router: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #RouterSpec        @go(Spec)
	status?:   #RouterStatus      @go(Status)
}

// RouterList contains a list of Routers
#RouterList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Router] @go(Items,[]Router)
}
