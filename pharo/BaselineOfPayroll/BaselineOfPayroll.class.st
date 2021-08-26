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
	
		baseline:'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:v3.4.5/repository' ];
		
  	   baseline: 'MaterialDesignLite'	with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.2.4/src'; loads: #(core) ];
		
		project:'Seaside-Core' copyFrom: 'Seaside3' with: [ spec loads: #('Core' 'JSON' 'Email' 'Javascript' 'JQuery' 'JQueryUI' ) ];
		project:'Seaside-Dev' copyFrom: 'Seaside3' with: [ spec loads: #(default) ];
										
		
 	   baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
											 		 loads: #(core) ];
												
		package: 'Payroll-Core';
		package: 'Payroll-Tests' with: [ spec requires: #('Payroll-Core' 'Buoy-Tests') ];												
		package: 'Payroll-AcceptanceCriteria' with: [ spec requires: #('Payroll-Core' 'Buoy-Tests') ];
		
		group: 'default' with: #('dev');
		group: 'core' with: #('Payroll-Core' 'Seaside-Core' 'MaterialDesignLite');
		group: 'dev' with: #(core 'Seaside-Dev' 'Payroll-Tests' 'Payroll-AcceptanceCriteria')
	].
		

]
