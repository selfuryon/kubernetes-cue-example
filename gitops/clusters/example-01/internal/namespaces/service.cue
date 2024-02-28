package gitops

for v in _serviceNamespaces {
	kube: namespace: "\(v)": metadata: labels: _defaultLabels
}
