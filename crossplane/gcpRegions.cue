package crossplane

let zone_abc = ["a", "b", "c"]
let zone_abcf = ["a", "b", "c", "f"]
let zone_bcd = ["b", "c", "d"]

#gcpRegions: #gcpRegionsAPAC + #gcpRegionsNA + #gcpRegionsSA + #gcpRegionsEU + #gcpRegionsME
#gcpZones:   #gcpZonesAPAC + #gcpZonesNA + #gcpZonesSA + #gcpZonesEU + #gcpZonesME

// APAC
_gcpAPAC: {
	"asia-east1":           zone_abc
	"asia-east2":           zone_abc
	"asia-northeast1":      zone_abc
	"asia-northeast2":      zone_abc
	"asia-south1":          zone_abc
	"asia-south2":          zone_abc
	"asia-southeast1":      zone_abc
	"asia-southeast2":      zone_abc
	"australia-southeast1": zone_abc
	"australia-southeast2": zone_abc
}

#gcpRegionsAPAC: [for name, _ in _gcpAPAC {name}]
#gcpZonesAPAC: [for name, zones in _gcpAPAC for zone in zones {"\(name)-\(zone)"}]

// North America
_gcpNorthAmerica: {
	"northamerica-northeast1": zone_abc
	"northamerica-northeast2": zone_abc
	"us-central1":             zone_abcf
	"us-east1":                zone_bcd
	"us-east4":                zone_abc
	"us-east5":                zone_abc
	"us-west1":                zone_abc
	"us-west2":                zone_abc
	"us-west3":                zone_abc
	"us-west4":                zone_abc
	"us-south1":               zone_abc
}

#gcpRegionsNA: [for name, _ in _gcpNorthAmerica {name}]
#gcpZonesNA: [for name, zones in _gcpNorthAmerica for zone in zones {"\(name)-\(zone)"}]

//South America
_gcpSouthAmerica: {
	"southamerica-east1": zone_abc
	"southamerica-west1": zone_abc
}

#gcpRegionsSA: [for name, _ in _gcpSouthAmerica {name}]
#gcpZonesSA: [for name, zones in _gcpSouthAmerica for zone in zones {"\(name)-\(zone)"}]

// Europe
_gcpEurope: {
	"europe-north1":     zone_abc
	"europe-central2":   zone_abc
	"europe-southwest1": zone_abc
	"europe-west1":      zone_bcd
	"europe-west2":      zone_abc
	"europe-west3":      zone_abc
	"europe-west4":      zone_abc
	"europe-west6":      zone_abc
	"europe-west8":      zone_abc
	"europe-west9":      zone_abc
	"europe-west12":     zone_abc
}

#gcpRegionsEU: [for name, _ in _gcpEurope {name}]
#gcpZonesEU: [for name, zones in _gcpEurope for zone in zones {"\(name)-\(zone)"}]

// Middle East
_gcpMiddleEast: {
	"me-central1": zone_abc
	"me-west1":    zone_abc
}

#gcpRegionsME: [for name, _ in _gcpMiddleEast {name}]
#gcpZonesME: [for name, zones in _gcpMiddleEast for zone in zones {"\(name)-\(zone)"}]
