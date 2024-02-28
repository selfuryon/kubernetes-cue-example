package crossplane

import (
	"strings"
	gcp_provider_v1beta1 "github.com/upbound/provider-gcp/apis/v1beta1"
	gcp_artifact_v1beta1 "github.com/upbound/provider-gcp/apis/artifact/v1beta1"
	gcp_cloudplatform_v1beta1 "github.com/upbound/provider-gcp/apis/cloudplatform/v1beta1"
	gcp_compute_v1beta1 "github.com/upbound/provider-gcp/apis/compute/v1beta1"
	gcp_container_v1beta1 "github.com/upbound/provider-gcp/apis/container/v1beta1"
	gcp_kms_v1beta1 "github.com/upbound/provider-gcp/apis/kms/v1beta1"
	gcp_secretmanager_v1beta1 "github.com/upbound/provider-gcp/apis/secretmanager/v1beta1"
	gcp_servicenetworking_v1beta1 "github.com/upbound/provider-gcp/apis/servicenetworking/v1beta1"
	gcp_sql_v1beta1 "github.com/upbound/provider-gcp/apis/sql/v1beta1"
	gcp_storage_v1beta1 "github.com/upbound/provider-gcp/apis/storage/v1beta1"
)

// GCP Crossplane Provider
// Some commonly used defaults are filled
gcpProvider: [TYPE=_]: [ID=_]: {
	apiVersion: *"compute.gcp.upbound.io/v1beta1" | string
	kind:       *strings.ToTitle(TYPE) | string
	metadata: name:      *ID | string
	metadata: namespace: _crossplaneNS
	metadata: {
		annotations?:   _
		_annotationSet: "default" | *"external" | "custom" | "empty"
		if _annotationSet == "default" {
			annotations: _annotations
		}
		if _annotationSet == "external" {
			annotations: _annotations & {
				"crossplane.io/external-name": strings.TrimPrefix(ID, "\(_project)-")
			}
		}
	}
	if TYPE != "providerConfig" {
		spec: providerConfigRef: name: _project
	}
}

// GCP Provider
gcpProvider: close({
	providerConfig: [string]: gcp_provider_v1beta1.#ProviderConfig & {
		apiVersion: "gcp.upbound.io/v1beta1"
		metadata: _annotationSet: "empty"
	}
	cluster: [string]: gcp_container_v1beta1.#Cluster & {
		apiVersion: "container.gcp.upbound.io/v1beta1"
		spec: forProvider: location: or(#gcpRegions)
	}
	projectMetadata: [string]: gcp_compute_v1beta1.#ProjectMetadata & {
		metadata: _annotationSet: "default"
	}
	firewall: [string]:       gcp_compute_v1beta1.#Firewall
	securityPolicy: [string]: gcp_compute_v1beta1.#SecurityPolicy
	instanceGroup: [string]:  gcp_compute_v1beta1.#InstanceGroup
	healthCheck: [string]:    gcp_compute_v1beta1.#HealthCheck
	backendService: [string]: gcp_compute_v1beta1.#BackendService
	network: [string]:        gcp_compute_v1beta1.#Network
	subnetwork: [string]:     gcp_compute_v1beta1.#Subnetwork
	router: [string]:         gcp_compute_v1beta1.#Router
	routerNAT: [string]: gcp_compute_v1beta1.#RouterNAT & {
		spec: forProvider: region: or(#gcpRegions)
	}
	targetTCPProxy: [string]:       gcp_compute_v1beta1.#TargetTCPProxy
	globalForwardingRule: [string]: gcp_compute_v1beta1.#GlobalForwardingRule
	globalAddress: [string]:        gcp_compute_v1beta1.#GlobalAddress
	instance: [string]: gcp_compute_v1beta1.#Instance & {
		spec: forProvider: zone: or(#gcpZones)
	}
	disk: [string]: gcp_compute_v1beta1.#Disk & {
		spec: forProvider: zone: or(#gcpZones)
	}
	image: [string]: gcp_compute_v1beta1.#Image
	serviceAccount: [string]: gcp_cloudplatform_v1beta1.#ServiceAccount & {
		apiVersion: "cloudplatform.gcp.upbound.io/v1beta1"
	}
	projectIAMMember: [string]: gcp_cloudplatform_v1beta1.#ProjectIAMMember & {
		apiVersion: "cloudplatform.gcp.upbound.io/v1beta1"
		metadata: _annotationSet: "default"
	}
	serviceAccountIAMMember: [string]: gcp_cloudplatform_v1beta1.#ServiceAccountIAMMember & {
		apiVersion: "cloudplatform.gcp.upbound.io/v1beta1"
		metadata: _annotationSet: "default"
	}
	projectService: [string]: gcp_cloudplatform_v1beta1.#ProjectService & {
		apiVersion: "cloudplatform.gcp.upbound.io/v1beta1"
		metadata: _annotationSet: "empty"
	}
	registryRepository: [string]: gcp_artifact_v1beta1.#RegistryRepository & {
		apiVersion: "artifact.gcp.upbound.io/v1beta1"
	}
	bucket: [string]: gcp_storage_v1beta1.#Bucket & {
		apiVersion: "storage.gcp.upbound.io/v1beta1"
		metadata: _annotationSet: "empty"
	}
	databaseInstance: [string]: gcp_sql_v1beta1.#DatabaseInstance & {
		apiVersion: "sql.gcp.upbound.io/v1beta1"
	}
	database: [string]: gcp_sql_v1beta1.#Database & {
		apiVersion: "sql.gcp.upbound.io/v1beta1"
	}
	databaseUser: [string]: gcp_sql_v1beta1.#User & {
		apiVersion: "sql.gcp.upbound.io/v1beta1"
	}
	connection: [string]: gcp_servicenetworking_v1beta1.#Connection & {
		apiVersion: "servicenetworking.gcp.upbound.io/v1beta1"
		metadata: _annotationSet: "empty"
	}
	keyRing: [string]: gcp_kms_v1beta1.#KeyRing & {
		apiVersion: "kms.gcp.upbound.io/v1beta1"
	}
	cryptoKey: [string]: gcp_kms_v1beta1.#CryptoKey & {
		apiVersion: "kms.gcp.upbound.io/v1beta1"
	}
	keyRingIAMMember: [string]: gcp_kms_v1beta1.#KeyRingIAMMember & {
		apiVersion: "kms.gcp.upbound.io/v1beta1"
		metadata: _annotationSet: "empty"
	}
	secretIAMMember: [string]: gcp_secretmanager_v1beta1.#SecretIAMMember & {
		apiVersion: "secretmanager.gcp.upbound.io/v1beta1"
		metadata: _annotationSet: "empty"
	}
})
