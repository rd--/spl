/* Requires: Complex */

Quaternion : [Object, Store, Equal, Number] {

	| components | <List>

	[absoluteValue, abs] { :self |
		self.absoluteValueSquare.sqrt
	}

	[absoluteValueSquare, absSquare] { :self |
		self.components.square.sum
	}

	adaptToFractionAndApply { :self :aFraction :aFunction/2 |
		aFunction(
			Quaternion([aFraction, 0, 0, 0]),
			self
		)
	}

	adaptToNumberAndApply { :self :aNumber :aFunction/2 |
		aFunction(
			Quaternion([aNumber, 0, 0, 0]),
			self
		)
	}

	conjugate { :self |
		let [a, b, c, d] = self.components;
		Quaternion([a, b.-, c.-, d.-])
	}

	[divide, /] { :self :anObject |
		anObject.isQuaternion.if {
			self * anObject.reciprocal
		} {
			anObject.adaptToQuaternionAndApply(self, divide/2)
		}
	}

	imaginary { :self |
		self.components.copyFromTo(2, 4)
	}

	isCloseBy { :self :anObject :epsilon |
		anObject.isQuaternion & {
			self.components.isEqualBy(
				anObject.components
			) { :a :b |
				a.isCloseBy(b, epsilon)
			}
		}
	}

	isEqualBy { :self :anObject :aFunction/2 |
		anObject.isNumber.if {
			anObject.isQuaternion.if {
				aFunction(self.components, anObject.components)
			} {
				anObject.adaptToQuaternionAndApply(self, aFunction/2)
			}
		} {
			false
		}
	}

	isHamiltonianInteger { :self |
		self.components.allSatisfy(
			isIntegerValuedNumber/1
		)
	}

	isRealValuedNumber { :self |
		self.imaginary.isOrigin
	}

	isZero { :self |
		self.components.isOrigin
	}

	matrixForm { :self |
		let [a, b, c, d] = self.components;
		[
			[a.J(b), c.J(d)],
			[c.-.J(d), a.J(b.-)]
		]
	}

	[negate, -] { :self |
		Quaternion(self.components.negate)
	}

	norm { :self |
		self.abs
	}

	normalize { :self |
		self.isZero.if {
			self.zero
		} {
			self / self.abs
		}
	}

	one { :self |
		Quaternion([1.0, 0.0, 0.0, 0.0])
	}

	[plus, +] { :self :anObject |
		anObject.isQuaternion.if {
			Quaternion(self.components + anObject.components)
		} {
			anObject.adaptToQuaternionAndApply(self, plus/2)
		}
	}

	real { :self |
		self.components.at(1)
	}

	realImaginary { :self |
		[self.real, self.imaginary]
	}

	reciprocal { :self |
		self.isZero.if {
			self.error('reciprocal: zero divide')
		} {
			self.conjugate * (1 / self.absSquare)
		}
	}

	sign { :self |
		self.components.isOrigin.if {
			0
		} {
			Quaternion(self.components / self.norm)
		}
	}

	square { :self |
		self * self
	}

	[subtract, -] { :self :anObject |
		anObject.isQuaternion.if {
			Quaternion(self.components + anObject.components)
		} {
			anObject.adaptToQuaternionAndApply(self, subtract/2)
		}
	}

	[times, *] { :self :anObject |
		anObject.isQuaternion.if {
			let [a, b, c, d] = self.components;
			let [p, q, r, s] = anObject.components;
			Quaternion(
				[
					((a * p) - (b * q) - (c * r) - (d * s)),
					((a * q) + (b * p) + (c * s) - (d * r)),
					((a * r) - (b * s) + (c * p) + (d * q)),
					((a * s) + (b * r) - (c * q) + (d * p))
				]
			)
		} {
			anObject.adaptToQuaternionAndApply(self, times/2)
		}
	}

	zero { :self |
		Quaternion([0.0, 0.0, 0.0, 0.0])
	}

}

+List {

	[Quaternion, listToQuaternion] { :self |
		self.atVectorOrElementwise { :each |
			(each.size = 4).ifFalse {
				self.error('Quaternion')
			};
			uncheckedQuaternion(each)
		}
	}

}

+@Number {

	Quaternion { :a :b :c :d |
		Quaternion(
			Float[a, b, c, d]
		)
	}

	adaptToQuaternionAndApply { :self :aQuaternion :aFunction/2 |
		aFunction(
			aQuaternion,
			self.toQuaternion
		)
	}

	isHamiltonianInteger { :self |
		self.isIntegerValuedNumber
	}

	[toQuaternion, realToQuaternion] { :a |
		let zero = a.zero;
		Quaternion([a, zero, zero, zero])
	}

}

+@Collection {

	adaptToQuaternionAndApply { :self :aQuaternion :aFunction/2 |
		self.collect { :each |
			aQuaternion.aFunction(each)
		}
	}

}

+Complex {

	[toQuaternion, complexToQuaternion] { :self |
		Quaternion([self.real, self.imaginary, 0, 0])
	}

}
