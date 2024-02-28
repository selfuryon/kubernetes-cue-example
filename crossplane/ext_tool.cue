package crossplane

import (
	"encoding/yaml"
	"text/tabwriter"
	"tool/exec"
	"tool/cli"
)

objectSets: [
	crossplane,
	awsProvider,
	gcpProvider,
	vaultProvider,
]

objects: [for sets in objectSets for set in sets for object in set {object}]

command: test: {
	task: kube: exec.Run & {
		cmd:    "kubectl create --dry-run=client -f -"
		stdin:  yaml.MarshalStream(objects)
		stdout: string
	}

	task: display: cli.Print & {
		text: task.kube.stdout
	}
}

command: dump: task: print: cli.Print & {
	text: yaml.MarshalStream(objects)
}

command: ls: task: print: cli.Print & {
	text: tabwriter.Write([
		for x in objects {
			"\(x.kind)  \t\(x.metadata.name)"
		},
	])
}
