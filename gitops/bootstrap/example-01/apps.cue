package gitops

import (
	"iac.example/gitops/apps"
)

argocd: application: {
	"\(_cluster)-manifests": apps.#manifests
	"\(_cluster)-manifests": spec: source: path: "gitops/clusters/\(_cluster)"

	"\(_cluster)-cilium": apps.#cilium
	"\(_cluster)-cilium": spec: source: helm: #serviceHost: "<!!!>"
	"\(_cluster)-cilium": spec: syncPolicy: syncOptions: _defaultSSASyncOptions

	"\(_cluster)-metrics-server": apps.#metricsServer
}
