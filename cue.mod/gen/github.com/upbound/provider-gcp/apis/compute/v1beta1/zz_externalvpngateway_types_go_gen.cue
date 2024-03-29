// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ExternalVPNGatewayInitParameters: {
	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// A list of interfaces on this external VPN gateway.
	// Structure is documented below.
	interface?: [...#InterfaceInitParameters] @go(Interface,[]InterfaceInitParameters)

	// Labels for the external VPN gateway resource.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Indicates the redundancy type of this external VPN gateway
	// Possible values are: FOUR_IPS_REDUNDANCY, SINGLE_IP_INTERNALLY_REDUNDANT, TWO_IPS_REDUNDANCY.
	redundancyType?: null | string @go(RedundancyType,*string)
}

#ExternalVPNGatewayObservation: {
	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// an identifier for the resource with format projects/{{project}}/global/externalVpnGateways/{{name}}
	id?: null | string @go(ID,*string)

	// A list of interfaces on this external VPN gateway.
	// Structure is documented below.
	interface?: [...#InterfaceObservation] @go(Interface,[]InterfaceObservation)

	// The fingerprint used for optimistic locking of this resource.  Used
	// internally during updates.
	labelFingerprint?: null | string @go(LabelFingerprint,*string)

	// Labels for the external VPN gateway resource.
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Indicates the redundancy type of this external VPN gateway
	// Possible values are: FOUR_IPS_REDUNDANCY, SINGLE_IP_INTERNALLY_REDUNDANT, TWO_IPS_REDUNDANCY.
	redundancyType?: null | string @go(RedundancyType,*string)

	// The URI of the created resource.
	selfLink?: null | string @go(SelfLink,*string)
}

#ExternalVPNGatewayParameters: {
	// An optional description of this resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// A list of interfaces on this external VPN gateway.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	interface?: [...#InterfaceParameters] @go(Interface,[]InterfaceParameters)

	// Labels for the external VPN gateway resource.
	// +kubebuilder:validation:Optional
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Indicates the redundancy type of this external VPN gateway
	// Possible values are: FOUR_IPS_REDUNDANCY, SINGLE_IP_INTERNALLY_REDUNDANT, TWO_IPS_REDUNDANCY.
	// +kubebuilder:validation:Optional
	redundancyType?: null | string @go(RedundancyType,*string)
}

#InterfaceInitParameters: {
	// The numeric ID for this interface. Allowed values are based on the redundancy type
	// of this external VPN gateway
	id?: null | float64 @go(ID,*float64)

	// IP address of the interface in the external VPN gateway.
	// Only IPv4 is supported. This IP address can be either from
	// your on-premise gateway or another Cloud provider's VPN gateway,
	// it cannot be an IP address from Google Compute Engine.
	ipAddress?: null | string @go(IPAddress,*string)
}

#InterfaceObservation: {
	// The numeric ID for this interface. Allowed values are based on the redundancy type
	// of this external VPN gateway
	id?: null | float64 @go(ID,*float64)

	// IP address of the interface in the external VPN gateway.
	// Only IPv4 is supported. This IP address can be either from
	// your on-premise gateway or another Cloud provider's VPN gateway,
	// it cannot be an IP address from Google Compute Engine.
	ipAddress?: null | string @go(IPAddress,*string)
}

#InterfaceParameters: {
	// The numeric ID for this interface. Allowed values are based on the redundancy type
	// of this external VPN gateway
	// +kubebuilder:validation:Optional
	id?: null | float64 @go(ID,*float64)

	// IP address of the interface in the external VPN gateway.
	// Only IPv4 is supported. This IP address can be either from
	// your on-premise gateway or another Cloud provider's VPN gateway,
	// it cannot be an IP address from Google Compute Engine.
	// +kubebuilder:validation:Optional
	ipAddress?: null | string @go(IPAddress,*string)
}

// ExternalVPNGatewaySpec defines the desired state of ExternalVPNGateway
#ExternalVPNGatewaySpec: {
	v1.#ResourceSpec
	forProvider: #ExternalVPNGatewayParameters @go(ForProvider)

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
	initProvider?: #ExternalVPNGatewayInitParameters @go(InitProvider)
}

// ExternalVPNGatewayStatus defines the observed state of ExternalVPNGateway.
#ExternalVPNGatewayStatus: {
	v1.#ResourceStatus
	atProvider?: #ExternalVPNGatewayObservation @go(AtProvider)
}

// ExternalVPNGateway is the Schema for the ExternalVPNGateways API. Represents a VPN gateway managed outside of GCP.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ExternalVPNGateway: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta        @go(ObjectMeta)
	spec:      #ExternalVPNGatewaySpec   @go(Spec)
	status?:   #ExternalVPNGatewayStatus @go(Status)
}

// ExternalVPNGatewayList contains a list of ExternalVPNGateways
#ExternalVPNGatewayList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ExternalVPNGateway] @go(Items,[]ExternalVPNGateway)
}
