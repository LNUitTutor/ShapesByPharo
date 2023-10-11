Class {
	#name : #PiramidalShape,
	#superclass : #VolumeShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #printing }
PiramidalShape >> printOn: aStream [

	aStream nextPutAll: self class name , ' / '.
	super printOn: aStream.
	aStream nextPutAll: ' \'
]

{ #category : #calculating }
PiramidalShape >> surfaceArea [
^ self lateralArea + self baseArea 
]

{ #category : #calculating }
PiramidalShape >> volume [

	^ height / 3 * self baseArea
]
