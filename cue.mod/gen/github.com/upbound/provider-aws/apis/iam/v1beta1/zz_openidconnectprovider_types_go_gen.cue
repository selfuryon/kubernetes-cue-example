// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/iam/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#OpenIDConnectProviderInitParameters: {
	// A list of client IDs (also known as audiences). When a mobile or web app registers with an OpenID Connect provider, they establish a value that identifies the application. (This is the value that's sent as the client_id parameter on OAuth requests.)
	// +listType=set
	clientIdList?: [...null | string] @go(ClientIDList,[]*string)

	// Key-value map of resource tags.
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s).
	thumbprintList?: [...null | string] @go(ThumbprintList,[]*string)

	// The URL of the identity provider. Corresponds to the iss claim.
	url?: null | string @go(URL,*string)
}

#OpenIDConnectProviderObservation: {
	// The ARN assigned by AWS for this provider.
	arn?: null | string @go(Arn,*string)

	// A list of client IDs (also known as audiences). When a mobile or web app registers with an OpenID Connect provider, they establish a value that identifies the application. (This is the value that's sent as the client_id parameter on OAuth requests.)
	// +listType=set
	clientIdList?: [...null | string] @go(ClientIDList,[]*string)
	id?: null | string @go(ID,*string)

	// Key-value map of resource tags.
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	// +mapType=granular
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s).
	thumbprintList?: [...null | string] @go(ThumbprintList,[]*string)

	// The URL of the identity provider. Corresponds to the iss claim.
	url?: null | string @go(URL,*string)
}

#OpenIDConnectProviderParameters: {
	// A list of client IDs (also known as audiences). When a mobile or web app registers with an OpenID Connect provider, they establish a value that identifies the application. (This is the value that's sent as the client_id parameter on OAuth requests.)
	// +kubebuilder:validation:Optional
	// +listType=set
	clientIdList?: [...null | string] @go(ClientIDList,[]*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s).
	// +kubebuilder:validation:Optional
	thumbprintList?: [...null | string] @go(ThumbprintList,[]*string)

	// The URL of the identity provider. Corresponds to the iss claim.
	// +kubebuilder:validation:Optional
	url?: null | string @go(URL,*string)
}

// OpenIDConnectProviderSpec defines the desired state of OpenIDConnectProvider
#OpenIDConnectProviderSpec: {
	v1.#ResourceSpec
	forProvider: #OpenIDConnectProviderParameters @go(ForProvider)

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
	initProvider?: #OpenIDConnectProviderInitParameters @go(InitProvider)
}

// OpenIDConnectProviderStatus defines the observed state of OpenIDConnectProvider.
#OpenIDConnectProviderStatus: {
	v1.#ResourceStatus
	atProvider?: #OpenIDConnectProviderObservation @go(AtProvider)
}

// OpenIDConnectProvider is the Schema for the OpenIDConnectProviders API. Provides an IAM OpenID Connect provider.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#OpenIDConnectProvider: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.clientIdList) || (has(self.initProvider) && has(self.initProvider.clientIdList))",message="spec.forProvider.clientIdList is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.thumbprintList) || (has(self.initProvider) && has(self.initProvider.thumbprintList))",message="spec.forProvider.thumbprintList is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.url) || (has(self.initProvider) && has(self.initProvider.url))",message="spec.forProvider.url is a required parameter"
	spec:    #OpenIDConnectProviderSpec   @go(Spec)
	status?: #OpenIDConnectProviderStatus @go(Status)
}

// OpenIDConnectProviderList contains a list of OpenIDConnectProviders
#OpenIDConnectProviderList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#OpenIDConnectProvider] @go(Items,[]OpenIDConnectProvider)
}
