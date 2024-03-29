// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/iam/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#UserPolicyAttachmentInitParameters: {
	// The ARN of the policy you want to apply
	// +crossplane:generate:reference:type=Policy
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	policyArn?: null | string @go(PolicyArn,*string)

	// Reference to a Policy to populate policyArn.
	// +kubebuilder:validation:Optional
	policyArnRef?: null | v1.#Reference @go(PolicyArnRef,*v1.Reference)

	// Selector for a Policy to populate policyArn.
	// +kubebuilder:validation:Optional
	policyArnSelector?: null | v1.#Selector @go(PolicyArnSelector,*v1.Selector)

	// The user the policy should be applied to
	// +crossplane:generate:reference:type=User
	user?: null | string @go(User,*string)

	// Reference to a User to populate user.
	// +kubebuilder:validation:Optional
	userRef?: null | v1.#Reference @go(UserRef,*v1.Reference)

	// Selector for a User to populate user.
	// +kubebuilder:validation:Optional
	userSelector?: null | v1.#Selector @go(UserSelector,*v1.Selector)
}

#UserPolicyAttachmentObservation: {
	id?: null | string @go(ID,*string)

	// The ARN of the policy you want to apply
	policyArn?: null | string @go(PolicyArn,*string)

	// The user the policy should be applied to
	user?: null | string @go(User,*string)
}

#UserPolicyAttachmentParameters: {
	// The ARN of the policy you want to apply
	// +crossplane:generate:reference:type=Policy
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	// +kubebuilder:validation:Optional
	policyArn?: null | string @go(PolicyArn,*string)

	// Reference to a Policy to populate policyArn.
	// +kubebuilder:validation:Optional
	policyArnRef?: null | v1.#Reference @go(PolicyArnRef,*v1.Reference)

	// Selector for a Policy to populate policyArn.
	// +kubebuilder:validation:Optional
	policyArnSelector?: null | v1.#Selector @go(PolicyArnSelector,*v1.Selector)

	// The user the policy should be applied to
	// +crossplane:generate:reference:type=User
	// +kubebuilder:validation:Optional
	user?: null | string @go(User,*string)

	// Reference to a User to populate user.
	// +kubebuilder:validation:Optional
	userRef?: null | v1.#Reference @go(UserRef,*v1.Reference)

	// Selector for a User to populate user.
	// +kubebuilder:validation:Optional
	userSelector?: null | v1.#Selector @go(UserSelector,*v1.Selector)
}

// UserPolicyAttachmentSpec defines the desired state of UserPolicyAttachment
#UserPolicyAttachmentSpec: {
	v1.#ResourceSpec
	forProvider: #UserPolicyAttachmentParameters @go(ForProvider)

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
	initProvider?: #UserPolicyAttachmentInitParameters @go(InitProvider)
}

// UserPolicyAttachmentStatus defines the observed state of UserPolicyAttachment.
#UserPolicyAttachmentStatus: {
	v1.#ResourceStatus
	atProvider?: #UserPolicyAttachmentObservation @go(AtProvider)
}

// UserPolicyAttachment is the Schema for the UserPolicyAttachments API. Attaches a Managed IAM Policy to an IAM user
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#UserPolicyAttachment: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta          @go(ObjectMeta)
	spec:      #UserPolicyAttachmentSpec   @go(Spec)
	status?:   #UserPolicyAttachmentStatus @go(Status)
}

// UserPolicyAttachmentList contains a list of UserPolicyAttachments
#UserPolicyAttachmentList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#UserPolicyAttachment] @go(Items,[]UserPolicyAttachment)
}
