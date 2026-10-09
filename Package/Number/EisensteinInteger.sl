EisensteinInteger : [Object, Store, Equal] {

	| a b |

	adaptToComplexAndApply { :self :aComplexNumber :aBlock/2 |
		aBlock(aComplexNumber, self.toComplex)
	}

	[conjugate, +] { :self |
		EisensteinInteger(
			0 - self.a - 1,
			0 - self.b
		)
	}

	[times, *] { :self :operand |
		operand.isEisensteinInteger.if {
			let [a, b] = self.components;
			let [c, d] = operand.components;
			EisensteinInteger(
				(a * c) - (b * d),
				(b * c) + (a * d) - (b * d)
			)
		} {
			self.toComplex * operand
		}
	}

	[absoluteValue, abs] { :self |
		self.toComplex.abs
	}

	components { :self |
		[self.a, self.b]
	}

	imaginary { :self |
		self.b * 3.sqrt / 2
	}

	isPrime { :self |
		isEisensteinPrime(self.a, self.b)
	}

	norm { :self |
		let a = self.a;
		let b = self.b;
		(a * a) - (a * b) + (b * b)
	}

	real { :self |
		self.a - (self.b / 2)
	}

	realImaginary { :self |
		[self.real, self.imaginary]
	}

	[toComplex, eisensteinIntegerToComplex] { :self |
		self.a + self.b.eisensteinOmega
	}

}

+SmallFloat {

	EisensteinInteger { :a :b |
		b.isInteger.if {
			uncheckedEisensteinInteger(a, b)
		} {
			b.adaptToIntegerAndApply(a, EisensteinInteger/2)
		}
	}

	eisensteinOmega { :n |
		/* let omega = (-1 + (0J1 * 3.sqrt)) / 2; */
		let omega = -0.5J0.8660254037844386;
		n * omega
	}

	isEisensteinPrime { :a :b |
		(a = 0 | { b = 0 | { a = b } }).if {
			let c = a.abs.max(b.abs);
			c.isPrime & { c % 3 = 2 }
		} {
			let n = (a * a) + (b * b) - (a * b);
			n.isPrime
		}
	}

	uncheckedEisensteinInteger { :a :b |
		newEisensteinInteger().initializeSlots(a, b)
	}

}

+@Sequence {

	EisensteinInteger { :a :b |
		b.adaptToCollectionAndApply(a, EisensteinInteger/2)
	}

}

+List {

	[EisensteinInteger, arrayToEisensteinInteger] { :self |
		self.atVectorOrElementwise { :each |
			let [a, b] = each;
			EisensteinInteger(a, b)
		}
	}

}
