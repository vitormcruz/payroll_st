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
 	   baseline: 'Tome' with: [ spec repository: 'github://vitormcruz/tome:v0.1.1/pharo'; loads: #(core) ];
	
		baseline: 'ValidationSensor' with: [ spec repository: 'github://vitormcruz/validation-sensor/pharo'; loads: #(core) ];

		baseline:'Teapot' with: [ spec repository: 'github://zeroflag/Teapot:v2.7.0/source' ];


		package: 'WireUp';		
		package: 'Patterns';
		package: 'Payroll-Core';
		package: 'Payroll-Adapter' with: [ spec requires: #('Teapot') ];
		package: 'Payroll-Config' with: [ spec requires: #('Payroll-Core' 'Payroll-Adapter' 'WireUp' 'Patterns') ];
		package: 'WireUp-Tests' with: [ spec requires: #('WireUp') ];
		package: 'Patterns-Tests' with: [ spec requires: #('Patterns') ];
		
		package: 'Payroll-Tests' with: [ spec requires: #('Payroll-Core' 'Buoy-Tests') ];
		package: 'Payroll-AcceptanceCriteria' with: [ spec requires: #('Payroll-Core' 'Buoy-Tests' 'Tome' 'Payroll-Tests') ];
		
		group: 'default' with: #('dev');
		group: 'core' with: #('Payroll-Config' 'ValidationSensor');
		group: 'test' with: #(core 'Payroll-Tests' 'Payroll-AcceptanceCriteria' 'WireUp-Tests' 'Patterns-Tests');
		group: 'dev' with: #(test)
	].
		

]
