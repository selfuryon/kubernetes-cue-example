// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ProjectDefaultServiceAccountsInitParameters: {
	// The action to be performed in the default service accounts. Valid values are: DEPRIVILEGE, DELETE, DISABLE. Note that DEPRIVILEGE action will ignore the REVERT configuration in the restore_policy
	action?: null | string @go(Action,*string)

	// The action to be performed in the default service accounts on the resource destroy.
	// Valid values are NONE, REVERT and REVERT_AND_IGNORE_FAILURE. It is applied for any action but in the DEPRIVILEGE.
	// If set to REVERT it attempts to restore all default SAs but the DEPRIVILEGE action.
	// If set to REVERT_AND_IGNORE_FAILURE it is the same behavior as REVERT but ignores errors returned by the API.
	restorePolicy?: null | string @go(RestorePolicy,*string)
}

#ProjectDefaultServiceAccountsObservation: {
	// The action to be performed in the default service accounts. Valid values are: DEPRIVILEGE, DELETE, DISABLE. Note that DEPRIVILEGE action will ignore the REVERT configuration in the restore_policy
	action?: null | string @go(Action,*string)

	// an identifier for the resource with format projects/{{project}}
	id?: null | string @go(ID,*string)

	// The project ID where service accounts are created.
	project?: null | string @go(Project,*string)

	// The action to be performed in the default service accounts on the resource destroy.
	// Valid values are NONE, REVERT and REVERT_AND_IGNORE_FAILURE. It is applied for any action but in the DEPRIVILEGE.
	// If set to REVERT it attempts to restore all default SAs but the DEPRIVILEGE action.
	// If set to REVERT_AND_IGNORE_FAILURE it is the same behavior as REVERT but ignores errors returned by the API.
	restorePolicy?: null | string @go(RestorePolicy,*string)

	// The Service Accounts changed by this resource. It is used for REVERT the action on the destroy.
	serviceAccounts?: {[string]: string} @go(ServiceAccounts,map[string]string)
}

#ProjectDefaultServiceAccountsParameters: {
	// The action to be performed in the default service accounts. Valid values are: DEPRIVILEGE, DELETE, DISABLE. Note that DEPRIVILEGE action will ignore the REVERT configuration in the restore_policy
	// +kubebuilder:validation:Optional
	action?: null | string @go(Action,*string)

	// The project ID where service accounts are created.
	// +crossplane:generate:reference:type=Project
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Reference to a Project to populate project.
	// +kubebuilder:validation:Optional
	projectRef?: null | v1.#Reference @go(ProjectRef,*v1.Reference)

	// Selector for a Project to populate project.
	// +kubebuilder:validation:Optional
	projectSelector?: null | v1.#Selector @go(ProjectSelector,*v1.Selector)

	// The action to be performed in the default service accounts on the resource destroy.
	// Valid values are NONE, REVERT and REVERT_AND_IGNORE_FAILURE. It is applied for any action but in the DEPRIVILEGE.
	// If set to REVERT it attempts to restore all default SAs but the DEPRIVILEGE action.
	// If set to REVERT_AND_IGNORE_FAILURE it is the same behavior as REVERT but ignores errors returned by the API.
	// +kubebuilder:validation:Optional
	restorePolicy?: null | string @go(RestorePolicy,*string)
}

// ProjectDefaultServiceAccountsSpec defines the desired state of ProjectDefaultServiceAccounts
#ProjectDefaultServiceAccountsSpec: {
	v1.#ResourceSpec
	forProvider: #ProjectDefaultServiceAccountsParameters @go(ForProvider)

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
	initProvider?: #ProjectDefaultServiceAccountsInitParameters @go(InitProvider)
}

// ProjectDefaultServiceAccountsStatus defines the observed state of ProjectDefaultServiceAccounts.
#ProjectDefaultServiceAccountsStatus: {
	v1.#ResourceStatus
	atProvider?: #ProjectDefaultServiceAccountsObservation @go(AtProvider)
}

// ProjectDefaultServiceAccounts is the Schema for the ProjectDefaultServiceAccountss API. Allows management of Google Cloud Platform project default service accounts.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#ProjectDefaultServiceAccounts: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.action) || (has(self.initProvider) && has(self.initProvider.action))",message="spec.forProvider.action is a required parameter"
	spec:    #ProjectDefaultServiceAccountsSpec   @go(Spec)
	status?: #ProjectDefaultServiceAccountsStatus @go(Status)
}

// ProjectDefaultServiceAccountsList contains a list of ProjectDefaultServiceAccountss
#ProjectDefaultServiceAccountsList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ProjectDefaultServiceAccounts] @go(Items,[]ProjectDefaultServiceAccounts)
}
