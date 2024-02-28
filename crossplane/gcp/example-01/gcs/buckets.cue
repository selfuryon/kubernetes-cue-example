package crossplane

gcpProvider: bucket: "\(_project)-example-01": spec: {
	forProvider: {
		location:                 "EU"
		publicAccessPrevention:   "enforced"
		uniformBucketLevelAccess: true
		forceDestroy:             true
	}
}
