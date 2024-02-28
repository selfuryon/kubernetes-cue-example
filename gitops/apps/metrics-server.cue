package apps

import (
	argo_v1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
)

#metricsServer: argo_v1.#Application
#metricsServer: spec: {
	destination: {
		name:      string
		namespace: *"kube-system" | string
	}
	source: {
		repoURL:        "https://kubernetes-sigs.github.io/metrics-server"
		targetRevision: *"3.12.0" | string
		chart:          "metrics-server"
		helm: {
			releaseName: *"metrics-server" | string
			version:     "v3"
			valuesObject: {
				args: ["--kubelet-insecure-tls"]
				serviceMonitor: enabled: true
			}
		}
	}
}
