// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/s3/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#AbortIncompleteMultipartUploadInitParameters: {
	// Number of days after which Amazon S3 aborts an incomplete multipart upload.
	daysAfterInitiation?: null | float64 @go(DaysAfterInitiation,*float64)
}

#AbortIncompleteMultipartUploadObservation: {
	// Number of days after which Amazon S3 aborts an incomplete multipart upload.
	daysAfterInitiation?: null | float64 @go(DaysAfterInitiation,*float64)
}

#AbortIncompleteMultipartUploadParameters: {
	// Number of days after which Amazon S3 aborts an incomplete multipart upload.
	// +kubebuilder:validation:Optional
	daysAfterInitiation?: null | float64 @go(DaysAfterInitiation,*float64)
}

#AndInitParameters: {
	// Minimum object size (in bytes) to which the rule applies.
	objectSizeGreaterThan?: null | float64 @go(ObjectSizeGreaterThan,*float64)

	// Maximum object size (in bytes) to which the rule applies.
	objectSizeLessThan?: null | float64 @go(ObjectSizeLessThan,*float64)

	// DEPRECATED Use filter instead. This has been deprecated by Amazon S3. Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if filter is not specified.
	prefix?: null | string @go(Prefix,*string)

	// Key-value map of resource tags. All of these tags must exist in the object's tag set in order for the rule to apply.
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#AndObservation: {
	// Minimum object size (in bytes) to which the rule applies.
	objectSizeGreaterThan?: null | float64 @go(ObjectSizeGreaterThan,*float64)

	// Maximum object size (in bytes) to which the rule applies.
	objectSizeLessThan?: null | float64 @go(ObjectSizeLessThan,*float64)

	// DEPRECATED Use filter instead. This has been deprecated by Amazon S3. Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if filter is not specified.
	prefix?: null | string @go(Prefix,*string)

	// Key-value map of resource tags. All of these tags must exist in the object's tag set in order for the rule to apply.
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#AndParameters: {
	// Minimum object size (in bytes) to which the rule applies.
	// +kubebuilder:validation:Optional
	objectSizeGreaterThan?: null | float64 @go(ObjectSizeGreaterThan,*float64)

	// Maximum object size (in bytes) to which the rule applies.
	// +kubebuilder:validation:Optional
	objectSizeLessThan?: null | float64 @go(ObjectSizeLessThan,*float64)

	// DEPRECATED Use filter instead. This has been deprecated by Amazon S3. Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if filter is not specified.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)

	// Key-value map of resource tags. All of these tags must exist in the object's tag set in order for the rule to apply.
	// +kubebuilder:validation:Optional
	// +mapType=granular
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#BucketLifecycleConfigurationInitParameters: {
	// Name of the source S3 bucket you want Amazon S3 to monitor.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/s3/v1beta1.Bucket
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	bucket?: null | string @go(Bucket,*string)

	// Reference to a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketRef?: null | v1.#Reference @go(BucketRef,*v1.Reference)

	// Selector for a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketSelector?: null | v1.#Selector @go(BucketSelector,*v1.Selector)

	// Account ID of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP 403 (Access Denied) error.
	expectedBucketOwner?: null | string @go(ExpectedBucketOwner,*string)

	// List of configuration blocks describing the rules managing the replication. See below.
	rule?: [...#BucketLifecycleConfigurationRuleInitParameters] @go(Rule,[]BucketLifecycleConfigurationRuleInitParameters)
}

#BucketLifecycleConfigurationObservation: {
	// Name of the source S3 bucket you want Amazon S3 to monitor.
	bucket?: null | string @go(Bucket,*string)

	// Account ID of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP 403 (Access Denied) error.
	expectedBucketOwner?: null | string @go(ExpectedBucketOwner,*string)

	// and status)
	id?: null | string @go(ID,*string)

	// List of configuration blocks describing the rules managing the replication. See below.
	rule?: [...#BucketLifecycleConfigurationRuleObservation] @go(Rule,[]BucketLifecycleConfigurationRuleObservation)
}

#BucketLifecycleConfigurationParameters: {
	// Name of the source S3 bucket you want Amazon S3 to monitor.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/s3/v1beta1.Bucket
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	bucket?: null | string @go(Bucket,*string)

	// Reference to a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketRef?: null | v1.#Reference @go(BucketRef,*v1.Reference)

	// Selector for a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketSelector?: null | v1.#Selector @go(BucketSelector,*v1.Selector)

	// Account ID of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP 403 (Access Denied) error.
	// +kubebuilder:validation:Optional
	expectedBucketOwner?: null | string @go(ExpectedBucketOwner,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// List of configuration blocks describing the rules managing the replication. See below.
	// +kubebuilder:validation:Optional
	rule?: [...#BucketLifecycleConfigurationRuleParameters] @go(Rule,[]BucketLifecycleConfigurationRuleParameters)
}

#BucketLifecycleConfigurationRuleInitParameters: {
	// Configuration block that specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload. See below.
	abortIncompleteMultipartUpload?: [...#AbortIncompleteMultipartUploadInitParameters] @go(AbortIncompleteMultipartUpload,[]AbortIncompleteMultipartUploadInitParameters)

	// Configuration block that specifies the expiration for the lifecycle of the object in the form of date, days and, whether the object has a delete marker. See below.
	expiration?: [...#RuleExpirationInitParameters] @go(Expiration,[]RuleExpirationInitParameters)

	// Configuration block used to identify objects that a Lifecycle Rule applies to. See below. If not specified, the rule will default to using prefix.
	filter?: [...#RuleFilterInitParameters] @go(Filter,[]RuleFilterInitParameters)

	// Unique identifier for the rule. The value cannot be longer than 255 characters.
	id?: null | string @go(ID,*string)

	// Configuration block that specifies when noncurrent object versions expire. See below.
	noncurrentVersionExpiration?: [...#RuleNoncurrentVersionExpirationInitParameters] @go(NoncurrentVersionExpiration,[]RuleNoncurrentVersionExpirationInitParameters)

	// Set of configuration blocks that specify the transition rule for the lifecycle rule that describes when noncurrent objects transition to a specific storage class. See below.
	noncurrentVersionTransition?: [...#RuleNoncurrentVersionTransitionInitParameters] @go(NoncurrentVersionTransition,[]RuleNoncurrentVersionTransitionInitParameters)

	// DEPRECATED Use filter instead. This has been deprecated by Amazon S3. Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if filter is not specified.
	prefix?: null | string @go(Prefix,*string)

	// Whether the rule is currently being applied. Valid values: Enabled or Disabled.
	status?: null | string @go(Status,*string)

	// Set of configuration blocks that specify when an Amazon S3 object transitions to a specified storage class. See below.
	transition?: [...#RuleTransitionInitParameters] @go(Transition,[]RuleTransitionInitParameters)
}

#BucketLifecycleConfigurationRuleObservation: {
	// Configuration block that specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload. See below.
	abortIncompleteMultipartUpload?: [...#AbortIncompleteMultipartUploadObservation] @go(AbortIncompleteMultipartUpload,[]AbortIncompleteMultipartUploadObservation)

	// Configuration block that specifies the expiration for the lifecycle of the object in the form of date, days and, whether the object has a delete marker. See below.
	expiration?: [...#RuleExpirationObservation] @go(Expiration,[]RuleExpirationObservation)

	// Configuration block used to identify objects that a Lifecycle Rule applies to. See below. If not specified, the rule will default to using prefix.
	filter?: [...#RuleFilterObservation] @go(Filter,[]RuleFilterObservation)

	// Unique identifier for the rule. The value cannot be longer than 255 characters.
	id?: null | string @go(ID,*string)

	// Configuration block that specifies when noncurrent object versions expire. See below.
	noncurrentVersionExpiration?: [...#RuleNoncurrentVersionExpirationObservation] @go(NoncurrentVersionExpiration,[]RuleNoncurrentVersionExpirationObservation)

	// Set of configuration blocks that specify the transition rule for the lifecycle rule that describes when noncurrent objects transition to a specific storage class. See below.
	noncurrentVersionTransition?: [...#RuleNoncurrentVersionTransitionObservation] @go(NoncurrentVersionTransition,[]RuleNoncurrentVersionTransitionObservation)

	// DEPRECATED Use filter instead. This has been deprecated by Amazon S3. Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if filter is not specified.
	prefix?: null | string @go(Prefix,*string)

	// Whether the rule is currently being applied. Valid values: Enabled or Disabled.
	status?: null | string @go(Status,*string)

	// Set of configuration blocks that specify when an Amazon S3 object transitions to a specified storage class. See below.
	transition?: [...#RuleTransitionObservation] @go(Transition,[]RuleTransitionObservation)
}

#BucketLifecycleConfigurationRuleParameters: {
	// Configuration block that specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload. See below.
	// +kubebuilder:validation:Optional
	abortIncompleteMultipartUpload?: [...#AbortIncompleteMultipartUploadParameters] @go(AbortIncompleteMultipartUpload,[]AbortIncompleteMultipartUploadParameters)

	// Configuration block that specifies the expiration for the lifecycle of the object in the form of date, days and, whether the object has a delete marker. See below.
	// +kubebuilder:validation:Optional
	expiration?: [...#RuleExpirationParameters] @go(Expiration,[]RuleExpirationParameters)

	// Configuration block used to identify objects that a Lifecycle Rule applies to. See below. If not specified, the rule will default to using prefix.
	// +kubebuilder:validation:Optional
	filter?: [...#RuleFilterParameters] @go(Filter,[]RuleFilterParameters)

	// Unique identifier for the rule. The value cannot be longer than 255 characters.
	// +kubebuilder:validation:Optional
	id?: null | string @go(ID,*string)

	// Configuration block that specifies when noncurrent object versions expire. See below.
	// +kubebuilder:validation:Optional
	noncurrentVersionExpiration?: [...#RuleNoncurrentVersionExpirationParameters] @go(NoncurrentVersionExpiration,[]RuleNoncurrentVersionExpirationParameters)

	// Set of configuration blocks that specify the transition rule for the lifecycle rule that describes when noncurrent objects transition to a specific storage class. See below.
	// +kubebuilder:validation:Optional
	noncurrentVersionTransition?: [...#RuleNoncurrentVersionTransitionParameters] @go(NoncurrentVersionTransition,[]RuleNoncurrentVersionTransitionParameters)

	// DEPRECATED Use filter instead. This has been deprecated by Amazon S3. Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if filter is not specified.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)

	// Whether the rule is currently being applied. Valid values: Enabled or Disabled.
	// +kubebuilder:validation:Optional
	status?: null | string @go(Status,*string)

	// Set of configuration blocks that specify when an Amazon S3 object transitions to a specified storage class. See below.
	// +kubebuilder:validation:Optional
	transition?: [...#RuleTransitionParameters] @go(Transition,[]RuleTransitionParameters)
}

#RuleExpirationInitParameters: {
	// Date objects are transitioned to the specified storage class. The date value must be in RFC3339 full-date format e.g. 2023-08-22.
	date?: null | string @go(Date,*string)

	// Number of days after creation when objects are transitioned to the specified storage class. The value must be a positive integer. If both days and date are not specified, defaults to 0. Valid values depend on storage_class, see Transition objects using Amazon S3 Lifecycle for more details.
	days?: null | float64 @go(Days,*float64)

	// Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true, the delete marker will be expired; if set to false the policy takes no action.
	expiredObjectDeleteMarker?: null | bool @go(ExpiredObjectDeleteMarker,*bool)
}

#RuleExpirationObservation: {
	// Date objects are transitioned to the specified storage class. The date value must be in RFC3339 full-date format e.g. 2023-08-22.
	date?: null | string @go(Date,*string)

	// Number of days after creation when objects are transitioned to the specified storage class. The value must be a positive integer. If both days and date are not specified, defaults to 0. Valid values depend on storage_class, see Transition objects using Amazon S3 Lifecycle for more details.
	days?: null | float64 @go(Days,*float64)

	// Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true, the delete marker will be expired; if set to false the policy takes no action.
	expiredObjectDeleteMarker?: null | bool @go(ExpiredObjectDeleteMarker,*bool)
}

#RuleExpirationParameters: {
	// Date objects are transitioned to the specified storage class. The date value must be in RFC3339 full-date format e.g. 2023-08-22.
	// +kubebuilder:validation:Optional
	date?: null | string @go(Date,*string)

	// Number of days after creation when objects are transitioned to the specified storage class. The value must be a positive integer. If both days and date are not specified, defaults to 0. Valid values depend on storage_class, see Transition objects using Amazon S3 Lifecycle for more details.
	// +kubebuilder:validation:Optional
	days?: null | float64 @go(Days,*float64)

	// Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true, the delete marker will be expired; if set to false the policy takes no action.
	// +kubebuilder:validation:Optional
	expiredObjectDeleteMarker?: null | bool @go(ExpiredObjectDeleteMarker,*bool)
}

#RuleFilterInitParameters: {
	// Configuration block used to apply a logical AND to two or more predicates. See below. The Lifecycle Rule will apply to any object matching all the predicates configured inside the and block.
	and?: [...#AndInitParameters] @go(And,[]AndInitParameters)

	// Minimum object size (in bytes) to which the rule applies.
	objectSizeGreaterThan?: null | string @go(ObjectSizeGreaterThan,*string)

	// Maximum object size (in bytes) to which the rule applies.
	objectSizeLessThan?: null | string @go(ObjectSizeLessThan,*string)

	// DEPRECATED Use filter instead. This has been deprecated by Amazon S3. Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if filter is not specified.
	prefix?: null | string @go(Prefix,*string)

	// Configuration block for specifying a tag key and value. See below.
	tag?: [...#TagInitParameters] @go(Tag,[]TagInitParameters)
}

#RuleFilterObservation: {
	// Configuration block used to apply a logical AND to two or more predicates. See below. The Lifecycle Rule will apply to any object matching all the predicates configured inside the and block.
	and?: [...#AndObservation] @go(And,[]AndObservation)

	// Minimum object size (in bytes) to which the rule applies.
	objectSizeGreaterThan?: null | string @go(ObjectSizeGreaterThan,*string)

	// Maximum object size (in bytes) to which the rule applies.
	objectSizeLessThan?: null | string @go(ObjectSizeLessThan,*string)

	// DEPRECATED Use filter instead. This has been deprecated by Amazon S3. Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if filter is not specified.
	prefix?: null | string @go(Prefix,*string)

	// Configuration block for specifying a tag key and value. See below.
	tag?: [...#TagObservation] @go(Tag,[]TagObservation)
}

#RuleFilterParameters: {
	// Configuration block used to apply a logical AND to two or more predicates. See below. The Lifecycle Rule will apply to any object matching all the predicates configured inside the and block.
	// +kubebuilder:validation:Optional
	and?: [...#AndParameters] @go(And,[]AndParameters)

	// Minimum object size (in bytes) to which the rule applies.
	// +kubebuilder:validation:Optional
	objectSizeGreaterThan?: null | string @go(ObjectSizeGreaterThan,*string)

	// Maximum object size (in bytes) to which the rule applies.
	// +kubebuilder:validation:Optional
	objectSizeLessThan?: null | string @go(ObjectSizeLessThan,*string)

	// DEPRECATED Use filter instead. This has been deprecated by Amazon S3. Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if filter is not specified.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)

	// Configuration block for specifying a tag key and value. See below.
	// +kubebuilder:validation:Optional
	tag?: [...#TagParameters] @go(Tag,[]TagParameters)
}

#RuleNoncurrentVersionExpirationInitParameters: {
	// Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer.
	newerNoncurrentVersions?: null | string @go(NewerNoncurrentVersions,*string)

	// Number of days an object is noncurrent before Amazon S3 can perform the associated action.
	noncurrentDays?: null | float64 @go(NoncurrentDays,*float64)
}

#RuleNoncurrentVersionExpirationObservation: {
	// Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer.
	newerNoncurrentVersions?: null | string @go(NewerNoncurrentVersions,*string)

	// Number of days an object is noncurrent before Amazon S3 can perform the associated action.
	noncurrentDays?: null | float64 @go(NoncurrentDays,*float64)
}

#RuleNoncurrentVersionExpirationParameters: {
	// Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer.
	// +kubebuilder:validation:Optional
	newerNoncurrentVersions?: null | string @go(NewerNoncurrentVersions,*string)

	// Number of days an object is noncurrent before Amazon S3 can perform the associated action.
	// +kubebuilder:validation:Optional
	noncurrentDays?: null | float64 @go(NoncurrentDays,*float64)
}

#RuleNoncurrentVersionTransitionInitParameters: {
	// Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer.
	newerNoncurrentVersions?: null | string @go(NewerNoncurrentVersions,*string)

	// Number of days an object is noncurrent before Amazon S3 can perform the associated action.
	noncurrentDays?: null | float64 @go(NoncurrentDays,*float64)

	// Class of storage used to store the object. Valid Values: GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.
	storageClass?: null | string @go(StorageClass,*string)
}

#RuleNoncurrentVersionTransitionObservation: {
	// Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer.
	newerNoncurrentVersions?: null | string @go(NewerNoncurrentVersions,*string)

	// Number of days an object is noncurrent before Amazon S3 can perform the associated action.
	noncurrentDays?: null | float64 @go(NoncurrentDays,*float64)

	// Class of storage used to store the object. Valid Values: GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.
	storageClass?: null | string @go(StorageClass,*string)
}

#RuleNoncurrentVersionTransitionParameters: {
	// Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer.
	// +kubebuilder:validation:Optional
	newerNoncurrentVersions?: null | string @go(NewerNoncurrentVersions,*string)

	// Number of days an object is noncurrent before Amazon S3 can perform the associated action.
	// +kubebuilder:validation:Optional
	noncurrentDays?: null | float64 @go(NoncurrentDays,*float64)

	// Class of storage used to store the object. Valid Values: GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.
	// +kubebuilder:validation:Optional
	storageClass?: null | string @go(StorageClass,*string)
}

#RuleTransitionInitParameters: {
	// Date objects are transitioned to the specified storage class. The date value must be in RFC3339 full-date format e.g. 2023-08-22.
	date?: null | string @go(Date,*string)

	// Number of days after creation when objects are transitioned to the specified storage class. The value must be a positive integer. If both days and date are not specified, defaults to 0. Valid values depend on storage_class, see Transition objects using Amazon S3 Lifecycle for more details.
	days?: null | float64 @go(Days,*float64)

	// Class of storage used to store the object. Valid Values: GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.
	storageClass?: null | string @go(StorageClass,*string)
}

#RuleTransitionObservation: {
	// Date objects are transitioned to the specified storage class. The date value must be in RFC3339 full-date format e.g. 2023-08-22.
	date?: null | string @go(Date,*string)

	// Number of days after creation when objects are transitioned to the specified storage class. The value must be a positive integer. If both days and date are not specified, defaults to 0. Valid values depend on storage_class, see Transition objects using Amazon S3 Lifecycle for more details.
	days?: null | float64 @go(Days,*float64)

	// Class of storage used to store the object. Valid Values: GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.
	storageClass?: null | string @go(StorageClass,*string)
}

#RuleTransitionParameters: {
	// Date objects are transitioned to the specified storage class. The date value must be in RFC3339 full-date format e.g. 2023-08-22.
	// +kubebuilder:validation:Optional
	date?: null | string @go(Date,*string)

	// Number of days after creation when objects are transitioned to the specified storage class. The value must be a positive integer. If both days and date are not specified, defaults to 0. Valid values depend on storage_class, see Transition objects using Amazon S3 Lifecycle for more details.
	// +kubebuilder:validation:Optional
	days?: null | float64 @go(Days,*float64)

	// Class of storage used to store the object. Valid Values: GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.
	// +kubebuilder:validation:Optional
	storageClass?: null | string @go(StorageClass,*string)
}

#TagInitParameters: {
	// Name of the object key.
	key?: null | string @go(Key,*string)

	// Value of the tag.
	value?: null | string @go(Value,*string)
}

#TagObservation: {
	// Name of the object key.
	key?: null | string @go(Key,*string)

	// Value of the tag.
	value?: null | string @go(Value,*string)
}

#TagParameters: {
	// Name of the object key.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)

	// Value of the tag.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

// BucketLifecycleConfigurationSpec defines the desired state of BucketLifecycleConfiguration
#BucketLifecycleConfigurationSpec: {
	v1.#ResourceSpec
	forProvider: #BucketLifecycleConfigurationParameters @go(ForProvider)

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
	initProvider?: #BucketLifecycleConfigurationInitParameters @go(InitProvider)
}

// BucketLifecycleConfigurationStatus defines the observed state of BucketLifecycleConfiguration.
#BucketLifecycleConfigurationStatus: {
	v1.#ResourceStatus
	atProvider?: #BucketLifecycleConfigurationObservation @go(AtProvider)
}

// BucketLifecycleConfiguration is the Schema for the BucketLifecycleConfigurations API. Provides a S3 bucket lifecycle configuration resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#BucketLifecycleConfiguration: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.rule) || (has(self.initProvider) && has(self.initProvider.rule))",message="spec.forProvider.rule is a required parameter"
	spec:    #BucketLifecycleConfigurationSpec   @go(Spec)
	status?: #BucketLifecycleConfigurationStatus @go(Status)
}

// BucketLifecycleConfigurationList contains a list of BucketLifecycleConfigurations
#BucketLifecycleConfigurationList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#BucketLifecycleConfiguration] @go(Items,[]BucketLifecycleConfiguration)
}
