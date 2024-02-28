package gitops

//Service namespaces
_serviceNamespaces: [
	"monitoring-system",
	"vso-system",
]

_defaultLabels: {
	kind: *"service" | "setup"
	type: *"static" | "dynamic"
}

_defaultSetupLabels: _defaultLabels & {
	"pod-security.kubernetes.io/enforce": "privileged"
	"pod-security.kubernetes.io/warn":    "baseline"

	kind: "setup"
}
