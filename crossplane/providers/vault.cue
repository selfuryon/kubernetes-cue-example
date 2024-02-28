package crossplane

crossplane: provider: "provider-vault": spec: {
	package: "xpkg.upbound.io/upbound/provider-vault:v0.4.0"
	runtimeConfigRef: name: "provider-vault"
}

crossplane: deploymentRuntimeConfig: "provider-vault": spec: {
	serviceAccountTemplate: metadata: {
		name: "provider-vault"
		annotations: "iam.gke.io/gcp-service-account": "crossplane@<!!!>.iam.gserviceaccount.com"
	}
	deploymentTemplate: spec: {
		selector: {}
		template: spec: {
			serviceAccount: "provider-vault"
			containers: [{
				name: "package-runtime"
				resources: requests: cpu:    1
				resources: requests: memory: "4Gi"
				resources: limits: cpu:      1
				resources: limits: memory:   "4Gi"
			}]

		}
	}
}
