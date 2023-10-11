Class {
	#name : #TriPiramid,
	#superclass : #PiramidalShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #'instance creation' }
TriPiramid class >> newA: aLength andB: bLength withG: anAngle andH: aHeight [

	^ self basicNew
		  base: (Triangle newA: aLength andB: bLength withG: anAngle);
		  height: aHeight
]

{ #category : #initialization }
TriPiramid >> initialize [

	height := 3.
	base := Triangle new
]

{ #category : #calculating }
TriPiramid >> lateralArea [

	^ base perim * self slantHeight / 2
]

{ #category : #calculating }
TriPiramid >> slantHeight [ 
^ (base inRadius squared + height squared) sqrt
]
