// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/storage/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ObjectACLInitParameters: {
	// The "canned" predefined ACL to apply. Must be set if role_entity is not.
	predefinedAcl?: null | string @go(PredefinedACL,*string)

	// List of role/entity pairs in the form ROLE:entity. See GCS Object ACL documentation for more details.
	// Must be set if predefined_acl is not.
	roleEntity?: [...null | string] @go(RoleEntity,[]*string)
}

#ObjectACLObservation: {
	// The name of the bucket the object is stored in.
	bucket?: null | string @go(Bucket,*string)
	id?:     null | string @go(ID,*string)

	// The name of the object to apply the acl to.
	object?: null | string @go(Object,*string)

	// The "canned" predefined ACL to apply. Must be set if role_entity is not.
	predefinedAcl?: null | string @go(PredefinedACL,*string)

	// List of role/entity pairs in the form ROLE:entity. See GCS Object ACL documentation for more details.
	// Must be set if predefined_acl is not.
	roleEntity?: [...null | string] @go(RoleEntity,[]*string)
}

#ObjectACLParameters: {
	// The name of the bucket the object is stored in.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/storage/v1beta1.Bucket
	// +kubebuilder:validation:Optional
	bucket?: null | string @go(Bucket,*string)

	// Reference to a Bucket in storage to populate bucket.
	// +kubebuilder:validation:Optional
	bucketRef?: null | v1.#Reference @go(BucketRef,*v1.Reference)

	// Selector for a Bucket in storage to populate bucket.
	// +kubebuilder:validation:Optional
	bucketSelector?: null | v1.#Selector @go(BucketSelector,*v1.Selector)

	// The name of the object to apply the acl to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/storage/v1beta1.BucketObject
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("output_name",true)
	// +kubebuilder:validation:Optional
	object?: null | string @go(Object,*string)

	// Reference to a BucketObject in storage to populate object.
	// +kubebuilder:validation:Optional
	objectRef?: null | v1.#Reference @go(ObjectRef,*v1.Reference)

	// Selector for a BucketObject in storage to populate object.
	// +kubebuilder:validation:Optional
	objectSelector?: null | v1.#Selector @go(ObjectSelector,*v1.Selector)

	// The "canned" predefined ACL to apply. Must be set if role_entity is not.
	// +kubebuilder:validation:Optional
	predefinedAcl?: null | string @go(PredefinedACL,*string)

	// List of role/entity pairs in the form ROLE:entity. See GCS Object ACL documentation for more details.
	// Must be set if predefined_acl is not.
	// +kubebuilder:validation:Optional
	roleEntity?: [...null | string] @go(RoleEntity,[]*string)
}

// ObjectACLSpec defines the desired state of ObjectACL
#ObjectACLSpec: {
	v1.#ResourceSpec
	forProvider: #ObjectACLParameters @go(ForProvider)

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
	initProvider?: #ObjectACLInitParameters @go(InitProvider)
}

// ObjectACLStatus defines the observed state of ObjectACL.
#ObjectACLStatus: {
	v1.#ResourceStatus
	atProvider?: #ObjectACLObservation @go(AtProvider)
}

// ObjectACL is the Schema for the ObjectACLs API. Creates a new object ACL in Google Cloud Storage.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ObjectACL: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #ObjectACLSpec     @go(Spec)
	status?:   #ObjectACLStatus   @go(Status)
}

// ObjectACLList contains a list of ObjectACLs
#ObjectACLList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ObjectACL] @go(Items,[]ObjectACL)
}
