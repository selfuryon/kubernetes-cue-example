package apps

import (
	"encoding/yaml"
	argo_v1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
)

#cilium: argo_v1.#Application
#cilium: spec: {
	// TODO: Remove after 1.15.2 release
	// https://github.com/cilium/cilium/pull/30635
	ignoreDifferences: [{
		group: "apps"
		jqPathExpressions: [".spec.template.spec.containers[] | select(.name == \"cilium-agent\").env[] | select(.name == \"GOMEMLIMIT\").valueFrom.resourceFieldRef.divisor"]
		kind:      "DaemonSet"
		name:      "cilium"
		namespace: "kube-system"
	}, {
		kind:  "ConfigMap"
		name:  "hubble-ca-cert"
		jsonPointers: ["/data/ca.crt"]
	}, {
		kind:  "Secret"
		name:  "hubble-relay-client-certs"
		jsonPointers: [
			"/data/ca.crt",
			"/data/tls.crt",
			"/data/tls.key",
		]
	}, {
		kind:  "Secret"
		name:  "hubble-server-certs"
		jsonPointers: [
			"/data/ca.crt",
			"/data/tls.crt",
			"/data/tls.key",
		]
	},{
		kind:  "Secret"
		name:  "cilium-ca"
		jsonPointers: [
			"/data/ca.crt",
			"/data/ca.key",
		]
	}]
	destination: {
		name:      string
		namespace: *"kube-system" | string
	}
	source: {
		repoURL:        "https://helm.cilium.io/"
		targetRevision: *"1.15.1" | string
		chart:          "cilium"
		helm: {
			releaseName: *"cilium" | string
			version:     "v3"

			#serviceHost: string
			#servicePort: *443 | int
			#mtu:         *1420 | int

			values: *yaml.Marshal(_cue_values) | string
			let _cue_values = {
				ipam: mode: "kubernetes"
				kubeProxyReplacement: true
				securityContext: capabilities: {
					ciliumAgent: ["CHOWN", "KILL", "NET_ADMIN", "NET_RAW", "IPC_LOCK", "SYS_ADMIN", "SYS_RESOURCE", "DAC_OVERRIDE", "FOWNER", "SETGID", "SETUID"]
					cleanCiliumState: ["NET_ADMIN", "SYS_ADMIN", "SYS_RESOURCE"]
				}
				cgroup: {
					autoMount: enabled: false
					hostRoot: "/sys/fs/cgroup"
				}
				k8sServiceHost: #serviceHost
				k8sServicePort: #servicePort
				hostFirewall: enabled: true
				// Do not enable this yet. Cilium-agent tries to enable XDP on Kubespan (Wireguard) interface and fails to start.
				loadBalancer: acceleration: "disabled"
				// Hybrid mode doesn't work with VXLAN tunnels
				// loadBalancer: mode: "hybrid"
				bpf: hostLegacyRouting: false
				bpf: masquerade:        true
				hubble: {
					ui: enabled:    true
					relay: enabled: true
				}
				MTU: #mtu
			}
		}
	}
}
