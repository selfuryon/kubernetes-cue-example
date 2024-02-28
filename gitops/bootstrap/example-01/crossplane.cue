package gitops

let gcpProjects = ["example-01"]

let awsProjects = ["example-01"]

let vaults = ["vault-example"]

for prj in awsProjects {
	argocd: application: "\(_cluster)-crossplane-aws-\(prj)": spec: {
		project: "\(_cluster)-crossplane"
		source: {
			path:           "crossplane/aws/\(prj)"
			repoURL:        "https://github.com/kubernetes-cue-example"
			targetRevision: "HEAD"
			plugin: name: "cue"
		}
	}
}

for prj in gcpProjects {
	argocd: application: "\(_cluster)-crossplane-gcp-\(prj)": spec: {
		project: "\(_cluster)-crossplane"
		source: {
			path:           "crossplane/gcp/\(prj)"
			repoURL:        "https://github.com/kubernetes-cue-example"
			targetRevision: "HEAD"
			plugin: name: "cue"
		}
	}
}

for vlt in vaults {
	argocd: application: "\(_cluster)-crossplane-vault-\(vlt)": spec: {
		project: "\(_cluster)-crossplane"
		source: {
			path:           "crossplane/vault/\(vlt)"
			repoURL:        "https://github.com/kubernetes-cue-example"
			targetRevision: "HEAD"
			plugin: name: "cue"
		}
	}
}

argocd: application: "\(_cluster)-crossplane-providers": spec: {
	project: "\(_cluster)-crossplane"
	source: {
		path:           "crossplane/providers"
		repoURL:        "https://github.com/kubernetes-cue-example"
		targetRevision: "HEAD"
		plugin: name: "cue"
	}
}
