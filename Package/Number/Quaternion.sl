/* Requires: Complex */

Quaternion : [Object, Store, Equal, Number] {

	| components |

	[conjugate, +] { :self |
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

	[plus, +] { :self :anObject |
		anObject.isQuaternion.if {
			Quaternion(self.components + anObject.components)
		} {
			anObject.adaptToQuaternionAndApply(self, plus/2)
		}
	}

	[negate, -] { :self |
		Quaternion(self.components.negate)
	}

	[sign, *] { :self |
		self.components.isOrigin.if {
			0
		} {
			Quaternion(self.components / self.norm)
		}
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

	[absoluteValue, abs] { :self |
		self.absSquare.sqrt
	}

	absSquare { :self |
		self.components.square.sum
	}

	adaptToFractionAndApply { :self :aFraction :aBlock/2 |
		aBlock(
			Quaternion([aFraction, 0, 0, 0]),
			self
		)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock/2 |
		aBlock(
			Quaternion([aNumber, 0, 0, 0]),
			self
		)
	}

	equalBy { :self :anObject :aBlock/2 |
		anObject.isNumber.if {
			anObject.isQuaternion.if {
				aBlock(self.components, anObject.components)
			} {
				anObject.adaptToQuaternionAndApply(self, aBlock/2)
			}
		} {
			false
		}
	}

	imaginary { :self |
		self.components.copyFromTo(2, 4)
	}

	isCloseToBy { :self :anObject :epsilon |
		anObject.isQuaternion & {
			self.components.equalBy(
				anObject.components
			) { :a :b |
				a.isCloseToBy(b, epsilon)
			}
		}
	}

	isHamiltonianInteger { :self |
		self.components.allSatisfy(isInteger/1)
	}

	isReal { :self |
		self.imaginary.isOrigin
	}

	isZero { :self |
		self.components.isOrigin
	}

	matrixForm { :self |
		let [a, b, c, d] = self.components;
		[
			[a.j(b), c.j(d)],
			[c.-.j(d), a.j(b.-)]
		]
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
		Quaternion([1, 0, 0, 0])
	}

	reciprocal { :self |
		self.isZero.if {
			self.error('reciprocal: zero divide')
		} {
			self.conjugate * (1 / self.absSquare)
		}
	}

	real { :self |
		self.components.at(1)
	}

	realImaginary { :self |
		[self.real, self.imaginary]
	}

	square { :self |
		self * self
	}

	zero { :self |
		Quaternion([0, 0, 0, 0])
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

	uncheckedQuaternion { :self |
		newQuaternion().initializeSlots(self)
	}

}

+@Number {

	adaptToQuaternionAndApply { :self :aQuaternion :aBlock/2 |
		aBlock(
			aQuaternion,
			self.toQuaternion
		)
	}

	isHamiltonianInteger { :self |
		self.isInteger
	}

	Quaternion { :a :b :c :d |
		Quaternion(
			SmallFloat[a, b, c, d]
		)
	}

	[toQuaternion, realToQuaternion] { :a |
		let zero = a.zero;
		Quaternion([a, zero, zero, zero])
	}

}

+@Collection {

	adaptToQuaternionAndApply { :self :aQuaternion :aBlock/2 |
		self.collect { :each |
			aQuaternion.aBlock(each)
		}
	}

}

+Complex {

	[toQuaternion, complexToQuaternion] { :self |
		Quaternion([self.real, self.imaginary, 0, 0])
	}

}
