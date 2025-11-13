/* Requires: Complex */

Quaternion : [Object, Storeable, Equatable, Number] { | contents |

	* { :self :anObject |
		anObject.isQuaternion.if {
			let [a, b, c, d] = self.contents;
			let [p, q, r, s] = anObject.contents;
			Quaternion(
				[
					((a * p) - (b * q) - (c * r) - (d * s)),
					((a * q) + (b * p) + (c * s) - (d * r)),
					((a * r) - (b * s) + (c * p) + (d * q)),
					((a * s) + (b * r) - (c * q) + (d * p))
				]
			)
		} {
			anObject.adaptToQuaternionAndApply(self, *)
		}
	}

	+ { :self :anObject |
		anObject.isQuaternion.if {
			Quaternion(self.contents + anObject.contents)
		} {
			anObject.adaptToQuaternionAndApply(self, +)
		}
	}

	- { :self :anObject |
		anObject.isQuaternion.if {
			Quaternion(self.contents + anObject.contents)
		} {
			anObject.adaptToQuaternionAndApply(self, -)
		}
	}

	/ { :self :anObject |
		anObject.isQuaternion.if {
			self * anObject.reciprocal
		} {
			anObject.adaptToQuaternionAndApply(self, /)
		}
	}

	abs { :self |
		self.absSquare.sqrt
	}

	absSquare { :self |
		self.contents.square.sum
	}

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		aFraction.asQuaternion.aBlock(self)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aNumber.asQuaternion.aBlock(self)
	}

	asQuaternion { :self |
		self
	}

	asList { :self |
		self.contents.copy
	}

	asMatrix { :self |
		let [a, b, c, d] = self.contents;
		[
			[a.j(b), c.j(d)],
			[c.-.j(d), a.j(b.-)]
		]
	}

	conjugate { :self |
		let [a, b, c, d] = self.contents;
		Quaternion([a, b.-, c.-, d.-])
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isNumber.if {
			anObject.isQuaternion.if {
				aBlock(self.contents, anObject.contents)
			} {
				anObject.adaptToQuaternionAndApply(self, aBlock:/2)
			}
		} {
			false
		}
	}

	imaginary { :self |
		self.contents.copyFromTo(2, 4)
	}

	isCloseToBy { :self :anObject :epsilon |
		self.contents.equalBy(anObject.asQuaternion.contents) { :a :b |
			a.isCloseToBy(b, epsilon)
		}
	}

	isHamiltonianInteger { :self |
		self.contents.allSatisfy(isInteger:/1)
	}

	isReal { :self |
		self.imaginary.isOrigin
	}

	isZero { :self |
		self.contents.isOrigin
	}

	negate { :self |
		Quaternion(self.contents.negate)
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
		1.asQuaternion
	}

	reciprocal { :self |
		self.isZero.if {
			self.error('reciprocal: zero divide')
		} {
			self.conjugate * (1 / self.absSquare)
		}
	}

	real { :self |
		self.contents.at(1)
	}

	realImaginary { :self |
		[self.real, self.imaginary]
	}

	sign { :self |
		self.contents.isOrigin.if {
			0
		} {
			Quaternion(self.contents / self.norm)
		}
	}

	square { :self |
		self * self
	}

	zero { :self |
		0.asQuaternion
	}

}

+List {

	Quaternion { :self |
		(self.size = 4).if {
			newQuaternion().initializeSlots(self)
		} {
			self.error('Quaternion')
		}
	}

}

+@Number {

	adaptToQuaternionAndApply { :self :aQuaternion :aBlock:/2 |
		aQuaternion.aBlock(self.asQuaternion)
	}

	asQuaternion { :self |
		let zero = self.zero;
		Quaternion([self zero zero zero])
	}

	isHamiltonianInteger { :self |
		self.isInteger
	}

}

+@Collection {

	adaptToQuaternionAndApply { :self :aQuaternion :aBlock:/2 |
		self.collect { :each |
			aQuaternion.aBlock(each)
		}
	}

}

+Complex {

	asQuaternion { :self |
		Quaternion([self.real, self.imaginary, 0, 0])
	}

}
