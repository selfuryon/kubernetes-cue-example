// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#OrganizationIAMMemberConditionInitParameters: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#OrganizationIAMMemberConditionObservation: {
	description?: null | string @go(Description,*string)
	expression?:  null | string @go(Expression,*string)
	title?:       null | string @go(Title,*string)
}

#OrganizationIAMMemberConditionParameters: {
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// +kubebuilder:validation:Optional
	expression?: null | string @go(Expression,*string)

	// +kubebuilder:validation:Optional
	title?: null | string @go(Title,*string)
}

#OrganizationIAMMemberInitParameters: {
	condition?: [...#OrganizationIAMMemberConditionInitParameters] @go(Condition,[]OrganizationIAMMemberConditionInitParameters)
	member?: null | string @go(Member,*string)
	orgId?:  null | string @go(OrgID,*string)
	role?:   null | string @go(Role,*string)
}

#OrganizationIAMMemberObservation: {
	condition?: [...#OrganizationIAMMemberConditionObservation] @go(Condition,[]OrganizationIAMMemberConditionObservation)
	etag?:   null | string @go(Etag,*string)
	id?:     null | string @go(ID,*string)
	member?: null | string @go(Member,*string)
	orgId?:  null | string @go(OrgID,*string)
	role?:   null | string @go(Role,*string)
}

#OrganizationIAMMemberParameters: {
	// +kubebuilder:validation:Optional
	condition?: [...#OrganizationIAMMemberConditionParameters] @go(Condition,[]OrganizationIAMMemberConditionParameters)

	// +kubebuilder:validation:Optional
	member?: null | string @go(Member,*string)

	// +kubebuilder:validation:Optional
	orgId?: null | string @go(OrgID,*string)

	// +kubebuilder:validation:Optional
	role?: null | string @go(Role,*string)
}

// OrganizationIAMMemberSpec defines the desired state of OrganizationIAMMember
#OrganizationIAMMemberSpec: {
	v1.#ResourceSpec
	forProvider: #OrganizationIAMMemberParameters @go(ForProvider)

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
	initProvider?: #OrganizationIAMMemberInitParameters @go(InitProvider)
}

// OrganizationIAMMemberStatus defines the observed state of OrganizationIAMMember.
#OrganizationIAMMemberStatus: {
	v1.#ResourceStatus
	atProvider?: #OrganizationIAMMemberObservation @go(AtProvider)
}

// OrganizationIAMMember is the Schema for the OrganizationIAMMembers API. <no value>
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#OrganizationIAMMember: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.member) || (has(self.initProvider) && has(self.initProvider.member))",message="spec.forProvider.member is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.orgId) || (has(self.initProvider) && has(self.initProvider.orgId))",message="spec.forProvider.orgId is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.role) || (has(self.initProvider) && has(self.initProvider.role))",message="spec.forProvider.role is a required parameter"
	spec:    #OrganizationIAMMemberSpec   @go(Spec)
	status?: #OrganizationIAMMemberStatus @go(Status)
}

// OrganizationIAMMemberList contains a list of OrganizationIAMMembers
#OrganizationIAMMemberList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#OrganizationIAMMember] @go(Items,[]OrganizationIAMMember)
}
