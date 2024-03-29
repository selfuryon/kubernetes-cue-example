// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/iam/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#UserInitParameters: {
	// when destroying this user, destroy even if it
	// has non-provider-managed iam access keys, login profile or mfa devices. without force_destroy
	// a user with non-provider-managed access keys and login profile will fail to be destroyed.
	// delete user even if it has non-provider-managed iam access keys, login profile or mfa devices
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// Path in which to create the user.
	path?: null | string @go(Path,*string)

	// The ARN of the policy that is used to set the permissions boundary for the user.
	permissionsBoundary?: null | string @go(PermissionsBoundary,*string)

	// Key-value map of resource tags.
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#UserObservation: {
	// The ARN assigned by AWS for this user.
	arn?: null | string @go(Arn,*string)

	// when destroying this user, destroy even if it
	// has non-provider-managed iam access keys, login profile or mfa devices. without force_destroy
	// a user with non-provider-managed access keys and login profile will fail to be destroyed.
	// delete user even if it has non-provider-managed iam access keys, login profile or mfa devices
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// The user's name.
	id?: null | string @go(ID,*string)

	// Path in which to create the user.
	path?: null | string @go(Path,*string)

	// The ARN of the policy that is used to set the permissions boundary for the user.
	permissionsBoundary?: null | string @go(PermissionsBoundary,*string)

	// Key-value map of resource tags.
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	// +mapType=granular
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// The unique ID assigned by AWS.
	uniqueId?: null | string @go(UniqueID,*string)
}

#UserParameters: {
	// when destroying this user, destroy even if it
	// has non-provider-managed iam access keys, login profile or mfa devices. without force_destroy
	// a user with non-provider-managed access keys and login profile will fail to be destroyed.
	// delete user even if it has non-provider-managed iam access keys, login profile or mfa devices
	// +kubebuilder:validation:Optional
	forceDestroy?: null | bool @go(ForceDestroy,*bool)

	// Path in which to create the user.
	// +kubebuilder:validation:Optional
	path?: null | string @go(Path,*string)

	// The ARN of the policy that is used to set the permissions boundary for the user.
	// +kubebuilder:validation:Optional
	permissionsBoundary?: null | string @go(PermissionsBoundary,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// UserSpec defines the desired state of User
#UserSpec: {
	v1.#ResourceSpec
	forProvider: #UserParameters @go(ForProvider)

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
	initProvider?: #UserInitParameters @go(InitProvider)
}

// UserStatus defines the observed state of User.
#UserStatus: {
	v1.#ResourceStatus
	atProvider?: #UserObservation @go(AtProvider)
}

// User is the Schema for the Users API. Provides an IAM user.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#User: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #UserSpec          @go(Spec)
	status?:   #UserStatus        @go(Status)
}

// UserList contains a list of Users
#UserList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#User] @go(Items,[]User)
}
