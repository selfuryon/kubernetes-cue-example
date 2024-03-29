// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1alpha1

package v1alpha1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	apiextensionsv1 "k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/v1"
	corev1 "k8s.io/api/core/v1"
)

#ReasonSynced:  "Synced"
#ReasonErrored: "Errored"

#PushSecretStoreRef: {
	// Optionally, sync to the SecretStore of the given name
	// +optional
	name?: string @go(Name)

	// Optionally, sync to secret stores with label selector
	// +optional
	labelSelector?: null | metav1.#LabelSelector @go(LabelSelector,*metav1.LabelSelector)

	// Kind of the SecretStore resource (SecretStore or ClusterSecretStore)
	// Defaults to `SecretStore`
	// +kubebuilder:default="SecretStore"
	// +optional
	kind?: string @go(Kind)
}

// +kubebuilder:validation:Enum=Delete;None
#PushSecretDeletionPolicy: string // #enumPushSecretDeletionPolicy

#enumPushSecretDeletionPolicy:
	#PushSecretDeletionPolicyDelete |
	#PushSecretDeletionPolicyNone

#PushSecretDeletionPolicyDelete: #PushSecretDeletionPolicy & "Delete"
#PushSecretDeletionPolicyNone:   #PushSecretDeletionPolicy & "None"

// PushSecretSpec configures the behavior of the PushSecret.
#PushSecretSpec: {
	// The Interval to which External Secrets will try to push a secret definition
	refreshInterval?: null | metav1.#Duration @go(RefreshInterval,*metav1.Duration)
	secretStoreRefs: [...#PushSecretStoreRef] @go(SecretStoreRefs,[]PushSecretStoreRef)

	// Deletion Policy to handle Secrets in the provider. Possible Values: "Delete/None". Defaults to "None".
	// +kubebuilder:default="None"
	// +optional
	deletionPolicy?: #PushSecretDeletionPolicy @go(DeletionPolicy)

	// The Secret Selector (k8s source) for the Push Secret
	selector: #PushSecretSelector @go(Selector)

	// Secret Data that should be pushed to providers
	data?: [...#PushSecretData] @go(Data,[]PushSecretData)
}

#PushSecretSecret: {
	// Name of the Secret. The Secret must exist in the same namespace as the PushSecret manifest.
	name: string @go(Name)
}

#PushSecretSelector: {
	// Select a Secret to Push.
	secret: #PushSecretSecret @go(Secret)
}

#PushSecretRemoteRef: {
	// Name of the resulting provider secret.
	remoteKey: string @go(RemoteKey)

	// Name of the property in the resulting secret
	// +optional
	property?: string @go(Property)
}

#PushSecretMatch: {
	// Secret Key to be pushed
	secretKey: string @go(SecretKey)

	// Remote Refs to push to providers.
	remoteRef: #PushSecretRemoteRef @go(RemoteRef)
}

#PushSecretData: {
	// Match a given Secret Key to be pushed to the provider.
	match: #PushSecretMatch @go(Match)

	// Metadata is metadata attached to the secret.
	// The structure of metadata is provider specific, please look it up in the provider documentation.
	// +optional
	metadata?: null | apiextensionsv1.#JSON @go(Metadata,*apiextensionsv1.JSON)
}

// PushSecretConditionType indicates the condition of the PushSecret.
#PushSecretConditionType: string // #enumPushSecretConditionType

#enumPushSecretConditionType:
	#PushSecretReady

#PushSecretReady: #PushSecretConditionType & "Ready"

// PushSecretStatusCondition indicates the status of the PushSecret.
#PushSecretStatusCondition: {
	type:   #PushSecretConditionType @go(Type)
	status: corev1.#ConditionStatus  @go(Status)

	// +optional
	reason?: string @go(Reason)

	// +optional
	message?: string @go(Message)

	// +optional
	lastTransitionTime?: metav1.#Time @go(LastTransitionTime)
}

#SyncedPushSecretsMap: [string]: [string]: #PushSecretData

// PushSecretStatus indicates the history of the status of PushSecret.
#PushSecretStatus: {
	// +nullable
	// refreshTime is the time and date the external secret was fetched and
	// the target secret updated
	refreshTime?: metav1.#Time @go(RefreshTime)

	// SyncedResourceVersion keeps track of the last synced version.
	syncedResourceVersion?: string @go(SyncedResourceVersion)

	// Synced Push Secrets for later deletion. Matches Secret Stores to PushSecretData that was stored to that secretStore.
	// +optional
	syncedPushSecrets?: #SyncedPushSecretsMap @go(SyncedPushSecrets)

	// +optional
	conditions?: [...#PushSecretStatusCondition] @go(Conditions,[]PushSecretStatusCondition)
}

#PushSecret: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #PushSecretSpec    @go(Spec)
	status?:   #PushSecretStatus  @go(Status)
}

// +kubebuilder:object:root=true
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:printcolumn:name="Status",type=string,JSONPath=`.status.conditions[?(@.type=="Ready")].reason`
// PushSecretList contains a list of PushSecret resources.
#PushSecretList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#PushSecret] @go(Items,[]PushSecret)
}
