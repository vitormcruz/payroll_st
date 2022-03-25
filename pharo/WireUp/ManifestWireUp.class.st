"
WireUp core package.

For usage, see `WupWiringContext` comment section
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
