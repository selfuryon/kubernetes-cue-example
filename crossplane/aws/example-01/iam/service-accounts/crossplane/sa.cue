package crossplane

_serviceAccount: "crossplane"

awsProvider: user: "\(_project)-\(_serviceAccount)": spec: {
	deletionPolicy: "Orphan"
	forProvider: {}
}
