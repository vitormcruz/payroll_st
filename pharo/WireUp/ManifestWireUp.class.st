"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestWireUp,
	#superclass : #PackageManifest,
	#category : #'WireUp-Manifest'
}

{ #category : #'code-critics' }
ManifestWireUp class >> ruleCollectSelectNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Metaclass #findConstructorForWiring #false)) #'2022-01-25T17:45:05.146662-03:00') )
]
