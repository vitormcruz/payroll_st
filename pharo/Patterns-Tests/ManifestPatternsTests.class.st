"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPatternsTests,
	#superclass : #PackageManifest,
	#category : #'Patterns-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestPatternsTests class >> ruleAssertEqualSignIntoAssertEqualsV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#EntityPatternTest)) #'2022-03-30T11:44:12.244-03:00') )
]

{ #category : #'code-critics' }
ManifestPatternsTests class >> ruleNotEliminationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#EntityPatternTest #test_equality_with_different_object #false)) #'2022-03-30T11:34:57.61-03:00') #(#(#RGClassDefinition #(#EntityPatternTest)) #'2022-03-30T11:35:08.567-03:00') )
]
