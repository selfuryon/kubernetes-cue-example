package crossplane

import (
	"strings"

	crossplane_v1 "github.com/crossplane/crossplane/apis/pkg/v1"
	crossplane_v1beta1 "github.com/crossplane/crossplane/apis/pkg/v1beta1"
)

// Crossplane Provider
crossplane: [TYPE=_]: [ID=_]: {
	apiVersion: *"pkg.crossplane.io/v1" | string
	kind:       *strings.ToTitle(TYPE) | string
	metadata: name: *ID | string
}

// Crossplane
crossplane: close({
	provider: [string]: crossplane_v1.#Provider
	deploymentRuntimeConfig: [string]: crossplane_v1beta1.#DeploymentRuntimeConfig & {
		apiVersion: "pkg.crossplane.io/v1beta1"
	}
})
