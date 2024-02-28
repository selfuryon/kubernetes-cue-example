package crossplane

import "encoding/json"

let _pName = "admin"

vaultProvider: {
	policy: "\(_vault)-\(_pName)": spec: {
		forProvider: {
			name:   (_pName)
			policy: json.Marshal(_conf)
			let _conf = {
				path: {
					"+/config": capabilities: ["create", "read", "update", "delete", "list", "sudo"]
					"sys/auth": capabilities: ["read"]
          // Other policies
				}
			}
		}
	}
}
