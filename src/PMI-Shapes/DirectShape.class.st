"
Abstract base class for Cylinder, Parallelepiped and Prizm
"
Class {
	#name : #DirectShape,
	#superclass : #VolumeShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #calculating }
DirectShape >> lateralArea [ 

	^ height * base perim
]

{ #category : #printing }
DirectShape >> printOn: aStream [

	aStream nextPutAll: self class name.
	aStream nextPut: $|.
	super printOn: aStream.
	aStream nextPut: $|
]

{ #category : #calculating }
DirectShape >> surfaceArea [

	^ 2 * self baseArea + self lateralArea
]

{ #category : #calculating }
DirectShape >> volume [

	^ height  * self baseArea
]
