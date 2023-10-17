Class {
	#name : #Cylinder,
	#superclass : #DirectShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #'instance creation' }
Cylinder class >> newByRequest [

	| string stream |
	string := UIManager default
		          request: 'Provide r and h separated by space'
		          initialAnswer: '1 1'
		          title: 'Create a Cylinder'.
	string ifNil: [ ^ nil ].
	stream := string readStream.
	^ self
		  newR: (stream upTo: Character space) asNumber
		  andH: stream upToEnd asNumber
]

{ #category : #'instance creation' }
Cylinder class >> newR: aRadius andH: aHeight [

	^ self basicNew
		  base: (Circle newR: aRadius);
		  height: aHeight
]

{ #category : #initialization }
Cylinder >> initialize [

	base := Circle new.
	height := 1
]

{ #category : #printing }
Cylinder >> myPrintOn: aStream [

	aStream nextPutAll: 'Cylinder | h = '.
	height printOn: aStream.
	aStream nextPutAll: ' on '.
	base printOn: aStream.
	aStream nextPut: Character space; nextPut: $|
]

{ #category : #printing }
Cylinder >> storeOn: aStream [

	aStream nextPutAll: '(Cylinder newR: '.
	base r storeOn: aStream.
	aStream nextPutAll: ' andH: '.
	height storeOn: aStream.
	aStream nextPut: $)
]
