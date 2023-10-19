Class {
	#name : #BaselineOfShapesByPharo,
	#superclass : #BaselineOf,
	#category : #BaselineOfShapesByPharo
}

{ #category : #baselines }
BaselineOfShapesByPharo >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			package: 'PMI-Shapes';
			package: 'PMI-Shapes-Tests' with: [ spec requires: #( 'PMI-Shapes' ) ];
			package: 'PMI-ShapesContainer' with: [ spec requires: #( 'PMI-Shapes' ) ];
			package: 'PMI-ShapesContainer-Tests' with: [ spec requires: #( 'PMI-ShapesContainer' ) ]
		].
]

{ #category : #accessing }
BaselineOfShapesByPharo >> projectClass [
	^ MetacelloCypressBaselineProject
]
