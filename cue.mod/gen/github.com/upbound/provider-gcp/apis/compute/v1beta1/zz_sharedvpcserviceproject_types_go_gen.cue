// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#SharedVPCServiceProjectInitParameters: {
	// The deletion policy for the shared VPC service. Setting ABANDON allows the resource to be abandoned rather than deleted. Possible values are: "ABANDON".
	deletionPolicy?: null | string @go(DeletionPolicy,*string)
}

#SharedVPCServiceProjectObservation: {
	// The deletion policy for the shared VPC service. Setting ABANDON allows the resource to be abandoned rather than deleted. Possible values are: "ABANDON".
	deletionPolicy?: null | string @go(DeletionPolicy,*string)

	// The ID of a host project to associate.
	hostProject?: null | string @go(HostProject,*string)

	// an identifier for the resource with format {{host_project}}/{{service_project}}
	id?: null | string @go(ID,*string)

	// The ID of the project that will serve as a Shared VPC service project.
	serviceProject?: null | string @go(ServiceProject,*string)
}

#SharedVPCServiceProjectParameters: {
	// The deletion policy for the shared VPC service. Setting ABANDON allows the resource to be abandoned rather than deleted. Possible values are: "ABANDON".
	// +kubebuilder:validation:Optional
	deletionPolicy?: null | string @go(DeletionPolicy,*string)

	// The ID of a host project to associate.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1.Project
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.ExtractProjectID()
	// +kubebuilder:validation:Optional
	hostProject?: null | string @go(HostProject,*string)

	// Reference to a Project in cloudplatform to populate hostProject.
	// +kubebuilder:validation:Optional
	hostProjectRef?: null | v1.#Reference @go(HostProjectRef,*v1.Reference)

	// Selector for a Project in cloudplatform to populate hostProject.
	// +kubebuilder:validation:Optional
	hostProjectSelector?: null | v1.#Selector @go(HostProjectSelector,*v1.Selector)

	// The ID of the project that will serve as a Shared VPC service project.
	// +crossplane:generate:reference:type=github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1.Project
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-gcp/config/common.ExtractProjectID()
	// +kubebuilder:validation:Optional
	serviceProject?: null | string @go(ServiceProject,*string)

	// Reference to a Project in cloudplatform to populate serviceProject.
	// +kubebuilder:validation:Optional
	serviceProjectRef?: null | v1.#Reference @go(ServiceProjectRef,*v1.Reference)

	// Selector for a Project in cloudplatform to populate serviceProject.
	// +kubebuilder:validation:Optional
	serviceProjectSelector?: null | v1.#Selector @go(ServiceProjectSelector,*v1.Selector)
}

// SharedVPCServiceProjectSpec defines the desired state of SharedVPCServiceProject
#SharedVPCServiceProjectSpec: {
	v1.#ResourceSpec
	forProvider: #SharedVPCServiceProjectParameters @go(ForProvider)

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
	initProvider?: #SharedVPCServiceProjectInitParameters @go(InitProvider)
}

// SharedVPCServiceProjectStatus defines the observed state of SharedVPCServiceProject.
#SharedVPCServiceProjectStatus: {
	v1.#ResourceStatus
	atProvider?: #SharedVPCServiceProjectObservation @go(AtProvider)
}

// SharedVPCServiceProject is the Schema for the SharedVPCServiceProjects API. Enables the Google Compute Engine Shared VPC feature for a project, assigning it as a service project.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#SharedVPCServiceProject: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta             @go(ObjectMeta)
	spec:      #SharedVPCServiceProjectSpec   @go(Spec)
	status?:   #SharedVPCServiceProjectStatus @go(Status)
}

// SharedVPCServiceProjectList contains a list of SharedVPCServiceProjects
#SharedVPCServiceProjectList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#SharedVPCServiceProject] @go(Items,[]SharedVPCServiceProject)
}
