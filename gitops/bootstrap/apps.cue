package gitops

_cluster: string

argocd: application: [_]: {
	metadata: {
		namespace: "argocd"
		labels: kind: "apps"
	}
	spec: {
		project: *_cluster | string
		destination: name: _cluster
		syncPolicy: {
			automated: prune: true
			syncOptions: *_defaultSyncOptions | [...string]
		}
	}
}
