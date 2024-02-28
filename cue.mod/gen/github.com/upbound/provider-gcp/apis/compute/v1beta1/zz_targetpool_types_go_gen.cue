// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/compute/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#TargetPoolInitParameters: {
	// URL to the backup target pool. Must also set
	// failover_ratio.
	backupPool?: null | string @go(BackupPool,*string)

	// Textual description field.
	description?: null | string @go(Description,*string)

	// Ratio (0 to 1) of failed nodes before using the
	// backup pool (which must also be set).
	failoverRatio?: null | float64 @go(FailoverRatio,*float64)

	// List of instances in the pool. They can be given as
	// URLs, or in the form of "zone/name".
	instances?: [...null | string] @go(Instances,[]*string)

	// The ID of the project in which the resource belongs. If it
	// is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// How to distribute load. Options are "NONE" (no
	// affinity). "CLIENT_IP" (hash of the source/dest addresses / ports), and
	// "CLIENT_IP_PROTO" also includes the protocol (default "NONE").
	sessionAffinity?: null | string @go(SessionAffinity,*string)
}

#TargetPoolObservation: {
	// URL to the backup target pool. Must also set
	// failover_ratio.
	backupPool?: null | string @go(BackupPool,*string)

	// Textual description field.
	description?: null | string @go(Description,*string)

	// Ratio (0 to 1) of failed nodes before using the
	// backup pool (which must also be set).
	failoverRatio?: null | float64 @go(FailoverRatio,*float64)

	// List of zero or one health check name or self_link. Only
	// legacy google_compute_http_health_check is supported.
	healthChecks?: [...null | string] @go(HealthChecks,[]*string)

	// an identifier for the resource with format projects/{{project}}/regions/{{region}}/targetPools/{{name}}
	id?: null | string @go(ID,*string)

	// List of instances in the pool. They can be given as
	// URLs, or in the form of "zone/name".
	instances?: [...null | string] @go(Instances,[]*string)

	// The ID of the project in which the resource belongs. If it
	// is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// Where the target pool resides. Defaults to project
	// region.
	region?: null | string @go(Region,*string)

	// The URI of the created resource.
	selfLink?: null | string @go(SelfLink,*string)

	// How to distribute load. Options are "NONE" (no
	// affinity). "CLIENT_IP" (hash of the source/dest addresses / ports), and
	// "CLIENT_IP_PROTO" also includes the protocol (default "NONE").
	sessionAffinity?: null | string @go(SessionAffinity,*string)
}

#TargetPoolParameters: {
	// URL to the backup target pool. Must also set
	// failover_ratio.
	// +kubebuilder:validation:Optional
	backupPool?: null | string @go(BackupPool,*string)

	// Textual description field.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Ratio (0 to 1) of failed nodes before using the
	// backup pool (which must also be set).
	// +kubebuilder:validation:Optional
	failoverRatio?: null | float64 @go(FailoverRatio,*float64)

	// List of zero or one health check name or self_link. Only
	// legacy google_compute_http_health_check is supported.
	// +crossplane:generate:reference:type=HTTPHealthCheck
	// +kubebuilder:validation:Optional
	healthChecks?: [...null | string] @go(HealthChecks,[]*string)

	// References to HTTPHealthCheck to populate healthChecks.
	// +kubebuilder:validation:Optional
	healthChecksRefs?: [...v1.#Reference] @go(HealthChecksRefs,[]v1.Reference)

	// Selector for a list of HTTPHealthCheck to populate healthChecks.
	// +kubebuilder:validation:Optional
	healthChecksSelector?: null | v1.#Selector @go(HealthChecksSelector,*v1.Selector)

	// List of instances in the pool. They can be given as
	// URLs, or in the form of "zone/name".
	// +kubebuilder:validation:Optional
	instances?: [...null | string] @go(Instances,[]*string)

	// The ID of the project in which the resource belongs. If it
	// is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// Where the target pool resides. Defaults to project
	// region.
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// How to distribute load. Options are "NONE" (no
	// affinity). "CLIENT_IP" (hash of the source/dest addresses / ports), and
	// "CLIENT_IP_PROTO" also includes the protocol (default "NONE").
	// +kubebuilder:validation:Optional
	sessionAffinity?: null | string @go(SessionAffinity,*string)
}

// TargetPoolSpec defines the desired state of TargetPool
#TargetPoolSpec: {
	v1.#ResourceSpec
	forProvider: #TargetPoolParameters @go(ForProvider)

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
	initProvider?: #TargetPoolInitParameters @go(InitProvider)
}

// TargetPoolStatus defines the observed state of TargetPool.
#TargetPoolStatus: {
	v1.#ResourceStatus
	atProvider?: #TargetPoolObservation @go(AtProvider)
}

// TargetPool is the Schema for the TargetPools API. Manages a Target Pool within GCE.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#TargetPool: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #TargetPoolSpec    @go(Spec)
	status?:   #TargetPoolStatus  @go(Status)
}

// TargetPoolList contains a list of TargetPools
#TargetPoolList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#TargetPool] @go(Items,[]TargetPool)
}
