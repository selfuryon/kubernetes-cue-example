package crossplane

_project: "dev-infra"

gcpProvider: projectMetadata: (_project): spec: {
	forProvider: metadata: "ssh-keys": sshKeys
}

let sshKeys = """
	user1:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMqrG0GcokQNZrQSXRFSywOx/sPn2U+2ds2VVwRwCdsl 
	"""
