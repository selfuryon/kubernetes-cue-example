package apps

import (
	argo_v1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
)

#manifests: argo_v1.#Application
#manifests: {
	spec: {
		destination: {
			name: string
		}
		source: {
			repoURL:        "https://github.com/kubernetes-cue-example"
			targetRevision: *"HEAD" | string
			path:           string
			plugin: name: "cue"
		}
	}
}
