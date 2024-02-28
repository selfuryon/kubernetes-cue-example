package crossplane

awsProvider: providerConfig: "\(_project)": spec: {
	credentials: {
		source: "Secret"
		secretRef: {
			namespace: _crossplaneNS
			name:      "aws-\(_project)"
			key:       "credentials"
		}
	}
}
