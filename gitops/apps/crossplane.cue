package apps

import (
	"encoding/yaml"
	argo_v1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
)

#crossplane: argo_v1.#Application
#crossplane: spec: {
	destination: {
		name:      string
		namespace: *"crossplane-system" | string
	}
	source: {
		repoURL:        "https://charts.crossplane.io/stable"
		targetRevision: "1.15.0"
		chart:          "crossplane"
		helm: {
			releaseName: *"crossplane" | string
			version:     "v3"
			values:      *yaml.Marshal(_cue_values) | string
			let _cue_values = {
				resourcesCrossplane: limits: {
					cpu:    1
					memory: "2Gi"
				}
				resourcesCrossplane: requests: {
					cpu:    1
					memory: "2Gi"
				}
				resourcesRBACManager: limits: {
					cpu:    0.5
					memory: "1Gi"
				}
				resourcesRBACManager: requests: {
					cpu:    0.5
					memory: "1Gi"
				}
			}
		}
	}
}
