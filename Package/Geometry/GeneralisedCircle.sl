GeneralisedCircle : [Object, Store, Equal, Geometry] {

	| c alpha d |

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
		(alpha.abs > 1.0E-12).if {
			d.abs / (2 * alpha.abs)
		} {
			Infinity
		}
	}

	embeddingDimension { :unused |
		2
	}

	[Circle, generalisedCircleToCircle] { :self |
		let [c, alpha, _] = self.assertIsCircle.coefficientList;
		let [a, b] = alpha.realImaginary;
		Circle(
			[a.negate, b] / c,
			(self.discriminant / c.square).sqrt
		)
	}

	[InfiniteLine, generalisedCircleToInfiniteLine] { :self |
		let [a, b, c] = self.lineEquation;
		InfiniteLine(a, b, c)
	}

	[Point, generalisedCircleToPoint] { :self |
		let [c, alpha, _] = self.assertIsPoint.coefficientList;
		let [r, i] = alpha.realImaginary;
		Point(
			[r.negate, i] / c
		)
	}

	implicitEquation { :self |
		let [c, alpha, d] = self.coefficientList;
		let [a, b] = alpha.realImaginary;
		{ :x :y |
			(c * (x.square + y.square)) + (2.0 * ((a * x) - (b * y))) + d
		}
	}

	isCircle { :self |
		self.isLine.not & {
			self.discriminant > 1.0E-12
		}
	}

	isLine { :self |
		self.c.isVeryClose(0)
	}

	isPoint { :self |
		self.isLine.not & {
			self.discriminant.isVeryClose(0)
		}
	}

	lineEquation { :self |
		let [_, alpha, d] = self.assertIsLine.coefficientList;
		let [a, b] = alpha.realImaginary;
		[a, -1.0 * b, d / 2.0]
	}

}

+Float {

	uncheckedGeneralisedCircle { :c :alpha :d |
		newGeneralisedCircle().initializeSlots(c, alpha, d)
	}

}

+[Float, Integer] {

	GeneralisedCircle { :c :alpha :d |
		uncheckedGeneralisedCircle(
			Float(c),
			alpha.assertIsComplex,
			Float(d)
		)
	}

}
