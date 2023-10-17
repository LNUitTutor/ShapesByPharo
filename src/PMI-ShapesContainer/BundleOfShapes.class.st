Class {
	#name : #BundleOfShapes,
	#superclass : #Object,
	#instVars : [
		'memory'
	],
	#category : #'PMI-ShapesContainer'
}

{ #category : #loading }
BundleOfShapes class >> loadFromCodeFile: pathString [
pathString asFileReference readStreamDo: [ :in | ^ Smalltalk compiler evaluate: in contents ]
]

{ #category : #loading }
BundleOfShapes class >> loadFromStonFile: pathString [
pathString asFileReference readStreamDo: [ :in | ^ (STON reader on: in) next ]
]

{ #category : #services }
BundleOfShapes class >> pickFileAndLoad: pattern [

	| pathString |
	pathString := UIManager default
		              chooseFullFileNameMatching: { pattern }
		              label: 'Choose file to open'.
	pathString ifNil: [ ^ nil ].
	'*.ston' = pattern ifTrue: [ ^ self loadFromStonFile: pathString ].
	'*.stc' = pattern ifTrue: [ ^ self loadFromCodeFile: pathString ].
	^ self error: 'Unknown type of file: ' , pattern
]

{ #category : #adding }
BundleOfShapes >> add: aShape [

	self checkAnObject: aShape.
	^ memory add: aShape
]

{ #category : #adding }
BundleOfShapes >> addAll: aShapeCollection [

	^ memory addAll: (aShapeCollection select: [ :x | x isKindOf: VolumeShape ])
]

{ #category : #adding }
BundleOfShapes >> addFirst: aShape [

	self checkAnObject: aShape.
	^ memory addFirst: aShape
]

{ #category : #accessing }
BundleOfShapes >> at: anIndex [

	^ memory at: anIndex
]

{ #category : #accessing }
BundleOfShapes >> at: anIndex put: aShape [

	self checkAnObject: aShape.
	^ memory at: anIndex put: aShape
]

{ #category : #private }
BundleOfShapes >> checkAnObject: anObject [

	(anObject isKindOf: VolumeShape) ifFalse: [
		^ self error: 'BundleOfShapes contains only VolumeShape instances' ]
]

{ #category : #enumerating }
BundleOfShapes >> do: aBlock [

	memory do: aBlock
]

{ #category : #enumerating }
BundleOfShapes >> greatestShape [

	^ memory inject: (memory at: 1) into: [ :s :x | s max: x ]
]

{ #category : #initialization }
BundleOfShapes >> initialize [

	memory := OrderedCollection new
]

{ #category : #enumerating }
BundleOfShapes >> ofType: aType [

	^ self class new addAll: (memory select: [ :x | x isMemberOf: aType ]); yourself 
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

{ #category : #saving }
BundleOfShapes >> printToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: self printString ]
]

{ #category : #saving }
BundleOfShapes >> saveToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: (STON toString: self) ]
]

{ #category : #accessing }
BundleOfShapes >> size [

	^ memory size
]

{ #category : #saving }
BundleOfShapes >> storeToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: self storeString ]
]

{ #category : #enumerating }
BundleOfShapes >> totalArea [

	^ memory inject: 0 into: [ :s :x | s + x surfaceArea ]
]

{ #category : #enumerating }
BundleOfShapes >> totalVolume [

	^ memory inject: 0 into: [ :s :x | s + x volume ]
]
