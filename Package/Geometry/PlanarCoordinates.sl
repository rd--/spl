/* CartesianCoordinates */

PlanarCoordinates : [Object, Storeable, Copyable, Equatable, Comparable, Indexable, CartesianCoordinates] { | coordinates |

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
		PlanarCoordinates(self.coordinates.abs)
	}

	abscissa { :self |
		self.coordinates.at(1)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aBlock(PlanarCoordinates([aNumber, aNumber]), self)
	}

	applyUnaryOperator { :self :aBlock:/1 |
		PlanarCoordinates(self.coordinates.collect(aBlock:/1))
	}

	applyBinaryOperator { :self :anObject :aBlock:/2 |
		anObject.isPlanarCoordinates.if {
			PlanarCoordinates(
				self.coordinates.withCollect(
					anObject.coordinates,
					aBlock:/2
				)
			)
		} {
			anObject.adaptToPlanarCoordinatesAndApply(self, aBlock:/2)
		}
	}

	asPolarCoordinates { :self |
		PolarCoordinates([self.radius, self.theta])
	}

	asRecord { :self |
		(x: self.x, y: self.y)
	}

	asPlanarCoordinates { :self |
		self
	}

	inverse { :self :inversionCenter :inversionRadius |
		let x = self.x;
		let y = self.y;
		let x0 = inversionCenter.x;
		let y0 = inversionCenter.y;
		let k = inversionRadius;
		PlanarCoordinates(
			[
				x0 + ((k.square * (x - x0)) / ((x - x0).square + (y - y0).square)),
				y0 + ((k.square * (y - y0)) / ((x - x0).square + (y - y0).square))
			]
		)
	}

	max { :self :anObject |
		self.applyBinaryOperator(anObject, max:/2)
	}

	min { :self :anObject |
		self.applyBinaryOperator(anObject, min:/2)
	}

	negate { :self |
		self.applyUnaryOperator(negate:/1)
	}

	normalize { :self |
		self / self.norm
	}

	ordinate { :self |
		self.y
	}

	phi { :self |
		atan2(self.y, self.x)
	}

	postCopy { :self |
		self.coordinates := self.coordinates.copy
	}

	quotient { :self :anObject |
		self.applyBinaryOperator(anObject, quotient:/2)
	}

	radius { :self |
		(self.x.square + self.y.square).sqrt
	}

	rho { :self |
		self.radius
	}

	swapInPlace { :self |
		let c = self.coordinates;
		let x = c[1];
		let y = c[2];
		c[1] := y;
		c[2] := x
	}

	swapped { :self |
		PlanarCoordinates(self.coordinates.reverse)
	}

	theta { :self |
		atan2(self.y, self.x)
	}

	translate { :self :delta |
		self + delta
	}

}

+@Number {

	adaptToPlanarCoordinatesAndApply { :self :operand :aBlock:/2 |
		aBlock(operand, PlanarCoordinates([self, self]))
	}

}

+List {

	asPlanarCoordinates { :self |
		PlanarCoordinates(self)
	}

	PlanarCoordinates { :self |
		self.isMatrix.if {
			self.collect(PlanarCoordinates:/1)
		} {
			let [x, y] = self;
			newPlanarCoordinates().initializeSlots([x, y])
		}
	}

}

+Record {

	asPlanarCoordinates { :self |
		PlanarCoordinates([self['x'], self['y']])
	}

}
