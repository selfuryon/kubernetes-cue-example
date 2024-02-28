package crossplane

vaultProvider: providerConfig: "\(_vault)": spec: {
	address: (_vaultUrl)
	credentials: source: "Secret"
	credentials: secretRef: {
		name:      "vault-provider-credentials"
		namespace: "crossplane-system"
		key:       "credentials"
	}
}
