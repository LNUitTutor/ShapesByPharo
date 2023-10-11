Class {
	#name : #Cylinder,
	#superclass : #DirectShape,
	#category : #'PMI-Shapes-Volume'
}

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
