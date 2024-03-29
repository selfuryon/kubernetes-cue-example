// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#FilterLabelsInitParameters: {
	// Name of the resource; provided by the client when the resource is created.
	// The name must be 1-63 characters long, and comply with
	// RFC1035.
	// Specifically, the name must be 1-63 characters long and match the regular
	// expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first
	// character must be a lowercase letter, and all following characters must
	// be a dash, lowercase letter, or digit, except the last character, which
	// cannot be a dash.
	// For Private Service Connect forwarding rules that forward traffic to Google
	// APIs, the forwarding rule name must be a 1-20 characters string with
	// lowercase letters and numbers and must start with a letter.
	name?: null | string @go(Name,*string)

	// The value that the label must match. The value has a maximum
	// length of 1024 characters.
	value?: null | string @go(Value,*string)
}

#FilterLabelsObservation: {
	// Name of the resource; provided by the client when the resource is created.
	// The name must be 1-63 characters long, and comply with
	// RFC1035.
	// Specifically, the name must be 1-63 characters long and match the regular
	// expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first
	// character must be a lowercase letter, and all following characters must
	// be a dash, lowercase letter, or digit, except the last character, which
	// cannot be a dash.
	// For Private Service Connect forwarding rules that forward traffic to Google
	// APIs, the forwarding rule name must be a 1-20 characters string with
	// lowercase letters and numbers and must start with a letter.
	name?: null | string @go(Name,*string)

	// The value that the label must match. The value has a maximum
	// length of 1024 characters.
	value?: null | string @go(Value,*string)
}

#FilterLabelsParameters: {
	// Name of the resource; provided by the client when the resource is created.
	// The name must be 1-63 characters long, and comply with
	// RFC1035.
	// Specifically, the name must be 1-63 characters long and match the regular
	// expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first
	// character must be a lowercase letter, and all following characters must
	// be a dash, lowercase letter, or digit, except the last character, which
	// cannot be a dash.
	// For Private Service Connect forwarding rules that forward traffic to Google
	// APIs, the forwarding rule name must be a 1-20 characters string with
	// lowercase letters and numbers and must start with a letter.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The value that the label must match. The value has a maximum
	// length of 1024 characters.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

#GlobalForwardingRuleInitParameters: {
	// An optional description of this resource. Provide this property when
	// you create the resource.
	description?: null | string @go(Description,*string)

	// The IP protocol to which this rule applies.
	// For protocol forwarding, valid
	// options are TCP, UDP, ESP,
	// AH, SCTP, ICMP and
	// L3_DEFAULT.
	// The valid IP protocols are different for different load balancing products
	// as described in Load balancing
	// features.
	// Possible values are: TCP, UDP, ESP, AH, SCTP, ICMP.
	ipProtocol?: null | string @go(IPProtocol,*string)

	// The IP Version that will be used by this global forwarding rule.
	// Possible values are: IPV4, IPV6.
	ipVersion?: null | string @go(IPVersion,*string)

	// Labels to apply to this forwarding rule.  A list of key->value pairs.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Specifies the forwarding rule type.
	// For more information about forwarding rules, refer to
	// Forwarding rule concepts.
	// Default value is EXTERNAL.
	// Possible values are: EXTERNAL, EXTERNAL_MANAGED, INTERNAL_SELF_MANAGED.
	loadBalancingScheme?: null | string @go(LoadBalancingScheme,*string)

	// Opaque filter criteria used by Loadbalancer to restrict routing
	// configuration to a limited set xDS compliant clients. In their xDS
	// requests to Loadbalancer, xDS clients present node metadata. If a
	// match takes place, the relevant routing configuration is made available
	// to those proxies.
	// For each metadataFilter in this list, if its filterMatchCriteria is set
	// to MATCH_ANY, at least one of the filterLabels must match the
	// corresponding label provided in the metadata. If its filterMatchCriteria
	// is set to MATCH_ALL, then all of its filterLabels must match with
	// corresponding labels in the provided metadata.
	// metadataFilters specified here can be overridden by those specified in
	// the UrlMap that this ForwardingRule references.
	// metadataFilters only applies to Loadbalancers that have their
	// loadBalancingScheme set to INTERNAL_SELF_MANAGED.
	// Structure is documented below.
	metadataFilters?: [...#MetadataFiltersInitParameters] @go(MetadataFilters,[]MetadataFiltersInitParameters)

	// This is used in PSC consumer ForwardingRule to control whether it should try to auto-generate a DNS zone or not. Non-PSC forwarding rules do not use this field.
	noAutomateDnsZone?: null | bool @go(NoAutomateDNSZone,*bool)

	// This field can only be used:
	portRange?: null | string @go(PortRange,*string)

	// If not empty, this Forwarding Rule will only forward the traffic when the source IP address matches one of the IP addresses or CIDR ranges set here. Note that a Forwarding Rule can only have up to 64 source IP ranges, and this field can only be used with a regional Forwarding Rule whose scheme is EXTERNAL. Each sourceIpRange entry should be either an IP address (for example, 1.2.3.4) or a CIDR range (for example, 1.2.3.0/24).
	sourceIpRanges?: [...null | string] @go(SourceIPRanges,[]*string)
}

#GlobalForwardingRuleObservation: {
	// [Output Only] The URL for the corresponding base Forwarding Rule. By base Forwarding Rule, we mean the Forwarding Rule that has the same IP address, protocol, and port settings with the current Forwarding Rule, but without sourceIPRanges specified. Always empty if the current Forwarding Rule does not have sourceIPRanges specified.
	baseForwardingRule?: null | string @go(BaseForwardingRule,*string)

	// An optional description of this resource. Provide this property when
	// you create the resource.
	description?: null | string @go(Description,*string)

	// an identifier for the resource with format projects/{{project}}/global/forwardingRules/{{name}}
	id?: null | string @go(ID,*string)

	// IP address for which this forwarding rule accepts traffic. When a client
	// sends traffic to this IP address, the forwarding rule directs the traffic
	// to the referenced target.
	// While creating a forwarding rule, specifying an IPAddress is
	// required under the following circumstances:
	ipAddress?: null | string @go(IPAddress,*string)

	// The IP protocol to which this rule applies.
	// For protocol forwarding, valid
	// options are TCP, UDP, ESP,
	// AH, SCTP, ICMP and
	// L3_DEFAULT.
	// The valid IP protocols are different for different load balancing products
	// as described in Load balancing
	// features.
	// Possible values are: TCP, UDP, ESP, AH, SCTP, ICMP.
	ipProtocol?: null | string @go(IPProtocol,*string)

	// The IP Version that will be used by this global forwarding rule.
	// Possible values are: IPV4, IPV6.
	ipVersion?: null | string @go(IPVersion,*string)

	// The fingerprint used for optimistic locking of this resource.  Used
	// internally during updates.
	labelFingerprint?: null | string @go(LabelFingerprint,*string)

	// Labels to apply to this forwarding rule.  A list of key->value pairs.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Specifies the forwarding rule type.
	// For more information about forwarding rules, refer to
	// Forwarding rule concepts.
	// Default value is EXTERNAL.
	// Possible values are: EXTERNAL, EXTERNAL_MANAGED, INTERNAL_SELF_MANAGED.
	loadBalancingScheme?: null | string @go(LoadBalancingScheme,*string)

	// Opaque filter criteria used by Loadbalancer to restrict routing
	// configuration to a limited set xDS compliant clients. In their xDS
	// requests to Loadbalancer, xDS clients present node metadata. If a
	// match takes place, the relevant routing configuration is made available
	// to those proxies.
	// For each metadataFilter in this list, if its filterMatchCriteria is set
	// to MATCH_ANY, at least one of the filterLabels must match the
	// corresponding label provided in the metadata. If its filterMatchCriteria
	// is set to MATCH_ALL, then all of its filterLabels must match with
	// corresponding labels in the provided metadata.
	// metadataFilters specified here can be overridden by those specified in
	// the UrlMap that this ForwardingRule references.
	// metadataFilters only applies to Loadbalancers that have their
	// loadBalancingScheme set to INTERNAL_SELF_MANAGED.
	// Structure is documented below.
	metadataFilters?: [...#MetadataFiltersObservation] @go(MetadataFilters,[]MetadataFiltersObservation)

	// This field is not used for external load balancing.
	// For Internal TCP/UDP Load Balancing, this field identifies the network that
	// the load balanced IP should belong to for this Forwarding Rule.
	// If the subnetwork is specified, the network of the subnetwork will be used.
	// If neither subnetwork nor this field is specified, the default network will
	// be used.
	// For Private Service Connect forwarding rules that forward traffic to Google
	// APIs, a network must be provided.
	network?: null | string @go(Network,*string)

	// This is used in PSC consumer ForwardingRule to control whether it should try to auto-generate a DNS zone or not. Non-PSC forwarding rules do not use this field.
	noAutomateDnsZone?: null | bool @go(NoAutomateDNSZone,*bool)

	// This field can only be used:
	portRange?: null | string @go(PortRange,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The PSC connection id of the PSC Forwarding Rule.
	pscConnectionId?: null | string @go(PscConnectionID,*string)

	// The PSC connection status of the PSC Forwarding Rule. Possible values: STATUS_UNSPECIFIED, PENDING, ACCEPTED, REJECTED, CLOSED
	pscConnectionStatus?: null | string @go(PscConnectionStatus,*string)

	// The URI of the created resource.
	selfLink?: null | string @go(SelfLink,*string)

	// If not empty, this Forwarding Rule will only forward the traffic when the source IP address matches one of the IP addresses or CIDR ranges set here. Note that a Forwarding Rule can only have up to 64 source IP ranges, and this field can only be used with a regional Forwarding Rule whose scheme is EXTERNAL. Each sourceIpRange entry should be either an IP address (for example, 1.2.3.4) or a CIDR range (for example, 1.2.3.0/24).
	sourceIpRanges?: [...null | string] @go(SourceIPRanges,[]*string)

	// The URL of the target resource to receive the matched traffic.  For
	// regional forwarding rules, this target must be in the same region as the
	// forwarding rule. For global forwarding rules, this target must be a global
	// load balancing resource.
	// The forwarded traffic must be of a type appropriate to the target object.
	target?: null | string @go(Target,*string)
}

#GlobalForwardingRuleParameters: {
	// An optional description of this resource. Provide this property when
	// you create the resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// IP address for which this forwarding rule accepts traffic. When a client
	// sends traffic to this IP address, the forwarding rule directs the traffic
	// to the referenced target.
	// While creating a forwarding rule, specifying an IPAddress is
	// required under the following circumstances:
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.GlobalAddress
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	ipAddress?: null | string @go(IPAddress,*string)

	// Reference to a GlobalAddress in compute to populate ipAddress.
	// +kubebuilder:validation:Optional
	ipAddressRef?: null | v1.#Reference @go(IPAddressRef,*v1.Reference)

	// Selector for a GlobalAddress in compute to populate ipAddress.
	// +kubebuilder:validation:Optional
	ipAddressSelector?: null | v1.#Selector @go(IPAddressSelector,*v1.Selector)

	// The IP protocol to which this rule applies.
	// For protocol forwarding, valid
	// options are TCP, UDP, ESP,
	// AH, SCTP, ICMP and
	// L3_DEFAULT.
	// The valid IP protocols are different for different load balancing products
	// as described in Load balancing
	// features.
	// Possible values are: TCP, UDP, ESP, AH, SCTP, ICMP.
	// +kubebuilder:validation:Optional
	ipProtocol?: null | string @go(IPProtocol,*string)

	// The IP Version that will be used by this global forwarding rule.
	// Possible values are: IPV4, IPV6.
	// +kubebuilder:validation:Optional
	ipVersion?: null | string @go(IPVersion,*string)

	// Labels to apply to this forwarding rule.  A list of key->value pairs.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// Specifies the forwarding rule type.
	// For more information about forwarding rules, refer to
	// Forwarding rule concepts.
	// Default value is EXTERNAL.
	// Possible values are: EXTERNAL, EXTERNAL_MANAGED, INTERNAL_SELF_MANAGED.
	// +kubebuilder:validation:Optional
	loadBalancingScheme?: null | string @go(LoadBalancingScheme,*string)

	// Opaque filter criteria used by Loadbalancer to restrict routing
	// configuration to a limited set xDS compliant clients. In their xDS
	// requests to Loadbalancer, xDS clients present node metadata. If a
	// match takes place, the relevant routing configuration is made available
	// to those proxies.
	// For each metadataFilter in this list, if its filterMatchCriteria is set
	// to MATCH_ANY, at least one of the filterLabels must match the
	// corresponding label provided in the metadata. If its filterMatchCriteria
	// is set to MATCH_ALL, then all of its filterLabels must match with
	// corresponding labels in the provided metadata.
	// metadataFilters specified here can be overridden by those specified in
	// the UrlMap that this ForwardingRule references.
	// metadataFilters only applies to Loadbalancers that have their
	// loadBalancingScheme set to INTERNAL_SELF_MANAGED.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	metadataFilters?: [...#MetadataFiltersParameters] @go(MetadataFilters,[]MetadataFiltersParameters)

	// This field is not used for external load balancing.
	// For Internal TCP/UDP Load Balancing, this field identifies the network that
	// the load balanced IP should belong to for this Forwarding Rule.
	// If the subnetwork is specified, the network of the subnetwork will be used.
	// If neither subnetwork nor this field is specified, the default network will
	// be used.
	// For Private Service Connect forwarding rules that forward traffic to Google
	// APIs, a network must be provided.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Network
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	network?: null | string @go(Network,*string)

	// Reference to a Network in compute to populate network.
	// +kubebuilder:validation:Optional
	networkRef?: null | v1.#Reference @go(NetworkRef,*v1.Reference)

	// Selector for a Network in compute to populate network.
	// +kubebuilder:validation:Optional
	networkSelector?: null | v1.#Selector @go(NetworkSelector,*v1.Selector)

	// This is used in PSC consumer ForwardingRule to control whether it should try to auto-generate a DNS zone or not. Non-PSC forwarding rules do not use this field.
	// +kubebuilder:validation:Optional
	noAutomateDnsZone?: null | bool @go(NoAutomateDNSZone,*bool)

	// This field can only be used:
	// +kubebuilder:validation:Optional
	portRange?: null | string @go(PortRange,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.Network
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("project",false)
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Reference to a Network in compute to populate project.
	// +kubebuilder:validation:Optional
	projectRef?: null | v1.#Reference @go(ProjectRef,*v1.Reference)

	// Selector for a Network in compute to populate project.
	// +kubebuilder:validation:Optional
	projectSelector?: null | v1.#Selector @go(ProjectSelector,*v1.Selector)

	// If not empty, this Forwarding Rule will only forward the traffic when the source IP address matches one of the IP addresses or CIDR ranges set here. Note that a Forwarding Rule can only have up to 64 source IP ranges, and this field can only be used with a regional Forwarding Rule whose scheme is EXTERNAL. Each sourceIpRange entry should be either an IP address (for example, 1.2.3.4) or a CIDR range (for example, 1.2.3.0/24).
	// +kubebuilder:validation:Optional
	sourceIpRanges?: [...null | string] @go(SourceIPRanges,[]*string)

	// The URL of the target resource to receive the matched traffic.  For
	// regional forwarding rules, this target must be in the same region as the
	// forwarding rule. For global forwarding rules, this target must be a global
	// load balancing resource.
	// The forwarded traffic must be of a type appropriate to the target object.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.TargetSSLProxy
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	target?: null | string @go(Target,*string)

	// Reference to a TargetSSLProxy in compute to populate target.
	// +kubebuilder:validation:Optional
	targetRef?: null | v1.#Reference @go(TargetRef,*v1.Reference)

	// Selector for a TargetSSLProxy in compute to populate target.
	// +kubebuilder:validation:Optional
	targetSelector?: null | v1.#Selector @go(TargetSelector,*v1.Selector)
}

#MetadataFiltersInitParameters: {
	// The list of label value pairs that must match labels in the
	// provided metadata based on filterMatchCriteria
	// This list must not be empty and can have at the most 64 entries.
	// Structure is documented below.
	filterLabels?: [...#FilterLabelsInitParameters] @go(FilterLabels,[]FilterLabelsInitParameters)

	// Specifies how individual filterLabel matches within the list of
	// filterLabels contribute towards the overall metadataFilter match.
	// MATCH_ANY - At least one of the filterLabels must have a matching
	// label in the provided metadata.
	// MATCH_ALL - All filterLabels must have matching labels in the
	// provided metadata.
	// Possible values are: MATCH_ANY, MATCH_ALL.
	filterMatchCriteria?: null | string @go(FilterMatchCriteria,*string)
}

#MetadataFiltersObservation: {
	// The list of label value pairs that must match labels in the
	// provided metadata based on filterMatchCriteria
	// This list must not be empty and can have at the most 64 entries.
	// Structure is documented below.
	filterLabels?: [...#FilterLabelsObservation] @go(FilterLabels,[]FilterLabelsObservation)

	// Specifies how individual filterLabel matches within the list of
	// filterLabels contribute towards the overall metadataFilter match.
	// MATCH_ANY - At least one of the filterLabels must have a matching
	// label in the provided metadata.
	// MATCH_ALL - All filterLabels must have matching labels in the
	// provided metadata.
	// Possible values are: MATCH_ANY, MATCH_ALL.
	filterMatchCriteria?: null | string @go(FilterMatchCriteria,*string)
}

#MetadataFiltersParameters: {
	// The list of label value pairs that must match labels in the
	// provided metadata based on filterMatchCriteria
	// This list must not be empty and can have at the most 64 entries.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	filterLabels: [...#FilterLabelsParameters] @go(FilterLabels,[]FilterLabelsParameters)

	// Specifies how individual filterLabel matches within the list of
	// filterLabels contribute towards the overall metadataFilter match.
	// MATCH_ANY - At least one of the filterLabels must have a matching
	// label in the provided metadata.
	// MATCH_ALL - All filterLabels must have matching labels in the
	// provided metadata.
	// Possible values are: MATCH_ANY, MATCH_ALL.
	// +kubebuilder:validation:Optional
	filterMatchCriteria?: null | string @go(FilterMatchCriteria,*string)
}

// GlobalForwardingRuleSpec defines the desired state of GlobalForwardingRule
#GlobalForwardingRuleSpec: {
	v1.#ResourceSpec
	forProvider: #GlobalForwardingRuleParameters @go(ForProvider)

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
	initProvider?: #GlobalForwardingRuleInitParameters @go(InitProvider)
}

// GlobalForwardingRuleStatus defines the observed state of GlobalForwardingRule.
#GlobalForwardingRuleStatus: {
	v1.#ResourceStatus
	atProvider?: #GlobalForwardingRuleObservation @go(AtProvider)
}

// GlobalForwardingRule is the Schema for the GlobalForwardingRules API. Represents a GlobalForwardingRule resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#GlobalForwardingRule: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta          @go(ObjectMeta)
	spec:      #GlobalForwardingRuleSpec   @go(Spec)
	status?:   #GlobalForwardingRuleStatus @go(Status)
}

// GlobalForwardingRuleList contains a list of GlobalForwardingRules
#GlobalForwardingRuleList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#GlobalForwardingRule] @go(Items,[]GlobalForwardingRule)
}
