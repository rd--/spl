EisensteinInteger : [Object, Equatable] { | a b |

	* { :self :operand |
		let [a, b] = self.asList;
		let [c, d] = operand.asList;
		EisensteinInteger(
			(a * c) - (b * d),
			(b * c) + (a * d) - (b * d)
		)
	}

	abs { :self |
		self.asComplex.abs
	}

	asComplex { :self |
		let omega = (-1 + (0J1 * 3.sqrt)) / 2;
		self.a + (self.b * omega)
	}

	asList { :self |
		[self.a, self.b]
	}

	conjugate { :self |
		EisensteinInteger(0 - self.a - 1, 0 - self.b)
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
		(a * a) + (b * b) - (a * b)
	}

	real { :self |
		self.a - self.b / 2
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+SmallFloat {

	EisensteinInteger { :a :b |
		newEisensteinInteger().initializeSlots(a, b)
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

}
