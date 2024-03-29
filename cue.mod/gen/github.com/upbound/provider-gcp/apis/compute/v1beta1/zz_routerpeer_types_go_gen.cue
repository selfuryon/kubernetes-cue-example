// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#BfdInitParameters: {
	// The minimum interval, in milliseconds, between BFD control packets
	// received from the peer router. The actual value is negotiated
	// between the two routers and is equal to the greater of this value
	// and the transmit interval of the other router. If set, this value
	// must be between 1000 and 30000.
	minReceiveInterval?: null | float64 @go(MinReceiveInterval,*float64)

	// The minimum interval, in milliseconds, between BFD control packets
	// transmitted to the peer router. The actual value is negotiated
	// between the two routers and is equal to the greater of this value
	// and the corresponding receive interval of the other router. If set,
	// this value must be between 1000 and 30000.
	minTransmitInterval?: null | float64 @go(MinTransmitInterval,*float64)

	// The number of consecutive BFD packets that must be missed before
	// BFD declares that a peer is unavailable. If set, the value must
	// be a value between 5 and 16.
	multiplier?: null | float64 @go(Multiplier,*float64)

	// The BFD session initialization mode for this BGP peer.
	// If set to ACTIVE, the Cloud Router will initiate the BFD session
	// for this BGP peer. If set to PASSIVE, the Cloud Router will wait
	// for the peer router to initiate the BFD session for this BGP peer.
	// If set to DISABLED, BFD is disabled for this BGP peer.
	// Possible values are: ACTIVE, DISABLED, PASSIVE.
	sessionInitializationMode?: null | string @go(SessionInitializationMode,*string)
}

#BfdObservation: {
	// The minimum interval, in milliseconds, between BFD control packets
	// received from the peer router. The actual value is negotiated
	// between the two routers and is equal to the greater of this value
	// and the transmit interval of the other router. If set, this value
	// must be between 1000 and 30000.
	minReceiveInterval?: null | float64 @go(MinReceiveInterval,*float64)

	// The minimum interval, in milliseconds, between BFD control packets
	// transmitted to the peer router. The actual value is negotiated
	// between the two routers and is equal to the greater of this value
	// and the corresponding receive interval of the other router. If set,
	// this value must be between 1000 and 30000.
	minTransmitInterval?: null | float64 @go(MinTransmitInterval,*float64)

	// The number of consecutive BFD packets that must be missed before
	// BFD declares that a peer is unavailable. If set, the value must
	// be a value between 5 and 16.
	multiplier?: null | float64 @go(Multiplier,*float64)

	// The BFD session initialization mode for this BGP peer.
	// If set to ACTIVE, the Cloud Router will initiate the BFD session
	// for this BGP peer. If set to PASSIVE, the Cloud Router will wait
	// for the peer router to initiate the BFD session for this BGP peer.
	// If set to DISABLED, BFD is disabled for this BGP peer.
	// Possible values are: ACTIVE, DISABLED, PASSIVE.
	sessionInitializationMode?: null | string @go(SessionInitializationMode,*string)
}

#BfdParameters: {
	// The minimum interval, in milliseconds, between BFD control packets
	// received from the peer router. The actual value is negotiated
	// between the two routers and is equal to the greater of this value
	// and the transmit interval of the other router. If set, this value
	// must be between 1000 and 30000.
	// +kubebuilder:validation:Optional
	minReceiveInterval?: null | float64 @go(MinReceiveInterval,*float64)

	// The minimum interval, in milliseconds, between BFD control packets
	// transmitted to the peer router. The actual value is negotiated
	// between the two routers and is equal to the greater of this value
	// and the corresponding receive interval of the other router. If set,
	// this value must be between 1000 and 30000.
	// +kubebuilder:validation:Optional
	minTransmitInterval?: null | float64 @go(MinTransmitInterval,*float64)

	// The number of consecutive BFD packets that must be missed before
	// BFD declares that a peer is unavailable. If set, the value must
	// be a value between 5 and 16.
	// +kubebuilder:validation:Optional
	multiplier?: null | float64 @go(Multiplier,*float64)

	// The BFD session initialization mode for this BGP peer.
	// If set to ACTIVE, the Cloud Router will initiate the BFD session
	// for this BGP peer. If set to PASSIVE, the Cloud Router will wait
	// for the peer router to initiate the BFD session for this BGP peer.
	// If set to DISABLED, BFD is disabled for this BGP peer.
	// Possible values are: ACTIVE, DISABLED, PASSIVE.
	// +kubebuilder:validation:Optional
	sessionInitializationMode?: null | string @go(SessionInitializationMode,*string)
}

#RouterPeerAdvertisedIPRangesInitParameters: {
	// User-specified description for the IP range.
	description?: null | string @go(Description,*string)

	// The IP range to advertise. The value must be a
	// CIDR-formatted string.
	range?: null | string @go(Range,*string)
}

#RouterPeerAdvertisedIPRangesObservation: {
	// User-specified description for the IP range.
	description?: null | string @go(Description,*string)

	// The IP range to advertise. The value must be a
	// CIDR-formatted string.
	range?: null | string @go(Range,*string)
}

#RouterPeerAdvertisedIPRangesParameters: {
	// User-specified description for the IP range.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The IP range to advertise. The value must be a
	// CIDR-formatted string.
	// +kubebuilder:validation:Optional
	range?: null | string @go(Range,*string)
}

#RouterPeerInitParameters: {
	// User-specified flag to indicate which mode to use for advertisement.
	// Valid values of this enum field are: DEFAULT, CUSTOM
	// Default value is DEFAULT.
	// Possible values are: DEFAULT, CUSTOM.
	advertiseMode?: null | string @go(AdvertiseMode,*string)

	// User-specified list of prefix groups to advertise in custom
	// mode, which can take one of the following options:
	advertisedGroups?: [...null | string] @go(AdvertisedGroups,[]*string)

	// User-specified list of individual IP ranges to advertise in
	// custom mode. This field can only be populated if advertiseMode
	// is CUSTOM and is advertised to all peers of the router. These IP
	// ranges will be advertised in addition to any specified groups.
	// Leave this field blank to advertise no custom IP ranges.
	// Structure is documented below.
	advertisedIpRanges?: [...#RouterPeerAdvertisedIPRangesInitParameters] @go(AdvertisedIPRanges,[]RouterPeerAdvertisedIPRangesInitParameters)

	// The priority of routes advertised to this BGP peer.
	// Where there is more than one matching route of maximum
	// length, the routes with the lowest priority value win.
	advertisedRoutePriority?: null | float64 @go(AdvertisedRoutePriority,*float64)

	// BFD configuration for the BGP peering.
	// Structure is documented below.
	bfd?: [...#BfdInitParameters] @go(Bfd,[]BfdInitParameters)

	// The status of the BGP peer connection. If set to false, any active session
	// with the peer is terminated and all associated routing information is removed.
	// If set to true, the peer connection can be established with routing information.
	// The default is true.
	enable?: null | bool @go(Enable,*bool)

	// Enable IPv6 traffic over BGP Peer. If not specified, it is disabled by default.
	enableIpv6?: null | bool @go(EnableIPv6,*bool)

	// IP address of the interface inside Google Cloud Platform.
	// Only IPv4 is supported.
	ipAddress?: null | string @go(IPAddress,*string)

	// IPv6 address of the interface inside Google Cloud Platform.
	// The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64.
	// If you do not specify the next hop addresses, Google Cloud automatically
	// assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you.
	ipv6NexthopAddress?: null | string @go(IPv6NexthopAddress,*string)

	// Peer BGP Autonomous System Number (ASN).
	// Each BGP interface may use a different value.
	peerAsn?: null | float64 @go(PeerAsn,*float64)

	// IPv6 address of the BGP interface outside Google Cloud Platform.
	// The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64.
	// If you do not specify the next hop addresses, Google Cloud automatically
	// assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you.
	peerIpv6NexthopAddress?: null | string @go(PeerIPv6NexthopAddress,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#RouterPeerObservation: {
	// User-specified flag to indicate which mode to use for advertisement.
	// Valid values of this enum field are: DEFAULT, CUSTOM
	// Default value is DEFAULT.
	// Possible values are: DEFAULT, CUSTOM.
	advertiseMode?: null | string @go(AdvertiseMode,*string)

	// User-specified list of prefix groups to advertise in custom
	// mode, which can take one of the following options:
	advertisedGroups?: [...null | string] @go(AdvertisedGroups,[]*string)

	// User-specified list of individual IP ranges to advertise in
	// custom mode. This field can only be populated if advertiseMode
	// is CUSTOM and is advertised to all peers of the router. These IP
	// ranges will be advertised in addition to any specified groups.
	// Leave this field blank to advertise no custom IP ranges.
	// Structure is documented below.
	advertisedIpRanges?: [...#RouterPeerAdvertisedIPRangesObservation] @go(AdvertisedIPRanges,[]RouterPeerAdvertisedIPRangesObservation)

	// The priority of routes advertised to this BGP peer.
	// Where there is more than one matching route of maximum
	// length, the routes with the lowest priority value win.
	advertisedRoutePriority?: null | float64 @go(AdvertisedRoutePriority,*float64)

	// BFD configuration for the BGP peering.
	// Structure is documented below.
	bfd?: [...#BfdObservation] @go(Bfd,[]BfdObservation)

	// The status of the BGP peer connection. If set to false, any active session
	// with the peer is terminated and all associated routing information is removed.
	// If set to true, the peer connection can be established with routing information.
	// The default is true.
	enable?: null | bool @go(Enable,*bool)

	// Enable IPv6 traffic over BGP Peer. If not specified, it is disabled by default.
	enableIpv6?: null | bool @go(EnableIPv6,*bool)

	// an identifier for the resource with format projects/{{project}}/regions/{{region}}/routers/{{router}}/{{name}}
	id?: null | string @go(ID,*string)

	// IP address of the interface inside Google Cloud Platform.
	// Only IPv4 is supported.
	ipAddress?: null | string @go(IPAddress,*string)

	// IPv6 address of the interface inside Google Cloud Platform.
	// The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64.
	// If you do not specify the next hop addresses, Google Cloud automatically
	// assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you.
	ipv6NexthopAddress?: null | string @go(IPv6NexthopAddress,*string)

	// Name of the interface the BGP peer is associated with.
	interface?: null | string @go(Interface,*string)

	// The resource that configures and manages this BGP peer.
	managementType?: null | string @go(ManagementType,*string)

	// Peer BGP Autonomous System Number (ASN).
	// Each BGP interface may use a different value.
	peerAsn?: null | float64 @go(PeerAsn,*float64)

	// IP address of the BGP interface outside Google Cloud Platform.
	// Only IPv4 is supported. Required if ip_address is set.
	peerIpAddress?: null | string @go(PeerIPAddress,*string)

	// IPv6 address of the BGP interface outside Google Cloud Platform.
	// The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64.
	// If you do not specify the next hop addresses, Google Cloud automatically
	// assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you.
	peerIpv6NexthopAddress?: null | string @go(PeerIPv6NexthopAddress,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Region where the router and BgpPeer reside.
	// If it is not provided, the provider region is used.
	region?: null | string @go(Region,*string)

	// The name of the Cloud Router in which this BgpPeer will be configured.
	router?: null | string @go(Router,*string)

	// The URI of the VM instance that is used as third-party router appliances
	// such as Next Gen Firewalls, Virtual Routers, or Router Appliances.
	// The VM instance must be located in zones contained in the same region as
	// this Cloud Router. The VM instance is the peer side of the BGP session.
	routerApplianceInstance?: null | string @go(RouterApplianceInstance,*string)
}

#RouterPeerParameters: {
	// User-specified flag to indicate which mode to use for advertisement.
	// Valid values of this enum field are: DEFAULT, CUSTOM
	// Default value is DEFAULT.
	// Possible values are: DEFAULT, CUSTOM.
	// +kubebuilder:validation:Optional
	advertiseMode?: null | string @go(AdvertiseMode,*string)

	// User-specified list of prefix groups to advertise in custom
	// mode, which can take one of the following options:
	// +kubebuilder:validation:Optional
	advertisedGroups?: [...null | string] @go(AdvertisedGroups,[]*string)

	// User-specified list of individual IP ranges to advertise in
	// custom mode. This field can only be populated if advertiseMode
	// is CUSTOM and is advertised to all peers of the router. These IP
	// ranges will be advertised in addition to any specified groups.
	// Leave this field blank to advertise no custom IP ranges.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	advertisedIpRanges?: [...#RouterPeerAdvertisedIPRangesParameters] @go(AdvertisedIPRanges,[]RouterPeerAdvertisedIPRangesParameters)

	// The priority of routes advertised to this BGP peer.
	// Where there is more than one matching route of maximum
	// length, the routes with the lowest priority value win.
	// +kubebuilder:validation:Optional
	advertisedRoutePriority?: null | float64 @go(AdvertisedRoutePriority,*float64)

	// BFD configuration for the BGP peering.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	bfd?: [...#BfdParameters] @go(Bfd,[]BfdParameters)

	// The status of the BGP peer connection. If set to false, any active session
	// with the peer is terminated and all associated routing information is removed.
	// If set to true, the peer connection can be established with routing information.
	// The default is true.
	// +kubebuilder:validation:Optional
	enable?: null | bool @go(Enable,*bool)

	// Enable IPv6 traffic over BGP Peer. If not specified, it is disabled by default.
	// +kubebuilder:validation:Optional
	enableIpv6?: null | bool @go(EnableIPv6,*bool)

	// IP address of the interface inside Google Cloud Platform.
	// Only IPv4 is supported.
	// +kubebuilder:validation:Optional
	ipAddress?: null | string @go(IPAddress,*string)

	// IPv6 address of the interface inside Google Cloud Platform.
	// The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64.
	// If you do not specify the next hop addresses, Google Cloud automatically
	// assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you.
	// +kubebuilder:validation:Optional
	ipv6NexthopAddress?: null | string @go(IPv6NexthopAddress,*string)

	// Name of the interface the BGP peer is associated with.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.RouterInterface
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",false)
	// +kubebuilder:validation:Optional
	interface?: null | string @go(Interface,*string)

	// Reference to a RouterInterface in compute to populate interface.
	// +kubebuilder:validation:Optional
	interfaceRef?: null | v1.#Reference @go(InterfaceRef,*v1.Reference)

	// Selector for a RouterInterface in compute to populate interface.
	// +kubebuilder:validation:Optional
	interfaceSelector?: null | v1.#Selector @go(InterfaceSelector,*v1.Selector)

	// Peer BGP Autonomous System Number (ASN).
	// Each BGP interface may use a different value.
	// +kubebuilder:validation:Optional
	peerAsn?: null | float64 @go(PeerAsn,*float64)

	// IP address of the BGP interface outside Google Cloud Platform.
	// Only IPv4 is supported. Required if ip_address is set.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Address
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("address",false)
	// +kubebuilder:validation:Optional
	peerIpAddress?: null | string @go(PeerIPAddress,*string)

	// Reference to a Address in compute to populate peerIpAddress.
	// +kubebuilder:validation:Optional
	peerIpAddressRef?: null | v1.#Reference @go(PeerIPAddressRef,*v1.Reference)

	// Selector for a Address in compute to populate peerIpAddress.
	// +kubebuilder:validation:Optional
	peerIpAddressSelector?: null | v1.#Selector @go(PeerIPAddressSelector,*v1.Selector)

	// IPv6 address of the BGP interface outside Google Cloud Platform.
	// The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64.
	// If you do not specify the next hop addresses, Google Cloud automatically
	// assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you.
	// +kubebuilder:validation:Optional
	peerIpv6NexthopAddress?: null | string @go(PeerIPv6NexthopAddress,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Region where the router and BgpPeer reside.
	// If it is not provided, the provider region is used.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Router
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("region",false)
	// +kubebuilder:validation:Optional
	region?: null | string @go(Region,*string)

	// Reference to a Router in compute to populate region.
	// +kubebuilder:validation:Optional
	regionRef?: null | v1.#Reference @go(RegionRef,*v1.Reference)

	// Selector for a Router in compute to populate region.
	// +kubebuilder:validation:Optional
	regionSelector?: null | v1.#Selector @go(RegionSelector,*v1.Selector)

	// The name of the Cloud Router in which this BgpPeer will be configured.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Router
	// +kubebuilder:validation:Optional
	router?: null | string @go(Router,*string)

	// The URI of the VM instance that is used as third-party router appliances
	// such as Next Gen Firewalls, Virtual Routers, or Router Appliances.
	// The VM instance must be located in zones contained in the same region as
	// this Cloud Router. The VM instance is the peer side of the BGP session.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Instance
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("self_link",true)
	// +kubebuilder:validation:Optional
	routerApplianceInstance?: null | string @go(RouterApplianceInstance,*string)

	// Reference to a Instance in compute to populate routerApplianceInstance.
	// +kubebuilder:validation:Optional
	routerApplianceInstanceRef?: null | v1.#Reference @go(RouterApplianceInstanceRef,*v1.Reference)

	// Selector for a Instance in compute to populate routerApplianceInstance.
	// +kubebuilder:validation:Optional
	routerApplianceInstanceSelector?: null | v1.#Selector @go(RouterApplianceInstanceSelector,*v1.Selector)

	// Reference to a Router in compute to populate router.
	// +kubebuilder:validation:Optional
	routerRef?: null | v1.#Reference @go(RouterRef,*v1.Reference)

	// Selector for a Router in compute to populate router.
	// +kubebuilder:validation:Optional
	routerSelector?: null | v1.#Selector @go(RouterSelector,*v1.Selector)
}

// RouterPeerSpec defines the desired state of RouterPeer
#RouterPeerSpec: {
	v1.#ResourceSpec
	forProvider: #RouterPeerParameters @go(ForProvider)

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
	initProvider?: #RouterPeerInitParameters @go(InitProvider)
}

// RouterPeerStatus defines the observed state of RouterPeer.
#RouterPeerStatus: {
	v1.#ResourceStatus
	atProvider?: #RouterPeerObservation @go(AtProvider)
}

// RouterPeer is the Schema for the RouterPeers API. BGP information that must be configured into the routing stack to establish BGP peering.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#RouterPeer: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.peerAsn) || (has(self.initProvider) && has(self.initProvider.peerAsn))",message="spec.forProvider.peerAsn is a required parameter"
	spec:    #RouterPeerSpec   @go(Spec)
	status?: #RouterPeerStatus @go(Status)
}

// RouterPeerList contains a list of RouterPeers
#RouterPeerList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#RouterPeer] @go(Items,[]RouterPeer)
}
