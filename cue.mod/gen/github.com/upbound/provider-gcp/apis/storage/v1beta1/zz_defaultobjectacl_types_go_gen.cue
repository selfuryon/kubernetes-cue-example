// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/storage/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#DefaultObjectACLInitParameters: {
	// List of role/entity pairs in the form ROLE:entity.
	// See GCS Object ACL documentation for more details.
	// Omitting the field is the same as providing an empty list.
	roleEntity?: [...null | string] @go(RoleEntity,[]*string)
}

#DefaultObjectACLObservation: {
	// The name of the bucket it applies to.
	bucket?: null | string @go(Bucket,*string)
	id?:     null | string @go(ID,*string)

	// List of role/entity pairs in the form ROLE:entity.
	// See GCS Object ACL documentation for more details.
	// Omitting the field is the same as providing an empty list.
	roleEntity?: [...null | string] @go(RoleEntity,[]*string)
}

#DefaultObjectACLParameters: {
	// The name of the bucket it applies to.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/storage/v1beta1.Bucket
	// +kubebuilder:validation:Optional
	bucket?: null | string @go(Bucket,*string)

	// Reference to a Bucket in storage to populate bucket.
	// +kubebuilder:validation:Optional
	bucketRef?: null | v1.#Reference @go(BucketRef,*v1.Reference)

	// Selector for a Bucket in storage to populate bucket.
	// +kubebuilder:validation:Optional
	bucketSelector?: null | v1.#Selector @go(BucketSelector,*v1.Selector)

	// List of role/entity pairs in the form ROLE:entity.
	// See GCS Object ACL documentation for more details.
	// Omitting the field is the same as providing an empty list.
	// +kubebuilder:validation:Optional
	roleEntity?: [...null | string] @go(RoleEntity,[]*string)
}

// DefaultObjectACLSpec defines the desired state of DefaultObjectACL
#DefaultObjectACLSpec: {
	v1.#ResourceSpec
	forProvider: #DefaultObjectACLParameters @go(ForProvider)

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
	initProvider?: #DefaultObjectACLInitParameters @go(InitProvider)
}

// DefaultObjectACLStatus defines the observed state of DefaultObjectACL.
#DefaultObjectACLStatus: {
	v1.#ResourceStatus
	atProvider?: #DefaultObjectACLObservation @go(AtProvider)
}

// DefaultObjectACL is the Schema for the DefaultObjectACLs API. Authoritatively manages the default object ACLs for a Google Cloud Storage bucket
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#DefaultObjectACL: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta      @go(ObjectMeta)
	spec:      #DefaultObjectACLSpec   @go(Spec)
	status?:   #DefaultObjectACLStatus @go(Status)
}

// DefaultObjectACLList contains a list of DefaultObjectACLs
#DefaultObjectACLList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#DefaultObjectACL] @go(Items,[]DefaultObjectACL)
}
