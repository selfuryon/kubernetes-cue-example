package crossplane

import (
	"strings"
	aws_provider_v1beta1 "github.com/upbound/provider-aws/apis/v1beta1"
	aws_s3_v1beta1 "github.com/upbound/provider-aws/apis/s3/v1beta1"
	aws_iam_v1beta1 "github.com/upbound/provider-aws/apis/iam/v1beta1"
)

awsProvider: [TYPE=_]: [ID=_]: {
	apiVersion: *"iam.aws.upbound.io/v1beta1" | string
	kind:       *strings.ToTitle(TYPE) | string
	metadata: name:      *ID | string
	metadata: namespace: _crossplaneNS
	if TYPE != "providerConfig" {
		spec: providerConfigRef: name: _project
	}
}

// AWS Provider
awsProvider: close({
	providerConfig: [string]: aws_provider_v1beta1.#ProviderConfig & {
		apiVersion: "aws.upbound.io/v1beta1"
	}
	bucket: [string]: aws_s3_v1beta1.#Bucket & {
		apiVersion: "s3.aws.upbound.io/v1beta1"
	}
	bucketVersioning: [string]: aws_s3_v1beta1.#BucketVersioning & {
		apiVersion: "s3.aws.upbound.io/v1beta1"
	}
	group: [ID=_]: aws_iam_v1beta1.#Group & {
		metadata: annotations: _annotations & {
			"crossplane.io/external-name": strings.TrimPrefix(ID, "\(_project)-")
		}
	}
	groupPolicyAttachment: [string]: aws_iam_v1beta1.#GroupPolicyAttachment
	user: [ID=_]: aws_iam_v1beta1.#User & {
		metadata: annotations: _annotations & {
			"crossplane.io/external-name": strings.TrimPrefix(ID, "\(_project)-")
		}
	}
	userGroupMembership: [string]: aws_iam_v1beta1.#UserGroupMembership
	accessKey: [string]:           aws_iam_v1beta1.#AccessKey
})
