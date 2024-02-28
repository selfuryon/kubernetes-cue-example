// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/s3/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#BucketCorsConfigurationCorsRuleInitParameters: {
	// Set of Headers that are specified in the Access-Control-Request-Headers header.
	// +listType=set
	allowedHeaders?: [...null | string] @go(AllowedHeaders,[]*string)

	// Set of HTTP methods that you allow the origin to execute. Valid values are GET, PUT, HEAD, POST, and DELETE.
	// +listType=set
	allowedMethods?: [...null | string] @go(AllowedMethods,[]*string)

	// Set of origins you want customers to be able to access the bucket from.
	// +listType=set
	allowedOrigins?: [...null | string] @go(AllowedOrigins,[]*string)

	// Set of headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).
	// +listType=set
	exposeHeaders?: [...null | string] @go(ExposeHeaders,[]*string)

	// Unique identifier for the rule. The value cannot be longer than 255 characters.
	id?: null | string @go(ID,*string)

	// Time in seconds that your browser is to cache the preflight response for the specified resource.
	maxAgeSeconds?: null | float64 @go(MaxAgeSeconds,*float64)
}

#BucketCorsConfigurationCorsRuleObservation: {
	// Set of Headers that are specified in the Access-Control-Request-Headers header.
	// +listType=set
	allowedHeaders?: [...null | string] @go(AllowedHeaders,[]*string)

	// Set of HTTP methods that you allow the origin to execute. Valid values are GET, PUT, HEAD, POST, and DELETE.
	// +listType=set
	allowedMethods?: [...null | string] @go(AllowedMethods,[]*string)

	// Set of origins you want customers to be able to access the bucket from.
	// +listType=set
	allowedOrigins?: [...null | string] @go(AllowedOrigins,[]*string)

	// Set of headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).
	// +listType=set
	exposeHeaders?: [...null | string] @go(ExposeHeaders,[]*string)

	// Unique identifier for the rule. The value cannot be longer than 255 characters.
	id?: null | string @go(ID,*string)

	// Time in seconds that your browser is to cache the preflight response for the specified resource.
	maxAgeSeconds?: null | float64 @go(MaxAgeSeconds,*float64)
}

#BucketCorsConfigurationCorsRuleParameters: {
	// Set of Headers that are specified in the Access-Control-Request-Headers header.
	// +kubebuilder:validation:Optional
	// +listType=set
	allowedHeaders?: [...null | string] @go(AllowedHeaders,[]*string)

	// Set of HTTP methods that you allow the origin to execute. Valid values are GET, PUT, HEAD, POST, and DELETE.
	// +kubebuilder:validation:Optional
	// +listType=set
	allowedMethods: [...null | string] @go(AllowedMethods,[]*string)

	// Set of origins you want customers to be able to access the bucket from.
	// +kubebuilder:validation:Optional
	// +listType=set
	allowedOrigins: [...null | string] @go(AllowedOrigins,[]*string)

	// Set of headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).
	// +kubebuilder:validation:Optional
	// +listType=set
	exposeHeaders?: [...null | string] @go(ExposeHeaders,[]*string)

	// Unique identifier for the rule. The value cannot be longer than 255 characters.
	// +kubebuilder:validation:Optional
	id?: null | string @go(ID,*string)

	// Time in seconds that your browser is to cache the preflight response for the specified resource.
	// +kubebuilder:validation:Optional
	maxAgeSeconds?: null | float64 @go(MaxAgeSeconds,*float64)
}

#BucketCorsConfigurationInitParameters: {
	// Name of the bucket.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/s3/v1beta1.Bucket
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	bucket?: null | string @go(Bucket,*string)

	// Reference to a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketRef?: null | v1.#Reference @go(BucketRef,*v1.Reference)

	// Selector for a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketSelector?: null | v1.#Selector @go(BucketSelector,*v1.Selector)

	// Set of origins and methods (cross-origin access that you want to allow). See below. You can configure up to 100 rules.
	corsRule?: [...#BucketCorsConfigurationCorsRuleInitParameters] @go(CorsRule,[]BucketCorsConfigurationCorsRuleInitParameters)

	// Account ID of the expected bucket owner.
	expectedBucketOwner?: null | string @go(ExpectedBucketOwner,*string)
}

#BucketCorsConfigurationObservation: {
	// Name of the bucket.
	bucket?: null | string @go(Bucket,*string)

	// Set of origins and methods (cross-origin access that you want to allow). See below. You can configure up to 100 rules.
	corsRule?: [...#BucketCorsConfigurationCorsRuleObservation] @go(CorsRule,[]BucketCorsConfigurationCorsRuleObservation)

	// Account ID of the expected bucket owner.
	expectedBucketOwner?: null | string @go(ExpectedBucketOwner,*string)

	// The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided.
	id?: null | string @go(ID,*string)
}

#BucketCorsConfigurationParameters: {
	// Name of the bucket.
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

	// Set of origins and methods (cross-origin access that you want to allow). See below. You can configure up to 100 rules.
	// +kubebuilder:validation:Optional
	corsRule?: [...#BucketCorsConfigurationCorsRuleParameters] @go(CorsRule,[]BucketCorsConfigurationCorsRuleParameters)

	// Account ID of the expected bucket owner.
	// +kubebuilder:validation:Optional
	expectedBucketOwner?: null | string @go(ExpectedBucketOwner,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// BucketCorsConfigurationSpec defines the desired state of BucketCorsConfiguration
#BucketCorsConfigurationSpec: {
	v1.#ResourceSpec
	forProvider: #BucketCorsConfigurationParameters @go(ForProvider)

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
	initProvider?: #BucketCorsConfigurationInitParameters @go(InitProvider)
}

// BucketCorsConfigurationStatus defines the observed state of BucketCorsConfiguration.
#BucketCorsConfigurationStatus: {
	v1.#ResourceStatus
	atProvider?: #BucketCorsConfigurationObservation @go(AtProvider)
}

// BucketCorsConfiguration is the Schema for the BucketCorsConfigurations API. Provides an S3 bucket CORS configuration resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#BucketCorsConfiguration: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.corsRule) || (has(self.initProvider) && has(self.initProvider.corsRule))",message="spec.forProvider.corsRule is a required parameter"
	spec:    #BucketCorsConfigurationSpec   @go(Spec)
	status?: #BucketCorsConfigurationStatus @go(Status)
}

// BucketCorsConfigurationList contains a list of BucketCorsConfigurations
#BucketCorsConfigurationList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#BucketCorsConfiguration] @go(Items,[]BucketCorsConfiguration)
}
