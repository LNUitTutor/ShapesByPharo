Class {
	#name : #BundleOfShapesTest,
	#superclass : #TestCase,
	#category : #'PMI-ShapesContainer-Tests'
}

{ #category : #tests }
BundleOfShapesTest >> testAdd [

	| bundle |
	bundle := BundleOfShapes new.
	self assert: bundle size equals: 0.
	bundle
		add: Cone new;
		add: Parallelepiped new.
	self assert: bundle size equals: 2.
	self
		should: [ bundle add: 25 ]
		raise: Error
		description: 'BundleOfShapes contains only VolumeShape instances'.
	self assert: bundle size equals: 2.
]

{ #category : #tests }
BundleOfShapesTest >> testAddFirst [

	| bundle cone para |
	cone := Cone new.
	para := Parallelepiped new.
	bundle := BundleOfShapes new addAll: { Cylinder new . TriPiramid new }; yourself.
	bundle addFirst: cone.
	self assert: (bundle at: 1) equals: cone.
	self assert: (bundle size) equals: 3.
	bundle addFirst: para.
	self assert: (bundle at: 1) equals: para.
	self assert: (bundle size) equals: 4.
	self
		should: [ bundle addFirst: Rect new ]
		raise: Error
		description: 'BundleOfShapes contains only VolumeShape instances'.
	"self assert: (bundle at: 1) equals: Cone new"
]

{ #category : #tests }
BundleOfShapesTest >> testAt [

	| bundle cone para |
	bundle := BundleOfShapes new.
	cone := Cone new.
	para := Parallelepiped new.
	bundle add: cone; add: para.
	self assert: (bundle at: 1) equals: cone.
	self assert: (bundle at: 2) equals: para.
	self should: [ bundle at: 5 ] raise: Error.
	"self assert: (bundle at: 1) equals: Cone new"
]

{ #category : #tests }
BundleOfShapesTest >> testAtPut [

	| bundle cone para |
	cone := Cone new.
	para := Parallelepiped new.
	bundle := BundleOfShapes new addAll: { Cylinder new . TriPiramid new }; yourself.
	self assert: (bundle at: 1 put: cone) equals: cone.
	self assert: (bundle at: 1) equals: cone.
	self assert: (bundle at: 2 put: para) equals: para.
	self should: [ bundle at: 5 put: RectPiramid new] raise: Error.
	self
		should: [ bundle at: 1 put: 2@5 ]
		raise: Error
		description: 'BundleOfShapes contains only VolumeShape instances'.
	"self assert: (bundle at: 1) equals: Cone new"
]

{ #category : #tests }
BundleOfShapesTest >> testGreatestShape [

	| bundle cone para |
	cone := Cone new.
	para := Parallelepiped new.
	bundle := BundleOfShapes new addAll: { Cylinder new . cone . para }; yourself.
	self assert: (bundle size) equals: 3.
	self assert: (bundle greatestShape) equals: para.

]

{ #category : #tests }
BundleOfShapesTest >> testInitialize [

	self assert: BundleOfShapes new size equals: 0
]
