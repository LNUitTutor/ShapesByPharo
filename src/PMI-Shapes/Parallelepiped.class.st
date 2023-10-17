Class {
	#name : #Parallelepiped,
	#superclass : #DirectShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #'instance creation' }
Parallelepiped class >> newA: aNumber andB: bNumber andC: cNumber [ 
 	^ self basicNew initWithA: aNumber andB: bNumber andC: cNumber. 
]

{ #category : #'instance creation' }
Parallelepiped class >> newByRequest [

	| string stream |
	string := UIManager default
		          request: 'Provide a, b and c separated by spaces'
		          initialAnswer: '1 2 3'
		          title: 'Create a Parallelepiped'.
	string ifNil: [ ^ nil ].
	stream := string readStream.
	^ self
		  newA: (stream upTo: Character space) asNumber
		  andB: (stream upTo: Character space) asNumber
		  andC: stream upToEnd asNumber
]

{ #category : #accessing }
Parallelepiped >> base: anObject [

	^ self error: 'Can not change the base'
]

{ #category : #initialization }
Parallelepiped >> initWithA: aNumber andB: bNumber andC: cNumber [

	super base: (Rect newA: aNumber andB: bNumber).
	self height: cNumber
]

{ #category : #initialization }
Parallelepiped >> initialize [
	base := Rect new.
	height := 1
]

{ #category : #printing }
Parallelepiped >> myPrintOn: aStream [

	aStream nextPutAll: 'Parallelepiped | '.
	super printOn: aStream.
	aStream nextPutAll: ' |'
]

{ #category : #printing }
Parallelepiped >> storeOn: aStream [

	aStream nextPutAll: '(Parallelepiped newA: '.
	base a storeOn: aStream.
	aStream nextPutAll: ' andB: '.
	base b storeOn: aStream.
	aStream nextPutAll: ' andC: '.
	height storeOn: aStream.aStream nextPut: $)
]
