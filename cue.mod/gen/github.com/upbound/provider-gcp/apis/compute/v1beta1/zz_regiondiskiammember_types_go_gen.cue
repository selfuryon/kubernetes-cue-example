// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#RegionDiskIAMMemberConditionInitParameters: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#RegionDiskIAMMemberConditionObservation: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#RegionDiskIAMMemberConditionParameters: {
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// +kubebuilder:validation:Optional
	expression?: null | string @go(Expression,*string)

	// +kubebuilder:validation:Optional
	title?: null | string @go(Title,*string)
}

#RegionDiskIAMMemberInitParameters: {
	condition?: [...#RegionDiskIAMMemberConditionInitParameters] @go(Condition,[]RegionDiskIAMMemberConditionInitParameters)
	member?:  null | string @go(Member,*string)
	project?: null | string @go(Project,*string)
	region?:  null | string @go(Region,*string)
	role?:    null | string @go(Role,*string)
}

#RegionDiskIAMMemberObservation: {
	condition?: [...#RegionDiskIAMMemberConditionObservation] @go(Condition,[]RegionDiskIAMMemberConditionObservation)
	etag?:    null | string @go(Etag,*string)
	id?:      null | string @go(ID,*string)
	member?:  null | string @go(Member,*string)
	name?:    null | string @go(Name,*string)
	project?: null | string @go(Project,*string)
	region?:  null | string @go(Region,*string)
	role?:    null | string @go(Role,*string)
}

#RegionDiskIAMMemberParameters: {
	// +kubebuilder:validation:Optional
	condition?: [...#RegionDiskIAMMemberConditionParameters] @go(Condition,[]RegionDiskIAMMemberConditionParameters)

	// +kubebuilder:validation:Optional
	member?: null | string @go(Member,*string)

	// +crossplane:generate:reference:type=RegionDisk
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Reference to a RegionDisk to populate name.
	// +kubebuilder:validation:Optional
	nameRef?: null | v1.#Reference @go(NameRef,*v1.Reference)

	// Selector for a RegionDisk to populate name.
	// +kubebuilder:validation:Optional
	nameSelector?: null | v1.#Selector @go(NameSelector,*v1.Selector)

	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// +kubebuilder:validation:Optional
	region?: null | string @go(Region,*string)

	// +kubebuilder:validation:Optional
	role?: null | string @go(Role,*string)
}

// RegionDiskIAMMemberSpec defines the desired state of RegionDiskIAMMember
#RegionDiskIAMMemberSpec: {
	v1.#ResourceSpec
	forProvider: #RegionDiskIAMMemberParameters @go(ForProvider)

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
	initProvider?: #RegionDiskIAMMemberInitParameters @go(InitProvider)
}

// RegionDiskIAMMemberStatus defines the observed state of RegionDiskIAMMember.
#RegionDiskIAMMemberStatus: {
	v1.#ResourceStatus
	atProvider?: #RegionDiskIAMMemberObservation @go(AtProvider)
}

// RegionDiskIAMMember is the Schema for the RegionDiskIAMMembers API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#RegionDiskIAMMember: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.member) || (has(self.initProvider) && has(self.initProvider.member))",message="spec.forProvider.member is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.role) || (has(self.initProvider) && has(self.initProvider.role))",message="spec.forProvider.role is a required parameter"
	spec:    #RegionDiskIAMMemberSpec   @go(Spec)
	status?: #RegionDiskIAMMemberStatus @go(Status)
}

// RegionDiskIAMMemberList contains a list of RegionDiskIAMMembers
#RegionDiskIAMMemberList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#RegionDiskIAMMember] @go(Items,[]RegionDiskIAMMember)
}
