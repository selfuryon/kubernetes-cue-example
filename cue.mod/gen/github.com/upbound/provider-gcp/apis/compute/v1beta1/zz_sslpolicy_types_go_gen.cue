// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#SSLPolicyInitParameters: {
	// Profile specifies the set of SSL features that can be used by the
	// load balancer when negotiating SSL with clients. This can be one of
	// COMPATIBLE, MODERN, RESTRICTED, or CUSTOM. If using CUSTOM,
	// the set of SSL features to enable must be specified in the
	// customFeatures field.
	// See the official documentation
	// for which ciphers are available to use. Note: this argument
	// must be present when using the CUSTOM profile. This argument
	// must not be present when using any other profile.
	customFeatures?: [...null | string] @go(CustomFeatures,[]*string)

	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// The minimum version of SSL protocol that can be used by the clients
	// to establish a connection with the load balancer.
	// Default value is TLS_1_0.
	// Possible values are: TLS_1_0, TLS_1_1, TLS_1_2.
	minTlsVersion?: null | string @go(MinTLSVersion,*string)

	// Profile specifies the set of SSL features that can be used by the
	// load balancer when negotiating SSL with clients. If using CUSTOM,
	// the set of SSL features to enable must be specified in the
	// customFeatures field.
	// See the official documentation
	// for information on what cipher suites each profile provides. If
	// CUSTOM is used, the custom_features attribute must be set.
	// Default value is COMPATIBLE.
	// Possible values are: COMPATIBLE, MODERN, RESTRICTED, CUSTOM.
	profile?: null | string @go(Profile,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#SSLPolicyObservation: {
	// Creation timestamp in RFC3339 text format.
	creationTimestamp?: null | string @go(CreationTimestamp,*string)

	// Profile specifies the set of SSL features that can be used by the
	// load balancer when negotiating SSL with clients. This can be one of
	// COMPATIBLE, MODERN, RESTRICTED, or CUSTOM. If using CUSTOM,
	// the set of SSL features to enable must be specified in the
	// customFeatures field.
	// See the official documentation
	// for which ciphers are available to use. Note: this argument
	// must be present when using the CUSTOM profile. This argument
	// must not be present when using any other profile.
	customFeatures?: [...null | string] @go(CustomFeatures,[]*string)

	// An optional description of this resource.
	description?: null | string @go(Description,*string)

	// The list of features enabled in the SSL policy.
	enabledFeatures?: [...null | string] @go(EnabledFeatures,[]*string)

	// Fingerprint of this resource. A hash of the contents stored in this
	// object. This field is used in optimistic locking.
	fingerprint?: null | string @go(Fingerprint,*string)

	// an identifier for the resource with format projects/{{project}}/global/sslPolicies/{{name}}
	id?: null | string @go(ID,*string)

	// The minimum version of SSL protocol that can be used by the clients
	// to establish a connection with the load balancer.
	// Default value is TLS_1_0.
	// Possible values are: TLS_1_0, TLS_1_1, TLS_1_2.
	minTlsVersion?: null | string @go(MinTLSVersion,*string)

	// Profile specifies the set of SSL features that can be used by the
	// load balancer when negotiating SSL with clients. If using CUSTOM,
	// the set of SSL features to enable must be specified in the
	// customFeatures field.
	// See the official documentation
	// for information on what cipher suites each profile provides. If
	// CUSTOM is used, the custom_features attribute must be set.
	// Default value is COMPATIBLE.
	// Possible values are: COMPATIBLE, MODERN, RESTRICTED, CUSTOM.
	profile?: null | string @go(Profile,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The URI of the created resource.
	selfLink?: null | string @go(SelfLink,*string)
}

#SSLPolicyParameters: {
	// Profile specifies the set of SSL features that can be used by the
	// load balancer when negotiating SSL with clients. This can be one of
	// COMPATIBLE, MODERN, RESTRICTED, or CUSTOM. If using CUSTOM,
	// the set of SSL features to enable must be specified in the
	// customFeatures field.
	// See the official documentation
	// for which ciphers are available to use. Note: this argument
	// must be present when using the CUSTOM profile. This argument
	// must not be present when using any other profile.
	// +kubebuilder:validation:Optional
	customFeatures?: [...null | string] @go(CustomFeatures,[]*string)

	// An optional description of this resource.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// The minimum version of SSL protocol that can be used by the clients
	// to establish a connection with the load balancer.
	// Default value is TLS_1_0.
	// Possible values are: TLS_1_0, TLS_1_1, TLS_1_2.
	// +kubebuilder:validation:Optional
	minTlsVersion?: null | string @go(MinTLSVersion,*string)

	// Profile specifies the set of SSL features that can be used by the
	// load balancer when negotiating SSL with clients. If using CUSTOM,
	// the set of SSL features to enable must be specified in the
	// customFeatures field.
	// See the official documentation
	// for information on what cipher suites each profile provides. If
	// CUSTOM is used, the custom_features attribute must be set.
	// Default value is COMPATIBLE.
	// Possible values are: COMPATIBLE, MODERN, RESTRICTED, CUSTOM.
	// +kubebuilder:validation:Optional
	profile?: null | string @go(Profile,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)
}

// SSLPolicySpec defines the desired state of SSLPolicy
#SSLPolicySpec: {
	v1.#ResourceSpec
	forProvider: #SSLPolicyParameters @go(ForProvider)

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
	initProvider?: #SSLPolicyInitParameters @go(InitProvider)
}

// SSLPolicyStatus defines the observed state of SSLPolicy.
#SSLPolicyStatus: {
	v1.#ResourceStatus
	atProvider?: #SSLPolicyObservation @go(AtProvider)
}

// SSLPolicy is the Schema for the SSLPolicys API. Represents a SSL policy.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#SSLPolicy: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #SSLPolicySpec     @go(Spec)
	status?:   #SSLPolicyStatus   @go(Status)
}

// SSLPolicyList contains a list of SSLPolicys
#SSLPolicyList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#SSLPolicy] @go(Items,[]SSLPolicy)
}
