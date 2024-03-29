// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#BackendServiceSignedURLKeyInitParameters: {
	// Name of the signed URL key.
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#BackendServiceSignedURLKeyObservation: {
	// The backend service this signed URL key belongs.
	backendService?: null | string @go(BackendService,*string)

	// an identifier for the resource with format projects/{{project}}/global/backendServices/{{backend_service}}
	id?: null | string @go(ID,*string)

	// Name of the signed URL key.
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)
}

#BackendServiceSignedURLKeyParameters: {
	// The backend service this signed URL key belongs.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/compute/v1beta1.BackendService
	// +kubebuilder:validation:Optional
	backendService?: null | string @go(BackendService,*string)

	// Reference to a BackendService in compute to populate backendService.
	// +kubebuilder:validation:Optional
	backendServiceRef?: null | v1.#Reference @go(BackendServiceRef,*v1.Reference)

	// Selector for a BackendService in compute to populate backendService.
	// +kubebuilder:validation:Optional
	backendServiceSelector?: null | v1.#Selector @go(BackendServiceSelector,*v1.Selector)

	// 128-bit key value used for signing the URL. The key value must be a
	// valid RFC 4648 Section 5 base64url encoded string.
	// Note: This property is sensitive and will not be displayed in the plan.
	// +kubebuilder:validation:Optional
	keyValueSecretRef: v1.#SecretKeySelector @go(KeyValueSecretRef)

	// Name of the signed URL key.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)
}

// BackendServiceSignedURLKeySpec defines the desired state of BackendServiceSignedURLKey
#BackendServiceSignedURLKeySpec: {
	v1.#ResourceSpec
	forProvider: #BackendServiceSignedURLKeyParameters @go(ForProvider)

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
	initProvider?: #BackendServiceSignedURLKeyInitParameters @go(InitProvider)
}

// BackendServiceSignedURLKeyStatus defines the observed state of BackendServiceSignedURLKey.
#BackendServiceSignedURLKeyStatus: {
	v1.#ResourceStatus
	atProvider?: #BackendServiceSignedURLKeyObservation @go(AtProvider)
}

// BackendServiceSignedURLKey is the Schema for the BackendServiceSignedURLKeys API. A key for signing Cloud CDN signed URLs for Backend Services.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#BackendServiceSignedURLKey: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.keyValueSecretRef)",message="spec.forProvider.keyValueSecretRef is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #BackendServiceSignedURLKeySpec   @go(Spec)
	status?: #BackendServiceSignedURLKeyStatus @go(Status)
}

// BackendServiceSignedURLKeyList contains a list of BackendServiceSignedURLKeys
#BackendServiceSignedURLKeyList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#BackendServiceSignedURLKey] @go(Items,[]BackendServiceSignedURLKey)
}
