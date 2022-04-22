Class {
	#name : #BaselineOfPayroll,
	#superclass : #BaselineOf,
	#category : #BaselineOfPayroll
}

{ #category : #baselines }
BaselineOfPayroll >> baseline: spec [ 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';   
		repository: 'github://vitormcruz/payroll_st';   
		
 	   baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
		project: 'Buoy-Tests' copyFrom: 'Buoy' with: [ spec loads: #('Dependent-SUnit-Extensions') ];
	   baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
								 		 loads: #(core) ];
		
 	   baseline: 'Tome' with: [ spec repository: 'github://vitormcruz/tome:develop/pharo'; loads: #(core) ];
 	   baseline: 'Grease' with: [ spec repository: 'github://SeasideSt/Grease:v1.9.0/repository'; loads: #(core) ];
	
		baseline:'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:v3.4.7/repository' ];
		project:'Seaside-Core' copyFrom: 'Seaside3' with: [ spec loads: #('Core' 'JSON' 'Email' 'Javascript' 'JQuery' 'JQueryUI' 'Zinc' ) ];
		project:'Seaside-Dev' copyFrom: 'Seaside3' with: [ spec loads: #(default) ];

		"MaterialDesignLite must be declared after Seaside3 so that the correct version of Grease (1.7.x) is taken, otherwise, version 1.5.0 is taken"
  	   baseline: 'MaterialDesignLite'	with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.4.1/src'; loads: #(core) ];										

		package: 'WireUp';		
		package: 'Patterns';
		package: 'Payroll-Core';
		package: 'Payroll-Adapter' with: [ spec requires: #('Seaside-Core' 'MaterialDesignLite') ];
		package: 'Payroll-Config' with: [ spec requires: #('Payroll-Core' 'Payroll-Adapter' 'WireUp' 'Patterns' 'Grease') ];
		package: 'WireUp-Tests' with: [ spec requires: #('WireUp') ];
		package: 'Patterns-Tests' with: [ spec requires: #('Patterns') ];
		
		package: 'Payroll-Tests' with: [ spec requires: #('Payroll-Core' 'Buoy-Tests') ];
		package: 'Payroll-AcceptanceCriteria' with: [ spec requires: #('Payroll-Core' 'Buoy-Tests' 'Tome' 'Payroll-Tests') ];
		
		group: 'default' with: #('dev');
		group: 'core' with: #('Payroll-Config');
		group: 'test' with: #(core 'Payroll-Tests' 'Payroll-AcceptanceCriteria' 'WireUp-Tests' 'Patterns-Tests');
		group: 'dev' with: #(test 'Seaside-Dev')
	].
		

]
