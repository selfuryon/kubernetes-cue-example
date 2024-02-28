package crossplane

import "strings"

let roles = [
	"roles/editor",
	"roles/iam.serviceAccountAdmin",
	"roles/iam.serviceAccountTokenCreator",
	"roles/resourcemanager.projectIamAdmin",
	"roles/cloudkms.admin",
]

for r in roles {
	let roleName = strings.ToLower(
	strings.Replace(
	strings.Replace(r, ".", "-", 1),
	"/", "-", 1),
	)
	gcpProvider: {
		projectIAMMember: "\(_project)-\(_serviceAccount)-\(roleName)": spec: {
			forProvider: {
				project: (_project)
				member:  (_member)
				role:    (r)
			}
		}
	}
}
