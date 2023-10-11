Class {
	#name : #BundleOfShapes,
	#superclass : #Object,
	#instVars : [
		'memory'
	],
	#category : #'PMI-ShapesContainer'
}

{ #category : #adding }
BundleOfShapes >> add: aShape [

	(aShape isKindOf: VolumeShape) ifFalse:
		[self error: 'BundleOfShapes contains only VolumeShape instances'].
	memory add: aShape
]

{ #category : #initialization }
BundleOfShapes >> initialize [

	memory := OrderedCollection new
]

{ #category : #printing }
BundleOfShapes >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $:;
		nextPut: Character cr.
	memory do: [ :aShape |
		aStream nextPutAll: ' - '.
		aShape printOn: aStream.
		aStream nextPut: Character cr ]
]
