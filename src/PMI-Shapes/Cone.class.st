Class {
	#name : #Cone,
	#superclass : #PiramidalShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #'instance creation' }
Cone class >> newByRequest [

	| string stream |
	string := UIManager default
		          request: 'Provide r and h separated by space'
		          initialAnswer: '1 1'
		          title: 'Create a Cone'.
	string ifNil: [ ^ nil ].
	stream := string readStream.
	^ self
		  newR: (stream upTo: Character space) asNumber
		  andH: stream upToEnd asNumber
]

{ #category : #'instance creation' }
Cone class >> newR: aRadius andH: aHeight [

	^ self basicNew
		  base: (Circle newR: aRadius);
		  height: aHeight
]

{ #category : #initialization }
Cone >> initialize [

	height := 3.
	base := Circle new
]

{ #category : #calculating }
Cone >> lateralArea [ 
^ Float pi * base r * self slantHeight
]

{ #category : #calculating }
Cone >> slantHeight [

	^ (height squared + base r squared) sqrt
]
