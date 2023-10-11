Class {
	#name : #RectPiramid,
	#superclass : #PiramidalShape,
	#category : #'PMI-Shapes-Volume'
}

{ #category : #'instance creation' }
RectPiramid class >> newA: aNumber andB: bNumber andH: aHeight [

	^ self basicNew
		  base: (Rect newA: aNumber andB: bNumber);
		  height: aHeight
]

{ #category : #initialization }
RectPiramid >> initialize [

	height := 3.
	base := Rect new
]

{ #category : #calculating }
RectPiramid >> lateralArea [
	"^ (base a * self slantHeightA) + (base b * self slantHeightB)"

	| a b hA hB h2 |
	a := base a.
	b := base b.
	h2 := height squared.
	hA := ((b / 2) squared + h2) sqrt.
	hB := ((a / 2) squared + h2) sqrt.
	^ a * hA + (b * hB)
]
