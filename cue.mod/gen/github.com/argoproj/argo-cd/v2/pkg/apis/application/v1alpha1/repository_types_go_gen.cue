// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1

package v1alpha1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// RepoCreds holds the definition for repository credentials
#RepoCreds: {
	// URL is the URL that this credentials matches to
	url: string @go(URL) @protobuf(1,bytes,opt)

	// Username for authenticating at the repo server
	username?: string @go(Username) @protobuf(2,bytes,opt)

	// Password for authenticating at the repo server
	password?: string @go(Password) @protobuf(3,bytes,opt)

	// SSHPrivateKey contains the private key data for authenticating at the repo server using SSH (only Git repos)
	sshPrivateKey?: string @go(SSHPrivateKey) @protobuf(4,bytes,opt)

	// TLSClientCertData specifies the TLS client cert data for authenticating at the repo server
	tlsClientCertData?: string @go(TLSClientCertData) @protobuf(5,bytes,opt)

	// TLSClientCertKey specifies the TLS client cert key for authenticating at the repo server
	tlsClientCertKey?: string @go(TLSClientCertKey) @protobuf(6,bytes,opt)

	// GithubAppPrivateKey specifies the private key PEM data for authentication via GitHub app
	githubAppPrivateKey?: string @go(GithubAppPrivateKey) @protobuf(7,bytes,opt)

	// GithubAppId specifies the Github App ID of the app used to access the repo for GitHub app authentication
	githubAppID?: int64 @go(GithubAppId) @protobuf(8,bytes,opt)

	// GithubAppInstallationId specifies the ID of the installed GitHub App for GitHub app authentication
	githubAppInstallationID?: int64 @go(GithubAppInstallationId) @protobuf(9,bytes,opt)

	// GithubAppEnterpriseBaseURL specifies the GitHub API URL for GitHub app authentication. If empty will default to https://api.github.com
	githubAppEnterpriseBaseUrl?: string @go(GitHubAppEnterpriseBaseURL) @protobuf(10,bytes,opt)

	// EnableOCI specifies whether helm-oci support should be enabled for this repo
	enableOCI?: bool @go(EnableOCI) @protobuf(11,bytes,opt)

	// Type specifies the type of the repoCreds. Can be either "git" or "helm. "git" is assumed if empty or absent.
	type?: string @go(Type) @protobuf(12,bytes,opt)

	// GCPServiceAccountKey specifies the service account key in JSON format to be used for getting credentials to Google Cloud Source repos
	gcpServiceAccountKey?: string @go(GCPServiceAccountKey) @protobuf(13,bytes,opt)

	// Proxy specifies the HTTP/HTTPS proxy used to access repos at the repo server
	proxy?: string @go(Proxy) @protobuf(19,bytes,opt)

	// ForceHttpBasicAuth specifies whether Argo CD should attempt to force basic auth for HTTP connections
	forceHttpBasicAuth?: bool @go(ForceHttpBasicAuth) @protobuf(20,bytes,opt)
}

// Repository is a repository holding application configurations
#Repository: {
	// Repo contains the URL to the remote repository
	repo: string @go(Repo) @protobuf(1,bytes,opt)

	// Username contains the user name used for authenticating at the remote repository
	username?: string @go(Username) @protobuf(2,bytes,opt)

	// Password contains the password or PAT used for authenticating at the remote repository
	password?: string @go(Password) @protobuf(3,bytes,opt)

	// SSHPrivateKey contains the PEM data for authenticating at the repo server. Only used with Git repos.
	sshPrivateKey?: string @go(SSHPrivateKey) @protobuf(4,bytes,opt)

	// ConnectionState contains information about the current state of connection to the repository server
	connectionState?: #ConnectionState @go(ConnectionState) @protobuf(5,bytes,opt)

	// InsecureIgnoreHostKey should not be used anymore, Insecure is favoured
	// Used only for Git repos
	insecureIgnoreHostKey?: bool @go(InsecureIgnoreHostKey) @protobuf(6,bytes,opt)

	// Insecure specifies whether the connection to the repository ignores any errors when verifying TLS certificates or SSH host keys
	insecure?: bool @go(Insecure) @protobuf(7,bytes,opt)

	// EnableLFS specifies whether git-lfs support should be enabled for this repo. Only valid for Git repositories.
	enableLfs?: bool @go(EnableLFS) @protobuf(8,bytes,opt)

	// TLSClientCertData contains a certificate in PEM format for authenticating at the repo server
	tlsClientCertData?: string @go(TLSClientCertData) @protobuf(9,bytes,opt)

	// TLSClientCertKey contains a private key in PEM format for authenticating at the repo server
	tlsClientCertKey?: string @go(TLSClientCertKey) @protobuf(10,bytes,opt)

	// Type specifies the type of the repo. Can be either "git" or "helm. "git" is assumed if empty or absent.
	type?: string @go(Type) @protobuf(11,bytes,opt)

	// Name specifies a name to be used for this repo. Only used with Helm repos
	name?: string @go(Name) @protobuf(12,bytes,opt)

	// Whether credentials were inherited from a credential set
	inheritedCreds?: bool @go(InheritedCreds) @protobuf(13,bytes,opt)

	// EnableOCI specifies whether helm-oci support should be enabled for this repo
	enableOCI?: bool @go(EnableOCI) @protobuf(14,bytes,opt)

	// Github App Private Key PEM data
	githubAppPrivateKey?: string @go(GithubAppPrivateKey) @protobuf(15,bytes,opt)

	// GithubAppId specifies the ID of the GitHub app used to access the repo
	githubAppID?: int64 @go(GithubAppId) @protobuf(16,bytes,opt)

	// GithubAppInstallationId specifies the installation ID of the GitHub App used to access the repo
	githubAppInstallationID?: int64 @go(GithubAppInstallationId) @protobuf(17,bytes,opt)

	// GithubAppEnterpriseBaseURL specifies the base URL of GitHub Enterprise installation. If empty will default to https://api.github.com
	githubAppEnterpriseBaseUrl?: string @go(GitHubAppEnterpriseBaseURL) @protobuf(18,bytes,opt)

	// Proxy specifies the HTTP/HTTPS proxy used to access the repo
	proxy?: string @go(Proxy) @protobuf(19,bytes,opt)

	// Reference between project and repository that allow you automatically to be added as item inside SourceRepos project entity
	project?: string @go(Project) @protobuf(20,bytes,opt)

	// GCPServiceAccountKey specifies the service account key in JSON format to be used for getting credentials to Google Cloud Source repos
	gcpServiceAccountKey?: string @go(GCPServiceAccountKey) @protobuf(21,bytes,opt)

	// ForceHttpBasicAuth specifies whether Argo CD should attempt to force basic auth for HTTP connections
	forceHttpBasicAuth?: bool @go(ForceHttpBasicAuth) @protobuf(22,bytes,opt)
}

// Repositories defines a list of Repository configurations
#Repositories: [...null | #Repository]

// RepositoryList is a collection of Repositories.
#RepositoryList: {
	metadata?: metav1.#ListMeta @go(ListMeta) @protobuf(1,bytes,opt)
	items:     #Repositories    @go(Items) @protobuf(2,bytes,rep)
}

// RepositoryList is a collection of Repositories.
#RepoCredsList: {
	metadata?: metav1.#ListMeta @go(ListMeta) @protobuf(1,bytes,opt)
	items: [...#RepoCreds] @go(Items,[]RepoCreds) @protobuf(2,bytes,rep)
}

// A RepositoryCertificate is either SSH known hosts entry or TLS certificate
#RepositoryCertificate: {
	// ServerName specifies the DNS name of the server this certificate is intended for
	serverName: string @go(ServerName) @protobuf(1,bytes,opt)

	// CertType specifies the type of the certificate - currently one of "https" or "ssh"
	certType: string @go(CertType) @protobuf(2,bytes,opt)

	// CertSubType specifies the sub type of the cert, i.e. "ssh-rsa"
	certSubType: string @go(CertSubType) @protobuf(3,bytes,opt)

	// CertData contains the actual certificate data, dependent on the certificate type
	certData: bytes @go(CertData,[]byte) @protobuf(4,bytes,opt)

	// CertInfo will hold additional certificate info, depdendent on the certificate type (e.g. SSH fingerprint, X509 CommonName)
	certInfo: string @go(CertInfo) @protobuf(5,bytes,opt)
}

// RepositoryCertificateList is a collection of RepositoryCertificates
#RepositoryCertificateList: {
	metadata?: metav1.#ListMeta @go(ListMeta) @protobuf(1,bytes,opt)

	// List of certificates to be processed
	items: [...#RepositoryCertificate] @go(Items,[]RepositoryCertificate) @protobuf(2,bytes,rep)
}

// GnuPGPublicKey is a representation of a GnuPG public key
#GnuPGPublicKey: {
	// KeyID specifies the key ID, in hexadecimal string format
	keyID: string @go(KeyID) @protobuf(1,bytes,opt)

	// Fingerprint is the fingerprint of the key
	fingerprint?: string @go(Fingerprint) @protobuf(2,bytes,opt)

	// Owner holds the owner identification, e.g. a name and e-mail address
	owner?: string @go(Owner) @protobuf(3,bytes,opt)

	// Trust holds the level of trust assigned to this key
	trust?: string @go(Trust) @protobuf(4,bytes,opt)

	// SubType holds the key's sub type (e.g. rsa4096)
	subType?: string @go(SubType) @protobuf(5,bytes,opt)

	// KeyData holds the raw key data, in base64 encoded format
	keyData?: string @go(KeyData) @protobuf(6,bytes,opt)
}

// GnuPGPublicKeyList is a collection of GnuPGPublicKey objects
#GnuPGPublicKeyList: {
	metadata?: metav1.#ListMeta @go(ListMeta) @protobuf(1,bytes,opt)
	items: [...#GnuPGPublicKey] @go(Items,[]GnuPGPublicKey) @protobuf(2,bytes,rep)
}
