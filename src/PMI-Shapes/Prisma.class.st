Class {
	#name : #Prisma,
	#superclass : #DirectShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #'instance creation' }
Prisma class >> newA: aLength andB: bLength withG: anAngle andH: aHeight [

	^ self basicNew
		  base: (Triangle newA: aLength andB: bLength withG: anAngle);
		  height: aHeight
]

{ #category : #initialization }
Prisma >> initialize [

	height := 1.
	base := Triangle new
]
