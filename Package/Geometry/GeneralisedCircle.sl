GeneralisedCircle : [Object] { | c alpha d |

	= { :self :operand |
		self.hasEqualSlots(operand)
	}

	~ { :self :operand |
		self.hasEqualSlotsBy(operand, ~)
	}

	asCircle { :self |
		let [c, alpha, _] = self.assertIsCircle.coefficientList;
		let [r, i] = alpha.asList;
		Circle(
			[r.negate, i] / c,
			(self.discriminant / c.square).sqrt
		)
	}

	asLine { :self |
		let [c, alpha, d] = self.assertIsLine.coefficientList;
		let [a, b] = alpha.asList;
		let [i, j] = [b, a.negate];
		let [x, y] = (a.abs > b.abs).if {
			[d.- / (2 * a), 0]
		} {
			[0, d / (2 * b)]
		};
		InfiniteLine([x, y], [i, j])
	}

	asPoint { :self |
		let [c, alpha, _] = self.assertIsPoint.coefficientList;
		let [r, i] = alpha.asList;
		Point(
			[r.negate, i] / c
		)
	}

	assertIsCircle { :self |
		self.assert('GeneralisedCircle: not circle') { self.isCircle }
	}

	assertIsLine { :self |
		self.assert('GeneralisedCircle: not line') { self.isLine }
	}

	assertIsPoint { :self |
		self.assert('GeneralisedCircle: not point') { self.isPoint }
	}

	coefficientList { :self |
		[self.c, self.alpha, self.d]
	}

        discriminant { :self |
		let [c, alpha, d] = self.coefficientList;
		alpha.abs.square - (c * d)
	}

	distanceFromOrigin { :self |
		let [c, alpha, d] = self.coefficientList;
		(alpha.abs > 1E-12).if {
			d.abs / (2 * alpha.abs)
		} {
			Infinity
		}
	}

	isCircle { :self |
		self.isLine.not & {
			self.discriminant > 1E-12
		}
	}

	isLine { :self |
		self.c.isVeryCloseTo(0)
	}

	isPoint { :self |
		self.isLine.not & {
			self.discriminant.isVeryCloseTo(0)
		}
	}

	lineEquation { :self |
		let [_, alpha, d] = self.assertIsLine.coefficientList;
		let a = alpha.real;
		let b = alpha.imaginary.negate;
		let c = d / 2;
		[a, b, c]
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+SmallFloat {

	GeneralisedCircle { :c :alpha :d |
		newGeneralisedCircle().initializeSlots(c, alpha, d)
	}

}
