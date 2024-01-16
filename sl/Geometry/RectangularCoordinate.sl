RectangularCoordinate : [Object, Magnitude, Indexable] { | x y |

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
		RectangularCoordinate(self.x.abs, self.y.abs)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aBlock(RectangularCoordinate(aNumber, aNumber), self)
	}

	applyUnaryOperator { :self :aBlock:/1 |
		RectangularCoordinate(self.x.aBlock, self.y.aBlock)
	}

	applyBinaryOperator { :self :anObject :aBlock:/2 |
		anObject.isRectangularCoordinate.if {
			RectangularCoordinate(aBlock(self.x, anObject.x), aBlock(self.y, anObject.y))
		} {
			anObject.adaptToRectangularCoordinateAndApply(self, aBlock:/2)
		}
	}

	asArray { :self |
		[self.x, self.y]
	}

	asPolarCoordinate { :self |
		PolarCoordinate(self.r, self.theta)
	}

	asRecord { :self |
		(x: self.x, y: self.y)
	}

	asTuple { :self |
		(self.x, self.y)
	}

	at { :self :index |
		index.caseOfOtherwise([
			1 -> { self.x },
			2 -> { self.y }
		]) {
			self.error('RectangularCoordinate>>at: index out of range')
		}
	}

	atPut { :self :index :value |
		index.caseOfOtherwise([
			1 -> { self.x := value },
			2 -> { self.y := value }
		]) {
			self.error('RectangularCoordinate>>atPut: index out of range')
		}
	}

	closeTo { :self :anObject |
		self.compareBy(anObject, closeTo:/2)
	}

	compareBy { :self :anObject :aBlock:/2 |
		aBlock(self.x, anObject.x) & {
			aBlock(self.y, anObject.y)
		}
	}

	distance { :self :anObject |
		let dx = anObject.x - self.x;
		let dy = anObject.y - self.y;
		((dx * dx) + (dy * dy)).sqrt
	}

	dotProduct { :self :anObject |
		(self.x * anObject.x) + (self.y * anObject.y)
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isRectangularCoordinate & {
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
		RectangularCoordinate(
			x0 + ((k.squared * (x - x0)) / ((x - x0).squared + (y - y0).squared)),
			y0 + ((k.squared * (y - y0)) / ((x - x0).squared + (y - y0).squared))
		)
	}

	isRectangularCoordinate { :self |
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

	r { :self |
		{- r = radius = rho -}
		(self.x.squared + self.y.squared).sqrt
	}

	second { :self |
		self.y
	}

	size { :self |
		2
	}

	storeString { :self |
		[
			'RectangularCoordinate(',
				self.x.storeString,
				', ',
				self.y.storeString,
			')'
		].join
	}

	swapInPlace { :self |
		let x = self.x;
		let y = self.y;
		self.x := y;
		self.y := x
	}

	swapped { :self |
		RectangularCoordinate(self.y, self.x)
	}

	theta { :self |
		atan2(self.y, self.x)
	}

	translateBy { :self :delta |
		self + delta
	}

}

+@Number {

	adaptToRectangularCoordinateAndApply { :self :aRectangularCoordinate :aBlock:/2 |
		aBlock(aRectangularCoordinate, RectangularCoordinate(self, self))
	}

	RectangularCoordinate { :x :y |
		newRectangularCoordinate().initializeSlots(x, y)
	}

}

+Array {

	asRectangularCoordinate { :self |
		let [x, y] = self;
		RectangularCoordinate(x, y)
	}

}

+Record {

	asRectangularCoordinate { :self |
		RectangularCoordinate(self::x, self::y)
	}

}

+TwoTuple {

	asRectangularCoordinate { :self |
		RectangularCoordinate(self.first, self.second)
	}

}
