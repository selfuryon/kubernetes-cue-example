package crossplane

import "strings"

let kubernetesSA = [
	"crossplane-system/provider-gcp",
	"crossplane-system/provider-vault",
]

for s in kubernetesSA {
	let saName = strings.Replace(s, "/", "-", 1)
	gcpProvider: {
		serviceAccountIAMMember: "\(_project)-\(_serviceAccount)-wi-\(saName)": spec: {
			forProvider: {
				member: "serviceAccount:\(_project).svc.id.goog[\(s)]"
				role:   "roles/iam.workloadIdentityUser"
				serviceAccountIdRef: name: "\(_project)-\(_serviceAccount)"
			}
		}
	}
}
