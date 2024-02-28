package gitops

_cluster: string

_defaultSyncOptions: [
	"CreateNamespace=false",
	"PruneLast=true",
	"ApplyOutOfSyncOnly=true",
	"SkipDryRunOnMissingResource=true",
]

_defaultSSASyncOptions: _defaultSyncOptions + ["ServerSideApply=true"]
