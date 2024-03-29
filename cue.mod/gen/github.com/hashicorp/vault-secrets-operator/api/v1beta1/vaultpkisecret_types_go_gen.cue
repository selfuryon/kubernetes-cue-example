// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/hashicorp/vault-secrets-operator/api/v1beta1

package v1beta1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// VaultPKISecretSpec defines the desired state of VaultPKISecret
#VaultPKISecretSpec: {
	// VaultAuthRef to the VaultAuth resource, can be prefixed with a namespace,
	// eg: `namespaceA/vaultAuthRefB`. If no namespace prefix is provided it will default to
	// namespace of the VaultAuth CR. If no value is specified for VaultAuthRef the Operator will
	// default to the `default` VaultAuth, configured in the operator's namespace.
	vaultAuthRef?: string @go(VaultAuthRef)

	// Namespace to get the secret from in Vault
	namespace?: string @go(Namespace)

	// Mount for the secret in Vault
	mount: string @go(Mount)

	// Role in Vault to use when issuing TLS certificates.
	role: string @go(Role)

	// Revoke the certificate when the resource is deleted.
	revoke?: bool @go(Revoke)

	// Clear the Kubernetes secret when the resource is deleted.
	clear?: bool @go(Clear)

	// ExpiryOffset to use for computing when the certificate should be renewed.
	// The rotation time will be difference between the expiration and the offset.
	// Should be in duration notation e.g. 30s, 120s, etc.
	// +kubebuilder:validation:Type=string
	// +kubebuilder:validation:Pattern="^([0-9]+(\\.[0-9]+)?(s|m|h))$"
	expiryOffset?: string @go(ExpiryOffset)

	// IssuerRef reference to an existing PKI issuer, either by Vault-generated
	// identifier, the literal string default to refer to the currently
	// configured default issuer, or the name assigned to an issuer.
	// This parameter is part of the request URL.
	issuerRef?: string @go(IssuerRef)

	// RolloutRestartTargets should be configured whenever the application(s) consuming the Vault secret does
	// not support dynamically reloading a rotated secret.
	// In that case one, or more RolloutRestartTarget(s) can be configured here. The Operator will
	// trigger a "rollout-restart" for each target whenever the Vault secret changes between reconciliation events.
	// See RolloutRestartTarget for more details.
	rolloutRestartTargets?: [...#RolloutRestartTarget] @go(RolloutRestartTargets,[]RolloutRestartTarget)

	// Destination provides configuration necessary for syncing the Vault secret
	// to Kubernetes. If the type is set to "kubernetes.io/tls", "tls.key" will
	// be set to the "private_key" response from Vault, and "tls.crt" will be
	// set to "certificate" + "ca_chain" from the Vault response ("issuing_ca"
	// is used when "ca_chain" is empty). The "remove_roots_from_chain=true"
	// option is used with Vault to exclude the root CA from the Vault response.
	destination: #Destination @go(Destination)

	// CommonName to include in the request.
	commonName?: string @go(CommonName)

	// AltNames to include in the request
	// May contain both DNS names and email addresses.
	altNames?: [...string] @go(AltNames,[]string)

	// IPSans to include in the request.
	ipSans?: [...string] @go(IPSans,[]string)

	// The requested URI SANs.
	uriSans?: [...string] @go(URISans,[]string)

	// Requested other SANs, in an array with the format
	// oid;type:value for each entry.
	otherSans?: [...string] @go(OtherSans,[]string)

	// User ID (OID 0.9.2342.19200300.100.1.1) Subject values to be placed on the
	// signed certificate.
	userIDs?: [...string] @go(UserIDs,[]string)

	// TTL for the certificate; sets the expiration date.
	// If not specified the Vault role's default,
	// backend default, or system default TTL is used, in that order.
	// Cannot be larger than the mount's max TTL.
	// Note: this only has an effect when generating a CA cert or signing a CA cert,
	// not when generating a CSR for an intermediate CA.
	// Should be in duration notation e.g. 120s, 2h, etc.
	// +kubebuilder:validation:Type=string
	// +kubebuilder:validation:Pattern="^([0-9]+(\\.[0-9]+)?(s|m|h))$"
	ttl?: string @go(TTL)

	// Format for the certificate. Choices: "pem", "der", "pem_bundle".
	// If "pem_bundle",
	// any private key and issuing cert will be appended to the certificate pem.
	// If "der", the value will be base64 encoded.
	// Default: pem
	format?: string @go(Format)

	// PrivateKeyFormat, generally the default will be controlled by the Format
	// parameter as either base64-encoded DER or PEM-encoded DER.
	// However, this can be set to "pkcs8" to have the returned
	// private key contain base64-encoded pkcs8 or PEM-encoded
	// pkcs8 instead.
	// Default: der
	privateKeyFormat?: string @go(PrivateKeyFormat)

	// NotAfter field of the certificate with specified date value.
	// The value format should be given in UTC format YYYY-MM-ddTHH:MM:SSZ
	notAfter?: string @go(NotAfter)

	// ExcludeCNFromSans from DNS or Email Subject Alternate Names.
	// Default: false
	excludeCNFromSans?: bool @go(ExcludeCNFromSans)
}

// VaultPKISecretStatus defines the observed state of VaultPKISecret
#VaultPKISecretStatus: {
	serialNumber?: string @go(SerialNumber)
	expiration?:   int64  @go(Expiration)

	// LastGeneration is the Generation of the last reconciled resource.
	lastGeneration: int64 @go(LastGeneration)

	// LastLastRotation of the certificate.
	lastRotation: int64 @go(LastRotation)

	// SecretMAC used when deciding whether new Vault secret data should be synced.
	//
	// The controller will compare the "new" Vault secret data to this value using HMAC,
	// if they are different, then the data will be synced to the Destination.
	//
	// The SecretMac is also used to detect drift in the Destination Secret's Data.
	// If drift is detected the data will be synced to the Destination.
	secretMAC?: string @go(SecretMAC)
	valid:      bool   @go(Valid)
	error:      string @go(Error)
}

// VaultPKISecret is the Schema for the vaultpkisecrets API
#VaultPKISecret: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta    @go(ObjectMeta)
	spec?:     #VaultPKISecretSpec   @go(Spec)
	status?:   #VaultPKISecretStatus @go(Status)
}

// VaultPKISecretList contains a list of VaultPKISecret
#VaultPKISecretList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#VaultPKISecret] @go(Items,[]VaultPKISecret)
}
