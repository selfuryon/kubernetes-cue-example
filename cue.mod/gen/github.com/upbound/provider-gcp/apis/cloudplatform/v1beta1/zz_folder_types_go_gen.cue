// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#FolderInitParameters: {
	// The folder’s display name.
	// A folder’s display name must be unique amongst its siblings, e.g. no two folders with the same parent can share the same display name. The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens and underscores and can be no longer than 30 characters.
	displayName?: null | string @go(DisplayName,*string)
}

#FolderObservation: {
	// Timestamp when the Folder was created. Assigned by the server.
	// A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z".
	createTime?: null | string @go(CreateTime,*string)

	// The folder’s display name.
	// A folder’s display name must be unique amongst its siblings, e.g. no two folders with the same parent can share the same display name. The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens and underscores and can be no longer than 30 characters.
	displayName?: null | string @go(DisplayName,*string)
	folderId?:    null | string @go(FolderID,*string)
	id?:          null | string @go(ID,*string)

	// The lifecycle state of the folder such as ACTIVE or DELETE_REQUESTED.
	lifecycleState?: null | string @go(LifecycleState,*string)

	// The resource name of the Folder. Its format is folders/{folder_id}.
	name?: null | string @go(Name,*string)

	// The resource name of the parent Folder or Organization.
	// Must be of the form folders/{folder_id} or organizations/{org_id}.
	parent?: null | string @go(Parent,*string)
}

#FolderParameters: {
	// The folder’s display name.
	// A folder’s display name must be unique amongst its siblings, e.g. no two folders with the same parent can share the same display name. The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens and underscores and can be no longer than 30 characters.
	// +kubebuilder:validation:Optional
	displayName?: null | string @go(DisplayName,*string)

	// The resource name of the parent Folder or Organization.
	// Must be of the form folders/{folder_id} or organizations/{org_id}.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1.Folder
	// +crossplane:generate:reference:extractor=github.com/upbound/upjet/pkg/resource.ExtractParamPath("name",true)
	// +kubebuilder:validation:Optional
	parent?: null | string @go(Parent,*string)

	// Reference to a Folder in cloudplatform to populate parent.
	// +kubebuilder:validation:Optional
	parentRef?: null | v1.#Reference @go(ParentRef,*v1.Reference)

	// Selector for a Folder in cloudplatform to populate parent.
	// +kubebuilder:validation:Optional
	parentSelector?: null | v1.#Selector @go(ParentSelector,*v1.Selector)
}

// FolderSpec defines the desired state of Folder
#FolderSpec: {
	v1.#ResourceSpec
	forProvider: #FolderParameters @go(ForProvider)

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
	initProvider?: #FolderInitParameters @go(InitProvider)
}

// FolderStatus defines the observed state of Folder.
#FolderStatus: {
	v1.#ResourceStatus
	atProvider?: #FolderObservation @go(AtProvider)
}

// Folder is the Schema for the Folders API. Allows management of a Google Cloud Platform folder.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Folder: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.displayName) || (has(self.initProvider) && has(self.initProvider.displayName))",message="spec.forProvider.displayName is a required parameter"
	spec:    #FolderSpec   @go(Spec)
	status?: #FolderStatus @go(Status)
}

// FolderList contains a list of Folders
#FolderList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Folder] @go(Items,[]Folder)
}
