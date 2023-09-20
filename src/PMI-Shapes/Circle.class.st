Class {
	#name : #Circle,
	#superclass : #FlatShape,
	#instVars : [
		'r'
	],
	#category : #'PMI-Shapes'
}

{ #category : #calculating }
Circle >> area [ 
^ Float pi * r squared.
]

{ #category : #initialization }
Circle >> initialize [ 
 r := 1
]

{ #category : #calculating }
Circle >> perim [ 
^ 2.0 * Float pi * r
]
