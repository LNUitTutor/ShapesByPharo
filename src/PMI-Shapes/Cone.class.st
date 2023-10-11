Class {
	#name : #Cone,
	#superclass : #PiramidalShape,
	#category : #'PMI-Shapes-Volume'
}

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
