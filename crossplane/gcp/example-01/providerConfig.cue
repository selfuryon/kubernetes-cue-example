package crossplane

gcpProvider: providerConfig: "\(_project)": spec: {
	projectID: _project
	credentials: source: "InjectedIdentity"
}
