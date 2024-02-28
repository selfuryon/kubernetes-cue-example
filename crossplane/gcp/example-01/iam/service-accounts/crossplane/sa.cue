package crossplane

_serviceAccount: "crossplane"
_member:         "serviceAccount:\(_serviceAccount)@\(_project).iam.gserviceaccount.com"

gcpProvider: {
	serviceAccount: "\(_project)-\(_serviceAccount)": spec: {
		deletionPolicy: "Orphan"
		forProvider: {
			displayName: "crossplane"
			description: "Crossplane SA for cloud resource management"
		}
	}
}
