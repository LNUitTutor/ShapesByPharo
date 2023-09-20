"
Абстрактний клас плоских фігур
"
Class {
	#name : #FlatShape,
	#superclass : #Object,
	#category : #'PMI-Shapes'
}

{ #category : #accessing }
FlatShape >> area [
^ self subclassResponsibility 
]

{ #category : #accessing }
FlatShape >> perim [
^ self subclassResponsibility 
]
