package crossplane

let _version = "v0.41.2"

let providers = [
	"compute",
	"storage",
]

// Individual providers
for _provider in providers {
	crossplane: provider: "provider-gcp-\(_provider)": spec: {
		package: "xpkg.upbound.io/upbound/provider-gcp-\(_provider):\(_version)"
		runtimeConfigRef: name: "provider-gcp"
	}
}

// Family provider
crossplane: provider: "upbound-provider-family-gcp": spec: {
	package: "xpkg.upbound.io/upbound/provider-family-gcp:\(_version)"
	runtimeConfigRef: name: "provider-gcp"
}

// Deployment Runtime Config
crossplane: deploymentRuntimeConfig: "provider-gcp": spec: {
	serviceAccountTemplate: metadata: {
		name: "provider-gcp"
		annotations: "iam.gke.io/gcp-service-account": "crossplane@dev-infra.iam.gserviceaccount.com"
	}
	deploymentTemplate: spec: {
		selector: {}
		template: spec: serviceAccount: "provider-gcp"
	}
}
