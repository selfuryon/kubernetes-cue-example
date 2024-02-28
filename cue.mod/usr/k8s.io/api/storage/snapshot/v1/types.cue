package v1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#VolumeSnapshotClass: {
    metav1.#TypeMeta
    apiVersion: "\(#GroupName)/v1"
    kind: "VolumeSnapshotClass"
    metadata?: metav1.#ObjectMeta @go(ObjectMeta) @protobuf(1,bytes,opt)
    driver: string
    parameters?: [string]: string
    deletionPolicy: "Retain" | "Delete"
}
