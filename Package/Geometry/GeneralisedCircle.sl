GeneralisedCircle : [Object] { | c alpha d |

	= { :self :operand |
		self.hasEqualSlots(operand)
	}

	~ { :self :operand |
		self.hasEqualSlotsBy(operand, ~)
	}

	asCircle { :self |
		let [c, alpha, _] = self.assertIsCircle.coefficientList;
		let [a, b] = alpha.asList;
		Circle(
			[a.negate, b] / c,
			(self.discriminant / c.square).sqrt
		)
	}

	asLine { :self |
		let [a, b, c] = self.lineEquation;
		InfiniteLine(a, b, c)
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
		let [c, alpha, d] = self.assertIsLine.coefficientList;
		(alpha.abs > 1E-12).if {
			d.abs / (2 * alpha.abs)
		} {
			Infinity
		}
	}

	implicitEquation { :self |
		let [c, alpha, d] = self.coefficientList;
		let [a, b] = alpha.asList;
		{ :x :y |
			(c * (x.square + y.square)) + (2 * ((a * x) - (b * y))) + d
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
		let [a, b] = alpha.asList;
		[a, -1 * b, d / 2]
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
