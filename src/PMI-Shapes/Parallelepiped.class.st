Class {
	#name : #Parallelepiped,
	#superclass : #DirectShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #'instance creation' }
Parallelepiped class >> newA: aNumber andB: bNumber andC: cNumber [ 
 	^ self basicNew initWithA: aNumber andB: bNumber andC: cNumber. 
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
