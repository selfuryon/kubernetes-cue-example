// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

import esmeta "github.com/external-secrets/external-secrets/apis/meta/v1"

#YandexCertificateManagerAuth: {
	// The authorized key used for authentication
	// +optional
	authorizedKeySecretRef?: esmeta.#SecretKeySelector @go(AuthorizedKey)
}

#YandexCertificateManagerCAProvider: {
	certSecretRef?: esmeta.#SecretKeySelector @go(Certificate)
}

// YandexCertificateManagerProvider Configures a store to sync secrets using the Yandex Certificate Manager provider.
#YandexCertificateManagerProvider: {
	// Yandex.Cloud API endpoint (e.g. 'api.cloud.yandex.net:443')
	// +optional
	apiEndpoint?: string @go(APIEndpoint)

	// Auth defines the information necessary to authenticate against Yandex Certificate Manager
	auth: #YandexCertificateManagerAuth @go(Auth)

	// The provider for the CA bundle to use to validate Yandex.Cloud server certificate.
	// +optional
	caProvider?: null | #YandexCertificateManagerCAProvider @go(CAProvider,*YandexCertificateManagerCAProvider)
}
