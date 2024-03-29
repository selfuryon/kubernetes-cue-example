// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-vault/apis/aws/v1alpha1

package v1alpha1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#AuthBackendConfigIdentityInitParameters: {
	// Unique name of the auth backend to configure.
	backend?: null | string @go(Backend,*string)

	// How to generate the identity alias when using the ec2 auth method. Valid choices are
	// role_id, instance_id, and image_id. Defaults to role_id
	// Configures how to generate the identity alias when using the ec2 auth method.
	ec2Alias?: null | string @go(EC2Alias,*string)

	// The metadata to include on the token returned by the login endpoint. This metadata will be
	// added to both audit logs, and on the ec2_alias
	// The metadata to include on the token returned by the login endpoint.
	ec2Metadata?: [...null | string] @go(EC2Metadata,[]*string)

	// How to generate the identity alias when using the iam auth method. Valid choices are
	// role_id, unique_id, and full_arn. Defaults to role_id
	// How to generate the identity alias when using the iam auth method.
	iamAlias?: null | string @go(IAMAlias,*string)

	// The metadata to include on the token returned by the login endpoint. This metadata will be
	// added to both audit logs, and on the iam_alias
	// The metadata to include on the token returned by the login endpoint.
	iamMetadata?: [...null | string] @go(IAMMetadata,[]*string)
}

#AuthBackendConfigIdentityObservation: {
	// Unique name of the auth backend to configure.
	backend?: null | string @go(Backend,*string)

	// How to generate the identity alias when using the ec2 auth method. Valid choices are
	// role_id, instance_id, and image_id. Defaults to role_id
	// Configures how to generate the identity alias when using the ec2 auth method.
	ec2Alias?: null | string @go(EC2Alias,*string)

	// The metadata to include on the token returned by the login endpoint. This metadata will be
	// added to both audit logs, and on the ec2_alias
	// The metadata to include on the token returned by the login endpoint.
	ec2Metadata?: [...null | string] @go(EC2Metadata,[]*string)

	// How to generate the identity alias when using the iam auth method. Valid choices are
	// role_id, unique_id, and full_arn. Defaults to role_id
	// How to generate the identity alias when using the iam auth method.
	iamAlias?: null | string @go(IAMAlias,*string)

	// The metadata to include on the token returned by the login endpoint. This metadata will be
	// added to both audit logs, and on the iam_alias
	// The metadata to include on the token returned by the login endpoint.
	iamMetadata?: [...null | string] @go(IAMMetadata,[]*string)
	id?: null | string @go(ID,*string)
}

#AuthBackendConfigIdentityParameters: {
	// Unique name of the auth backend to configure.
	// +kubebuilder:validation:Optional
	backend?: null | string @go(Backend,*string)

	// How to generate the identity alias when using the ec2 auth method. Valid choices are
	// role_id, instance_id, and image_id. Defaults to role_id
	// Configures how to generate the identity alias when using the ec2 auth method.
	// +kubebuilder:validation:Optional
	ec2Alias?: null | string @go(EC2Alias,*string)

	// The metadata to include on the token returned by the login endpoint. This metadata will be
	// added to both audit logs, and on the ec2_alias
	// The metadata to include on the token returned by the login endpoint.
	// +kubebuilder:validation:Optional
	ec2Metadata?: [...null | string] @go(EC2Metadata,[]*string)

	// How to generate the identity alias when using the iam auth method. Valid choices are
	// role_id, unique_id, and full_arn. Defaults to role_id
	// How to generate the identity alias when using the iam auth method.
	// +kubebuilder:validation:Optional
	iamAlias?: null | string @go(IAMAlias,*string)

	// The metadata to include on the token returned by the login endpoint. This metadata will be
	// added to both audit logs, and on the iam_alias
	// The metadata to include on the token returned by the login endpoint.
	// +kubebuilder:validation:Optional
	iamMetadata?: [...null | string] @go(IAMMetadata,[]*string)
}

// AuthBackendConfigIdentitySpec defines the desired state of AuthBackendConfigIdentity
#AuthBackendConfigIdentitySpec: {
	v1.#ResourceSpec
	forProvider: #AuthBackendConfigIdentityParameters @go(ForProvider)

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
	initProvider?: #AuthBackendConfigIdentityInitParameters @go(InitProvider)
}

// AuthBackendConfigIdentityStatus defines the observed state of AuthBackendConfigIdentity.
#AuthBackendConfigIdentityStatus: {
	v1.#ResourceStatus
	atProvider?: #AuthBackendConfigIdentityObservation @go(AtProvider)
}

// AuthBackendConfigIdentity is the Schema for the AuthBackendConfigIdentitys API. Manages AWS auth backend identity configuration in Vault.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,vault}
#AuthBackendConfigIdentity: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta               @go(ObjectMeta)
	spec:      #AuthBackendConfigIdentitySpec   @go(Spec)
	status?:   #AuthBackendConfigIdentityStatus @go(Status)
}

// AuthBackendConfigIdentityList contains a list of AuthBackendConfigIdentitys
#AuthBackendConfigIdentityList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#AuthBackendConfigIdentity] @go(Items,[]AuthBackendConfigIdentity)
}
