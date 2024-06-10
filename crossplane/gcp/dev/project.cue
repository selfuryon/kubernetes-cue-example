package crossplane

_project: "example-01"

gcpProvider: projectMetadata: (_project): spec: {
	forProvider: metadata: "ssh-keys": sshKeys
}

let sshKeys = """
	example:ssh-ed25519 <!!!>
	"""
