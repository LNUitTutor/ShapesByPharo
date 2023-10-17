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

{ #category : #'instance creation' }
TriPiramid class >> newByRequest [

	| string stream |
	string := UIManager default
		          request: 'Provide a, b, gamma and h separated by spaces'
		          initialAnswer: '2 2 60 1'
		          title: 'Create a Triangular Piramid'.
	string ifNil: [ ^ nil ].
	stream := string readStream.
	^ self
		  newA: (stream upTo: Character space) asNumber
		  andB: (stream upTo: Character space) asNumber
		  withG: (stream upTo: Character space) asNumber
		  andH: stream upToEnd asNumber
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
