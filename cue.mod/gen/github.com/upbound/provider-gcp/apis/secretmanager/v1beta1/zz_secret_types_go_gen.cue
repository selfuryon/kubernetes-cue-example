// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-gcp/apis/secretmanager/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#CustomerManagedEncryptionInitParameters: {
	// Describes the Cloud KMS encryption key that will be used to protect destination secret.
	kmsKeyName?: null | string @go(KMSKeyName,*string)
}

#CustomerManagedEncryptionObservation: {
	// Describes the Cloud KMS encryption key that will be used to protect destination secret.
	kmsKeyName?: null | string @go(KMSKeyName,*string)
}

#CustomerManagedEncryptionParameters: {
	// Describes the Cloud KMS encryption key that will be used to protect destination secret.
	// +kubebuilder:validation:Optional
	kmsKeyName?: null | string @go(KMSKeyName,*string)
}

#ReplicasInitParameters: {
	// Customer Managed Encryption for the secret.
	// Structure is documented below.
	customerManagedEncryption?: [...#CustomerManagedEncryptionInitParameters] @go(CustomerManagedEncryption,[]CustomerManagedEncryptionInitParameters)

	// The canonical IDs of the location to replicate data. For example: "us-east1".
	location?: null | string @go(Location,*string)
}

#ReplicasObservation: {
	// Customer Managed Encryption for the secret.
	// Structure is documented below.
	customerManagedEncryption?: [...#CustomerManagedEncryptionObservation] @go(CustomerManagedEncryption,[]CustomerManagedEncryptionObservation)

	// The canonical IDs of the location to replicate data. For example: "us-east1".
	location?: null | string @go(Location,*string)
}

#ReplicasParameters: {
	// Customer Managed Encryption for the secret.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	customerManagedEncryption?: [...#CustomerManagedEncryptionParameters] @go(CustomerManagedEncryption,[]CustomerManagedEncryptionParameters)

	// The canonical IDs of the location to replicate data. For example: "us-east1".
	// +kubebuilder:validation:Optional
	location?: null | string @go(Location,*string)
}

#ReplicationInitParameters: {
	// The Secret will automatically be replicated without any restrictions.
	automatic?: null | bool @go(Automatic,*bool)

	// The Secret will be replicated to the regions specified by the user.
	// Structure is documented below.
	userManaged?: [...#UserManagedInitParameters] @go(UserManaged,[]UserManagedInitParameters)
}

#ReplicationObservation: {
	// The Secret will automatically be replicated without any restrictions.
	automatic?: null | bool @go(Automatic,*bool)

	// The Secret will be replicated to the regions specified by the user.
	// Structure is documented below.
	userManaged?: [...#UserManagedObservation] @go(UserManaged,[]UserManagedObservation)
}

#ReplicationParameters: {
	// The Secret will automatically be replicated without any restrictions.
	// +kubebuilder:validation:Optional
	automatic?: null | bool @go(Automatic,*bool)

	// The Secret will be replicated to the regions specified by the user.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	userManaged?: [...#UserManagedParameters] @go(UserManaged,[]UserManagedParameters)
}

#RotationInitParameters: {
	// Timestamp in UTC at which the Secret is scheduled to rotate.
	// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
	nextRotationTime?: null | string @go(NextRotationTime,*string)

	// The Duration between rotation notifications. Must be in seconds and at least 3600s (1h) and at most 3153600000s (100 years).
	// If rotationPeriod is set, next_rotation_time must be set. next_rotation_time will be advanced by this period when the service automatically sends rotation notifications.
	rotationPeriod?: null | string @go(RotationPeriod,*string)
}

#RotationObservation: {
	// Timestamp in UTC at which the Secret is scheduled to rotate.
	// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
	nextRotationTime?: null | string @go(NextRotationTime,*string)

	// The Duration between rotation notifications. Must be in seconds and at least 3600s (1h) and at most 3153600000s (100 years).
	// If rotationPeriod is set, next_rotation_time must be set. next_rotation_time will be advanced by this period when the service automatically sends rotation notifications.
	rotationPeriod?: null | string @go(RotationPeriod,*string)
}

#RotationParameters: {
	// Timestamp in UTC at which the Secret is scheduled to rotate.
	// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
	// +kubebuilder:validation:Optional
	nextRotationTime?: null | string @go(NextRotationTime,*string)

	// The Duration between rotation notifications. Must be in seconds and at least 3600s (1h) and at most 3153600000s (100 years).
	// If rotationPeriod is set, next_rotation_time must be set. next_rotation_time will be advanced by this period when the service automatically sends rotation notifications.
	// +kubebuilder:validation:Optional
	rotationPeriod?: null | string @go(RotationPeriod,*string)
}

#SecretInitParameters: {
	// Timestamp in UTC when the Secret is scheduled to expire. This is always provided on output, regardless of what was sent on input.
	// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
	expireTime?: null | string @go(ExpireTime,*string)

	// The labels assigned to this Secret.
	// Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes,
	// and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}-]{0,62}
	// Label values must be between 0 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes,
	// and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}-]{0,63}
	// No more than 64 labels can be assigned to a given resource.
	// An object containing a list of "key": value pairs. Example:
	// { "name": "wrench", "mass": "1.3kg", "count": "3" }.
	// +mapType=granular
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The replication policy of the secret data attached to the Secret. It cannot be changed
	// after the Secret has been created.
	// Structure is documented below.
	replication?: [...#ReplicationInitParameters] @go(Replication,[]ReplicationInitParameters)

	// The rotation time and period for a Secret. At next_rotation_time, Secret Manager will send a Pub/Sub notification to the topics configured on the Secret. topics must be set to configure rotation.
	// Structure is documented below.
	rotation?: [...#RotationInitParameters] @go(Rotation,[]RotationInitParameters)

	// The TTL for the Secret.
	// A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
	ttl?: null | string @go(TTL,*string)

	// A list of up to 10 Pub/Sub topics to which messages are published when control plane operations are called on the secret or its versions.
	// Structure is documented below.
	topics?: [...#TopicsInitParameters] @go(Topics,[]TopicsInitParameters)
}

#SecretObservation: {
	// The time at which the Secret was created.
	createTime?: null | string @go(CreateTime,*string)

	// Timestamp in UTC when the Secret is scheduled to expire. This is always provided on output, regardless of what was sent on input.
	// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
	expireTime?: null | string @go(ExpireTime,*string)

	// an identifier for the resource with format projects/{{project}}/secrets/{{secret_id}}
	id?: null | string @go(ID,*string)

	// The labels assigned to this Secret.
	// Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes,
	// and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}-]{0,62}
	// Label values must be between 0 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes,
	// and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}-]{0,63}
	// No more than 64 labels can be assigned to a given resource.
	// An object containing a list of "key": value pairs. Example:
	// { "name": "wrench", "mass": "1.3kg", "count": "3" }.
	// +mapType=granular
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The resource name of the Secret. Format:
	// projects/{{project}}/secrets/{{secret_id}}
	name?: null | string @go(Name,*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	project?: null | string @go(Project,*string)

	// The replication policy of the secret data attached to the Secret. It cannot be changed
	// after the Secret has been created.
	// Structure is documented below.
	replication?: [...#ReplicationObservation] @go(Replication,[]ReplicationObservation)

	// The rotation time and period for a Secret. At next_rotation_time, Secret Manager will send a Pub/Sub notification to the topics configured on the Secret. topics must be set to configure rotation.
	// Structure is documented below.
	rotation?: [...#RotationObservation] @go(Rotation,[]RotationObservation)

	// The TTL for the Secret.
	// A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
	ttl?: null | string @go(TTL,*string)

	// A list of up to 10 Pub/Sub topics to which messages are published when control plane operations are called on the secret or its versions.
	// Structure is documented below.
	topics?: [...#TopicsObservation] @go(Topics,[]TopicsObservation)
}

#SecretParameters: {
	// Timestamp in UTC when the Secret is scheduled to expire. This is always provided on output, regardless of what was sent on input.
	// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
	// +kubebuilder:validation:Optional
	expireTime?: null | string @go(ExpireTime,*string)

	// The labels assigned to this Secret.
	// Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes,
	// and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}-]{0,62}
	// Label values must be between 0 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes,
	// and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}-]{0,63}
	// No more than 64 labels can be assigned to a given resource.
	// An object containing a list of "key": value pairs. Example:
	// { "name": "wrench", "mass": "1.3kg", "count": "3" }.
	// +kubebuilder:validation:Optional
	// +mapType=granular
	labels?: {[string]: null | string} @go(Labels,map[string]*string)

	// The ID of the project in which the resource belongs.
	// If it is not provided, the provider project is used.
	// +kubebuilder:validation:Optional
	project?: null | string @go(Project,*string)

	// The replication policy of the secret data attached to the Secret. It cannot be changed
	// after the Secret has been created.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	replication?: [...#ReplicationParameters] @go(Replication,[]ReplicationParameters)

	// The rotation time and period for a Secret. At next_rotation_time, Secret Manager will send a Pub/Sub notification to the topics configured on the Secret. topics must be set to configure rotation.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	rotation?: [...#RotationParameters] @go(Rotation,[]RotationParameters)

	// The TTL for the Secret.
	// A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
	// +kubebuilder:validation:Optional
	ttl?: null | string @go(TTL,*string)

	// A list of up to 10 Pub/Sub topics to which messages are published when control plane operations are called on the secret or its versions.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	topics?: [...#TopicsParameters] @go(Topics,[]TopicsParameters)
}

#TopicsInitParameters: {
	// The resource name of the Pub/Sub topic that will be published to, in the following format: projects//topics/.
	// For publication to succeed, the Secret Manager Service Agent service account must have pubsub.publisher permissions on the topic.
	name?: null | string @go(Name,*string)
}

#TopicsObservation: {
	// The resource name of the Pub/Sub topic that will be published to, in the following format: projects//topics/.
	// For publication to succeed, the Secret Manager Service Agent service account must have pubsub.publisher permissions on the topic.
	name?: null | string @go(Name,*string)
}

#TopicsParameters: {
	// The resource name of the Pub/Sub topic that will be published to, in the following format: projects//topics/.
	// For publication to succeed, the Secret Manager Service Agent service account must have pubsub.publisher permissions on the topic.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)
}

#UserManagedInitParameters: {
	// The list of Replicas for this Secret. Cannot be empty.
	// Structure is documented below.
	replicas?: [...#ReplicasInitParameters] @go(Replicas,[]ReplicasInitParameters)
}

#UserManagedObservation: {
	// The list of Replicas for this Secret. Cannot be empty.
	// Structure is documented below.
	replicas?: [...#ReplicasObservation] @go(Replicas,[]ReplicasObservation)
}

#UserManagedParameters: {
	// The list of Replicas for this Secret. Cannot be empty.
	// Structure is documented below.
	// +kubebuilder:validation:Optional
	replicas: [...#ReplicasParameters] @go(Replicas,[]ReplicasParameters)
}

// SecretSpec defines the desired state of Secret
#SecretSpec: {
	v1.#ResourceSpec
	forProvider: #SecretParameters @go(ForProvider)

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
	initProvider?: #SecretInitParameters @go(InitProvider)
}

// SecretStatus defines the observed state of Secret.
#SecretStatus: {
	v1.#ResourceStatus
	atProvider?: #SecretObservation @go(AtProvider)
}

// Secret is the Schema for the Secrets API. A Secret is a logical secret whose value and versions can be accessed.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,gcp}
#Secret: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.replication) || (has(self.initProvider) && has(self.initProvider.replication))",message="spec.forProvider.replication is a required parameter"
	spec:    #SecretSpec   @go(Spec)
	status?: #SecretStatus @go(Status)
}

// SecretList contains a list of Secrets
#SecretList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Secret] @go(Items,[]Secret)
}
