"
Abstract class for all volume shapes.
Subclasses can calculate:
- volume
- baseArea
- sideArea
- totalArea
"
Class {
	#name : #VolumeShape,
	#superclass : #Object,
	#instVars : [
		'base',
		'height'
	],
	#category : #'PMI-Shapes-Volume'
}

{ #category : #comparing }
VolumeShape >> > aVolumeShape [ 
	^ self volume > aVolumeShape volume 
]

{ #category : #accessing }
VolumeShape >> base: aFlatShape [ 
	base := aFlatShape 
]

{ #category : #calculating }
VolumeShape >> baseArea [

	^ base area
]

{ #category : #accessing }
VolumeShape >> height: aNumber [ 
	height := aNumber
]

{ #category : #initialization }
VolumeShape >> initialize [ 
self subclassResponsibility 
]

{ #category : #calculating }
VolumeShape >> lateralArea [

	^ self subclassResponsibility
]

{ #category : #accessing }
VolumeShape >> max: aVolumeShape [ 
	^ self > aVolumeShape 
	ifTrue: [ self ] ifFalse: [ aVolumeShape ]
]

{ #category : #printing }
VolumeShape >> printOn: aStream [

	aStream nextPutAll: 'h = '.
	height printOn: aStream.
	aStream nextPutAll: ' on '.
	base printOn: aStream
]

{ #category : #calculating }
VolumeShape >> surfaceArea [

	^ self subclassResponsibility
]

{ #category : #calculating }
VolumeShape >> volume [

	^ self subclassResponsibility
]
