// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/iam/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#InlinePolicyInitParameters: {
	// Friendly name of the role. See IAM Identifiers for more information.
	name?: null | string @go(Name,*string)

	// Policy document as a JSON formatted string.
	policy?: null | string @go(Policy,*string)
}

#InlinePolicyObservation: {
	// Friendly name of the role. See IAM Identifiers for more information.
	name?: null | string @go(Name,*string)

	// Policy document as a JSON formatted string.
	policy?: null | string @go(Policy,*string)
}

#InlinePolicyParameters: {
	// Friendly name of the role. See IAM Identifiers for more information.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Policy document as a JSON formatted string.
	// +kubebuilder:validation:Optional
	policy?: null | string @go(Policy,*string)
}

#RoleInitParameters: {
	// Policy that grants an entity permission to assume the role.
	assumeRolePolicy?: null | string @go(AssumeRolePolicy,*string)

	// Description of the role.
	description?: null | string @go(Description,*string)

	// Whether to force detaching any policies the role has before destroying it. Defaults to false.
	forceDetachPolicies?: null | bool @go(ForceDetachPolicies,*bool)

	// Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Crossplane will not manage any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Crossplane to remove all inline policies added out of band on apply.
	inlinePolicy?: [...#InlinePolicyInitParameters] @go(InlinePolicy,[]InlinePolicyInitParameters)

	// Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Crossplane will ignore policy attachments to this resource. When configured, Crossplane will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Crossplane to remove all managed policy attachments.
	// +listType=set
	managedPolicyArns?: [...null | string] @go(ManagedPolicyArns,[]*string)

	// Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.
	maxSessionDuration?: null | float64 @go(MaxSessionDuration,*float64)

	// Path to the role. See IAM Identifiers for more information.
	path?: null | string @go(Path,*string)

	// ARN of the policy that is used to set the permissions boundary for the role.
	permissionsBoundary?: null | string @go(PermissionsBoundary,*string)

	// Key-value map of resource tags.
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#RoleObservation: {
	// Amazon Resource Name (ARN) specifying the role.
	arn?: null | string @go(Arn,*string)

	// Policy that grants an entity permission to assume the role.
	assumeRolePolicy?: null | string @go(AssumeRolePolicy,*string)

	// Creation date of the IAM role.
	createDate?: null | string @go(CreateDate,*string)

	// Description of the role.
	description?: null | string @go(Description,*string)

	// Whether to force detaching any policies the role has before destroying it. Defaults to false.
	forceDetachPolicies?: null | bool @go(ForceDetachPolicies,*bool)

	// Name of the role.
	id?: null | string @go(ID,*string)

	// Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Crossplane will not manage any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Crossplane to remove all inline policies added out of band on apply.
	inlinePolicy?: [...#InlinePolicyObservation] @go(InlinePolicy,[]InlinePolicyObservation)

	// Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Crossplane will ignore policy attachments to this resource. When configured, Crossplane will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Crossplane to remove all managed policy attachments.
	// +listType=set
	managedPolicyArns?: [...null | string] @go(ManagedPolicyArns,[]*string)

	// Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.
	maxSessionDuration?: null | float64 @go(MaxSessionDuration,*float64)

	// Path to the role. See IAM Identifiers for more information.
	path?: null | string @go(Path,*string)

	// ARN of the policy that is used to set the permissions boundary for the role.
	permissionsBoundary?: null | string @go(PermissionsBoundary,*string)

	// Key-value map of resource tags.
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	// +mapType=granular
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// Stable and unique string identifying the role.
	uniqueId?: null | string @go(UniqueID,*string)
}

#RoleParameters: {
	// Policy that grants an entity permission to assume the role.
	// +kubebuilder:validation:Optional
	assumeRolePolicy?: null | string @go(AssumeRolePolicy,*string)

	// Description of the role.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Whether to force detaching any policies the role has before destroying it. Defaults to false.
	// +kubebuilder:validation:Optional
	forceDetachPolicies?: null | bool @go(ForceDetachPolicies,*bool)

	// Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Crossplane will not manage any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Crossplane to remove all inline policies added out of band on apply.
	// +kubebuilder:validation:Optional
	inlinePolicy?: [...#InlinePolicyParameters] @go(InlinePolicy,[]InlinePolicyParameters)

	// Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Crossplane will ignore policy attachments to this resource. When configured, Crossplane will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Crossplane to remove all managed policy attachments.
	// +kubebuilder:validation:Optional
	// +listType=set
	managedPolicyArns?: [...null | string] @go(ManagedPolicyArns,[]*string)

	// Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.
	// +kubebuilder:validation:Optional
	maxSessionDuration?: null | float64 @go(MaxSessionDuration,*float64)

	// Path to the role. See IAM Identifiers for more information.
	// +kubebuilder:validation:Optional
	path?: null | string @go(Path,*string)

	// ARN of the policy that is used to set the permissions boundary for the role.
	// +kubebuilder:validation:Optional
	permissionsBoundary?: null | string @go(PermissionsBoundary,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// RoleSpec defines the desired state of Role
#RoleSpec: {
	v1.#ResourceSpec
	forProvider: #RoleParameters @go(ForProvider)

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
	initProvider?: #RoleInitParameters @go(InitProvider)
}

// RoleStatus defines the observed state of Role.
#RoleStatus: {
	v1.#ResourceStatus
	atProvider?: #RoleObservation @go(AtProvider)
}

// Role is the Schema for the Roles API. Provides an IAM role.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Role: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.assumeRolePolicy) || (has(self.initProvider) && has(self.initProvider.assumeRolePolicy))",message="spec.forProvider.assumeRolePolicy is a required parameter"
	spec:    #RoleSpec   @go(Spec)
	status?: #RoleStatus @go(Status)
}

// RoleList contains a list of Roles
#RoleList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Role] @go(Items,[]Role)
}
