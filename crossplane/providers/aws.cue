package crossplane

let _version = "v1.1.0"

let providers = [
	"s3",
	"iam",
]

// Individual providers
for _provider in providers {
	crossplane: provider: "provider-aws-\(_provider)": spec: {
		package: "xpkg.upbound.io/upbound/provider-aws-\(_provider):\(_version)"
	}
}

// Family provider
crossplane: provider: "upbound-provider-family-aws": spec: {
	package: "xpkg.upbound.io/upbound/provider-family-aws:\(_version)"
}
