PlanarCoordinates : [Object, Magnitude, Indexable] { | x y |

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	< { :self :anObject |
		self.compareBy(anObject, <)
	}

	<= { :self :anObject |
		self.compareBy(anObject, <=)
	}

	+ { :self :anObject |
		self.applyBinaryOperator(anObject, +)
	}

	- { :self :anObject |
		self.applyBinaryOperator(anObject, -)
	}

	* { :self :anObject |
		self.applyBinaryOperator(anObject, *)
	}

	/ { :self :anObject |
		self.applyBinaryOperator(anObject, /)
	}

	// { :self :anObject |
		self.applyBinaryOperator(anObject, //)
	}

	% { :self :anObject |
		self.applyBinaryOperator(anObject, %)
	}

	abs { :self |
		PlanarCoordinates(self.x.abs, self.y.abs)
	}

	abscissa { :self |
		self.x
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aBlock(PlanarCoordinates(aNumber, aNumber), self)
	}

	applyUnaryOperator { :self :aBlock:/1 |
		PlanarCoordinates(self.x.aBlock, self.y.aBlock)
	}

	applyBinaryOperator { :self :anObject :aBlock:/2 |
		anObject.isPlanarCoordinates.if {
			PlanarCoordinates(aBlock(self.x, anObject.x), aBlock(self.y, anObject.y))
		} {
			anObject.adaptToPlanarCoordinatesAndApply(self, aBlock:/2)
		}
	}

	asList { :self |
		[self.x, self.y]
	}

	asPolarCoordinates { :self |
		PolarCoordinates(self.r, self.theta)
	}

	asRecord { :self |
		(x: self.x, y: self.y)
	}

	asPlanarCoordinates { :self |
		self
	}

	asTuple { :self |
		(self.x, self.y)
	}

	at { :self :index |
		index.caseOfOtherwise([
			1 -> { self.x },
			2 -> { self.y }
		]) {
			self.error('PlanarCoordinates>>at: index out of range')
		}
	}

	atPut { :self :index :value |
		index.caseOfOtherwise([
			1 -> { self.x := value },
			2 -> { self.y := value }
		]) {
			self.error('PlanarCoordinates>>atPut: index out of range')
		}
	}

	compareBy { :self :anObject :aBlock:/2 |
		aBlock(self.x, anObject.x) & {
			aBlock(self.y, anObject.y)
		}
	}

	dimension { :self |
		0
	}

	distance { :self :anObject |
		let dx = anObject.x - self.x;
		let dy = anObject.y - self.y;
		((dx * dx) + (dy * dy)).sqrt
	}

	dotProduct { :self :anObject |
		(self.x * anObject.x) + (self.y * anObject.y)
	}

	embeddingDimension { :self |
		2
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isPlanarCoordinates & {
			aBlock(self.x, anObject.x) & {
				aBlock(self.y, anObject.y)
			}
		}
	}

	first { :self |
		self.x
	}

	inverse { :self :inversionCenter :inversionRadius |
		let x = self.x;
		let y = self.y;
		let x0 = inversionCenter.x;
		let y0 = inversionCenter.y;
		let k = inversionRadius;
		PlanarCoordinates(
			x0 + ((k.squared * (x - x0)) / ((x - x0).squared + (y - y0).squared)),
			y0 + ((k.squared * (y - y0)) / ((x - x0).squared + (y - y0).squared))
		)
	}

	isCloseTo { :self :anObject |
		self.compareBy(anObject, isCloseTo:/2)
	}

	isPlanarCoordinates { :self |
		true
	}

	isZero { :self |
		self.x.isZero & {
			self.y.isZero
		}
	}

	max { :self :anObject |
		self.applyBinaryOperator(anObject, max:/2)
	}

	min { :self :anObject |
		self.applyBinaryOperator(anObject, min:/2)
	}

	negate { :self |
		self.x := self.x.negated;
		self.y := self.x.negated
	}

	negated { :self |
		self.applyUnaryOperator(negated:/1)
	}

	norm { :self |
		(self.x.squared + self.y.squared).sqrt
	}

	normalized { :self |
		self / self.norm
	}

	ordinate { :self |
		self.y
	}

	phi { :self |
		atan2(self.y, self.x)
	}

	r { :self |
		(self.x.squared + self.y.squared).sqrt
	}

	radius { :self |
		self.r
	}

	rho { :self |
		self.r
	}

	second { :self |
		self.y
	}

	size { :self |
		2
	}

	storeString { :self |
		[
			'PlanarCoordinates(',
				self.x.storeString,
				', ',
				self.y.storeString,
			')'
		].stringJoin
	}

	swapInPlace { :self |
		let x = self.x;
		let y = self.y;
		self.x := y;
		self.y := x
	}

	swapped { :self |
		PlanarCoordinates(self.y, self.x)
	}

	theta { :self |
		atan2(self.y, self.x)
	}

	translateBy { :self :delta |
		self + delta
	}

}

+@Number {

	adaptToPlanarCoordinatesAndApply { :self :aPlanarCoordinates :aBlock:/2 |
		aBlock(aPlanarCoordinates, PlanarCoordinates(self, self))
	}

	PlanarCoordinates { :x :y |
		newPlanarCoordinates().initializeSlots(x, y)
	}

}

+[List, Tuple] {

	asPlanarCoordinates { :self |
		self.isMatrix.if {
			self.collect(asPlanarCoordinates:/1)
		} {
			let [x, y] = self;
			PlanarCoordinates(x, y)
		}
	}

	PlanarCoordinates { :x :y |
		y.adaptToCollectionAndApply(x, PlanarCoordinates:/2)
	}

}

+Record {

	asPlanarCoordinates { :self |
		PlanarCoordinates(self::x, self::y)
	}

}

+@Integer {

	circlePoints { :n :r :theta |
		let m = 2.pi / n;
		0.to(n - 1).collect { :i |
			[r, theta + (i * m)].fromPolarCoordinates
		}
	}

	circlePoints { :n :r |
		let theta = (pi / n) - (pi / 2);
		n.circlePoints(r, theta)
	}

}
