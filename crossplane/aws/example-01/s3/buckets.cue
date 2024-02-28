package crossplane

awsProvider: {
  bucket: "\(_project)-example-01": spec: {
    deletionPolicy: "Orphan"
    forProvider: {
      region: "eu-west-2"
      objectLockEnabled: false
    }
  }
  bucketVersioning: "\(_project)-example-01": spec: {
    forProvider: {
      region: "eu-west-2"
      versioningConfiguration: [{status: "Enabled"}]
      bucketRef: name: "\(_project)-example-01"
    }
  }
}
