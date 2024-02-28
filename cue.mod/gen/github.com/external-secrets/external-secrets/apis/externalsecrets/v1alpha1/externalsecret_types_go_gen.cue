// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1alpha1

package v1alpha1

import (
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// SecretStoreRef defines which SecretStore to fetch the ExternalSecret data.
#SecretStoreRef: {
	// Name of the SecretStore resource
	name: string @go(Name)

	// Kind of the SecretStore resource (SecretStore or ClusterSecretStore)
	// Defaults to `SecretStore`
	// +optional
	kind?: string @go(Kind)
}

// ExternalSecretCreationPolicy defines rules on how to create the resulting Secret.
// +kubebuilder:validation:Enum=Owner;Merge;None
#ExternalSecretCreationPolicy: string // #enumExternalSecretCreationPolicy

#enumExternalSecretCreationPolicy:
	#Owner |
	#Merge |
	#None

// Owner creates the Secret and sets .metadata.ownerReferences to the ExternalSecret resource.
#Owner: #ExternalSecretCreationPolicy & "Owner"

// Merge does not create the Secret, but merges the data fields to the Secret.
#Merge: #ExternalSecretCreationPolicy & "Merge"

// None does not create a Secret (future use with injector).
#None: #ExternalSecretCreationPolicy & "None"

// ExternalSecretTemplateMetadata defines metadata fields for the Secret blueprint.
#ExternalSecretTemplateMetadata: {
	// +optional
	annotations?: {[string]: string} @go(Annotations,map[string]string)

	// +optional
	labels?: {[string]: string} @go(Labels,map[string]string)
}

// ExternalSecretTemplate defines a blueprint for the created Secret resource.
// we can not use native corev1.Secret, it will have empty ObjectMeta values: https://github.com/kubernetes-sigs/controller-tools/issues/448
#ExternalSecretTemplate: {
	// +optional
	type?: corev1.#SecretType @go(Type)

	// EngineVersion specifies the template engine version
	// that should be used to compile/execute the
	// template specified in .data and .templateFrom[].
	// +kubebuilder:default="v1"
	engineVersion?: #TemplateEngineVersion @go(EngineVersion)

	// +optional
	metadata?: #ExternalSecretTemplateMetadata @go(Metadata)

	// +optional
	data?: {[string]: string} @go(Data,map[string]string)

	// +optional
	templateFrom?: [...#TemplateFrom] @go(TemplateFrom,[]TemplateFrom)
}

// +kubebuilder:validation:Enum=v1;v2
#TemplateEngineVersion: string // #enumTemplateEngineVersion

#enumTemplateEngineVersion:
	#TemplateEngineV1 |
	#TemplateEngineV2

#TemplateEngineV1: #TemplateEngineVersion & "v1"
#TemplateEngineV2: #TemplateEngineVersion & "v2"

// +kubebuilder:validation:MinProperties=1
// +kubebuilder:validation:MaxProperties=1
#TemplateFrom: {
	configMap?: null | #TemplateRef @go(ConfigMap,*TemplateRef)
	secret?:    null | #TemplateRef @go(Secret,*TemplateRef)
}

#TemplateRef: {
	name: string @go(Name)
	items: [...#TemplateRefItem] @go(Items,[]TemplateRefItem)
}

#TemplateRefItem: {
	key: string @go(Key)
}

// ExternalSecretTarget defines the Kubernetes Secret to be created
// There can be only one target per ExternalSecret.
#ExternalSecretTarget: {
	// Name defines the name of the Secret resource to be managed
	// This field is immutable
	// Defaults to the .metadata.name of the ExternalSecret resource
	// +optional
	name?: string @go(Name)

	// CreationPolicy defines rules on how to create the resulting Secret
	// Defaults to 'Owner'
	// +optional
	// +kubebuilder:default="Owner"
	creationPolicy?: #ExternalSecretCreationPolicy @go(CreationPolicy)

	// Template defines a blueprint for the created Secret resource.
	// +optional
	template?: null | #ExternalSecretTemplate @go(Template,*ExternalSecretTemplate)

	// Immutable defines if the final secret will be immutable
	// +optional
	immutable?: bool @go(Immutable)
}

// ExternalSecretData defines the connection between the Kubernetes Secret key (spec.data.<key>) and the Provider data.
#ExternalSecretData: {
	secretKey: string                       @go(SecretKey)
	remoteRef: #ExternalSecretDataRemoteRef @go(RemoteRef)
}

// ExternalSecretDataRemoteRef defines Provider data location.
#ExternalSecretDataRemoteRef: {
	// Key is the key used in the Provider, mandatory
	key: string @go(Key)

	// Used to select a specific version of the Provider value, if supported
	// +optional
	version?: string @go(Version)

	// +optional
	// Used to select a specific property of the Provider value (if a map), if supported
	property?: string @go(Property)

	// +optional
	// Used to define a conversion Strategy
	// +kubebuilder:default="Default"
	conversionStrategy?: #ExternalSecretConversionStrategy @go(ConversionStrategy)
}

// +kubebuilder:validation:Enum=Default;Unicode
#ExternalSecretConversionStrategy: string // #enumExternalSecretConversionStrategy

#enumExternalSecretConversionStrategy:
	#ExternalSecretConversionDefault |
	#ExternalSecretConversionUnicode

#ExternalSecretConversionDefault: #ExternalSecretConversionStrategy & "Default"
#ExternalSecretConversionUnicode: #ExternalSecretConversionStrategy & "Unicode"

// ExternalSecretSpec defines the desired state of ExternalSecret.
#ExternalSecretSpec: {
	secretStoreRef: #SecretStoreRef       @go(SecretStoreRef)
	target:         #ExternalSecretTarget @go(Target)

	// RefreshInterval is the amount of time before the values are read again from the SecretStore provider
	// Valid time units are "ns", "us" (or "µs"), "ms", "s", "m", "h"
	// May be set to zero to fetch and create it once. Defaults to 1h.
	// +kubebuilder:default="1h"
	refreshInterval?: null | metav1.#Duration @go(RefreshInterval,*metav1.Duration)

	// Data defines the connection between the Kubernetes Secret keys and the Provider data
	// +optional
	data?: [...#ExternalSecretData] @go(Data,[]ExternalSecretData)

	// DataFrom is used to fetch all properties from a specific Provider data
	// If multiple entries are specified, the Secret keys are merged in the specified order
	// +optional
	dataFrom?: [...#ExternalSecretDataRemoteRef] @go(DataFrom,[]ExternalSecretDataRemoteRef)
}

#ExternalSecretConditionType: string // #enumExternalSecretConditionType

#enumExternalSecretConditionType:
	#ExternalSecretReady |
	#ExternalSecretDeleted

#ExternalSecretReady:   #ExternalSecretConditionType & "Ready"
#ExternalSecretDeleted: #ExternalSecretConditionType & "Deleted"

#ExternalSecretStatusCondition: {
	type:   #ExternalSecretConditionType @go(Type)
	status: corev1.#ConditionStatus      @go(Status)

	// +optional
	reason?: string @go(Reason)

	// +optional
	message?: string @go(Message)

	// +optional
	lastTransitionTime?: metav1.#Time @go(LastTransitionTime)
}

// ConditionReasonSecretSynced indicates that the secrets was synced.
#ConditionReasonSecretSynced: "SecretSynced"

// ConditionReasonSecretSyncedError indicates that there was an error syncing the secret.
#ConditionReasonSecretSyncedError: "SecretSyncedError"

// ConditionReasonSecretDeleted indicates that the secret has been deleted.
#ConditionReasonSecretDeleted: "SecretDeleted"
#ReasonInvalidStoreRef:        "InvalidStoreRef"
#ReasonProviderClientConfig:   "InvalidProviderClientConfig"
#ReasonUpdateFailed:           "UpdateFailed"
#ReasonUpdated:                "Updated"

#ExternalSecretStatus: {
	// +nullable
	// refreshTime is the time and date the external secret was fetched and
	// the target secret updated
	refreshTime?: metav1.#Time @go(RefreshTime)

	// SyncedResourceVersion keeps track of the last synced version
	syncedResourceVersion?: string @go(SyncedResourceVersion)

	// +optional
	conditions?: [...#ExternalSecretStatusCondition] @go(Conditions,[]ExternalSecretStatusCondition)

	// Binding represents a servicebinding.io Provisioned Service reference to the secret
	binding?: corev1.#LocalObjectReference @go(Binding)
}

// ExternalSecret is the Schema for the external-secrets API.
// +kubebuilder:subresource:status
// +kubebuilder:deprecatedversion
// +kubebuilder:resource:scope=Namespaced,categories={externalsecrets},shortName=es
// +kubebuilder:printcolumn:name="Store",type=string,JSONPath=`.spec.secretStoreRef.name`
// +kubebuilder:printcolumn:name="Refresh Interval",type=string,JSONPath=`.spec.refreshInterval`
// +kubebuilder:printcolumn:name="Status",type=string,JSONPath=`.status.conditions[?(@.type=="Ready")].reason`
#ExternalSecret: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta    @go(ObjectMeta)
	spec?:     #ExternalSecretSpec   @go(Spec)
	status?:   #ExternalSecretStatus @go(Status)
}

// AnnotationDataHash is used to ensure consistency.
#AnnotationDataHash: "reconcile.external-secrets.io/data-hash"

// ExternalSecretList contains a list of ExternalSecret resources.
#ExternalSecretList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ExternalSecret] @go(Items,[]ExternalSecret)
}
