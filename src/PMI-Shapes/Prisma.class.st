Class {
	#name : #Prisma,
	#superclass : #DirectShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #'instance creation' }
Prisma class >> newA: aLength andB: bLength withG: anAngle andH: aHeight [

	^ self basicNew
		  base: (Triangle newA: aLength andB: bLength withG: anAngle);
		  height: aHeight
]

{ #category : #'instance creation' }
Prisma class >> newByRequest [

	| string stream |
	string := UIManager default
		          request: 'Provide a, b, gamma and h separated by spaces'
		          initialAnswer: '2 2 60 1'
		          title: 'Create a Prisma'.
	string ifNil: [ ^ nil ].
	stream := string readStream.
	^ self
		  newA: (stream upTo: Character space) asNumber
		  andB: (stream upTo: Character space) asNumber
		  withG: (stream upTo: Character space) asNumber
		  andH: stream upToEnd asNumber
]

{ #category : #initialization }
Prisma >> initialize [

	height := 1.
	base := Triangle new
]

{ #category : #printing }
Prisma >> storeOn: aStream [

	aStream nextPutAll: '(Prisma newA: '.
	base a storeOn: aStream.
	aStream nextPutAll: ' andB: '.
	base b storeOn: aStream.
	aStream nextPutAll: ' withG: '.
	base gamma storeOn: aStream.
	aStream nextPutAll: ' andH: '.
	height storeOn: aStream.
	aStream nextPut: $)
]
