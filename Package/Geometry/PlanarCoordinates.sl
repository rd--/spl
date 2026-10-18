/* CartesianCoordinates */

PlanarCoordinates : [Object, Copy, Store, Equal, Compare, At, Put, CartesianCoordinates] {

	| x y |

	abscissa { :self |
		self.x
	}

	[absoluteValue, abs] { :self |
		PlanarCoordinates(self.x.abs, self.y.abs)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock/2 |
		aBlock(PlanarCoordinates(aNumber, aNumber), self)
	}

	applyUnaryOperator { :self :aBlock/1 |
		PlanarCoordinates(aBlock(self.x), aBlock(self.y))
	}

	applyBinaryOperator { :self :anObject :aBlock/2 |
		anObject.isPlanarCoordinates.if {
			PlanarCoordinates(
				aBlock(self.x, anObject.x),
				aBlock(self.y, anObject.y)
			)
		} {
			anObject.adaptToPlanarCoordinatesAndApply(self, aBlock/2)
		}
	}

	coordinates { :self |
		[self.x, self.y]
	}

	[divide, /] { :self :anObject |
		self.applyBinaryOperator(anObject, divide/2)
	}

	inverse { :self :inversionCenter :inversionRadius |
		let x = self.x;
		let y = self.y;
		let x0 = inversionCenter.x;
		let y0 = inversionCenter.y;
		let k = inversionRadius;
		PlanarCoordinates(
			x0 + ((k.square * (x - x0)) / ((x - x0).square + (y - y0).square)),
			y0 + ((k.square * (y - y0)) / ((x - x0).square + (y - y0).square))
		)
	}

	[maximum, max] { :self :anObject |
		self.applyBinaryOperator(anObject, max/2)
	}

	[minimum, min] { :self :anObject |
		self.applyBinaryOperator(anObject, min/2)
	}

	[mod, %] { :self :anObject |
		self.applyBinaryOperator(anObject, mod/2)
	}

	[negate, -] { :self |
		self.applyUnaryOperator(negate/1)
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

	PlanarCoordinates { :self |
		self.copy
	}

	[plus, +] { :self :anObject |
		self.applyBinaryOperator(anObject, plus/2)
	}

	PolarCoordinates { :self |
		PolarCoordinates(
			self.rho,
			self.phi
		)
	}

	[quotient, //] { :self :anObject |
		self.applyBinaryOperator(anObject, quotient/2)
	}

	Record { :self |
		(x: self.x, y: self.y)
	}

	rho { :self |
		(self.x.square + self.y.square).sqrt
	}

	[subtract, -] { :self :anObject |
		self.applyBinaryOperator(anObject, subtract/2)
	}

	swap { :self |
		PlanarCoordinates(self.y, self.x)
	}

	swap! { :self |
		[x, y] = self.coordinates;
		self.x := y;
		self.y := x;
		nil
	}

	[times, *] { :self :anObject |
		self.applyBinaryOperator(anObject, times/2)
	}

	translate { :self :delta |
		self + delta
	}

}

+@Number {

	adaptToPlanarCoordinatesAndApply { :self :operand :aBlock/2 |
		aBlock(operand, PlanarCoordinates(self, self))
	}

}

+@Number {

	PlanarCoordinates { :x :y |
		y.isNumber.if {
			newPlanarCoordinates().initializeSlots(x, y)
		} {
			y.adaptToNumberAndApply(x, PlanarCoordinates/2)
		}
	}

}

+List {

	PlanarCoordinates { :x :y |
		y.adaptToCollectionAndApply(x, PlanarCoordinates/2)
	}

	PlanarCoordinates { :self |
		self.atVectorOrElementwise { :each |
			let [x, y] = each;
			newPlanarCoordinates().initializeSlots(x, y)
		}
	}

}

+Record {

	PlanarCoordinates { :self |
		let (x: x, y: y) = self;
		PlanarCoordinates(x, y)
	}

}
