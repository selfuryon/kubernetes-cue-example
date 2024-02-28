package gitops

argocd: appProject: [ID=string]: {
	metadata: namespace: "argocd"
	spec: {
		description: *"\(_cluster) cluster configuration" | string
		sourceRepos: *["*"] | [string]
		destinations: [{
			namespace: "*"
			name:      *ID | string
		}]

		clusterResourceWhitelist: [{
			group: "*"
			kind:  "*"
		}]

		namespaceResourceWhitelist: [{
			group: "*"
			kind:  "*"
		}]

		orphanedResources: warn: false
	}
}
