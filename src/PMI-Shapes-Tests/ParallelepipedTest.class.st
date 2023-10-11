Class {
	#name : #ParallelepipedTest,
	#superclass : #TestCase,
	#category : #'PMI-Shapes-Tests'
}

{ #category : #tests }
ParallelepipedTest >> testBaseArea [

	self assert: Parallelepiped new baseArea equals: Rect new area.
	self
		assert: (Parallelepiped newA: 2 andB: 3 andC: 5) baseArea
		equals: (Rect newA: 2 andB: 3) area
]

{ #category : #tests }
ParallelepipedTest >> testVolume [

	self assert: Parallelepiped new volume equals: 12.
	self
		assert: (Parallelepiped newA: 2 andB: 3 andC: 5) volume
		equals: 30
]
