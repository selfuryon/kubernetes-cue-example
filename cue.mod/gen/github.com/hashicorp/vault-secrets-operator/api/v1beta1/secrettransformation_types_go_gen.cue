// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/hashicorp/vault-secrets-operator/api/v1beta1

package v1beta1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// SecretTransformationStatus defines the observed state of SecretTransformation
#SecretTransformationStatus: {
	valid: bool   @go(Valid)
	error: string @go(Error)
}

// SecretTransformation is the Schema for the secrettransformations API
#SecretTransformation: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta          @go(ObjectMeta)
	spec?:     #SecretTransformationSpec   @go(Spec)
	status?:   #SecretTransformationStatus @go(Status)
}

// SecretTransformationSpec defines the desired state of SecretTransformation
#SecretTransformationSpec: {
	// Templates maps a template name to its Template. Templates are always included
	// in the rendered K8s Secret with the specified key.
	templates?: {[string]: #Template} @go(Templates,map[string]Template)

	// SourceTemplates are never included in the rendered K8s Secret, they can be
	// used to provide common template definitions, etc.
	sourceTemplates?: [...#SourceTemplate] @go(SourceTemplates,[]SourceTemplate)

	// Includes contains regex patterns used to filter top-level source secret data
	// fields for inclusion in the final K8s Secret data. These pattern filters are
	// never applied to templated fields as defined in Templates. They are always
	// applied last.
	includes?: [...string] @go(Includes,[]string)

	// Excludes contains regex patterns used to filter top-level source secret data
	// fields for exclusion from the final K8s Secret data. These pattern filters are
	// never applied to templated fields as defined in Templates. They are always
	// applied before any inclusion patterns. To exclude all source secret data
	// fields, you can configure the single pattern ".*".
	excludes?: [...string] @go(Excludes,[]string)
}

// SourceTemplate provides source templating configuration.
#SourceTemplate: {
	name?: string @go(Name)

	// Text contains the Go text template format. The template
	// references attributes from the data structure of the source secret.
	// Refer to https://pkg.go.dev/text/template for more information.
	text: string @go(Text)
}

// SecretTransformationList contains a list of SecretTransformation
#SecretTransformationList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#SecretTransformation] @go(Items,[]SecretTransformation)
}
