Class {
	#name : #PiramidalShape,
	#superclass : #VolumeShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #printing }
PiramidalShape >> printOn: aStream [

	aStream nextPutAll: self class name.
	aStream nextPut: $/.
	super printOn: aStream.
	aStream nextPut: $\
]

{ #category : #calculating }
PiramidalShape >> surfaceArea [
^ self lateralArea + self baseArea 
]

{ #category : #calculating }
PiramidalShape >> volume [

	^ height / 3 * self baseArea
]
