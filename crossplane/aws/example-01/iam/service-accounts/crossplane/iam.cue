package crossplane

let groups = [
	"example",
]

awsProvider: userGroupMembership: "\(_project)-\(_serviceAccount)": spec: {
	deletionPolicy: "Orphan"
	forProvider: {
		groupRefs: [for _group in groups {name: "\(_project)-\(_group)"}]
		userRef: name: "\(_project)-\(_serviceAccount)"
	}
}
