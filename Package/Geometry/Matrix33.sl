/* Requires: CartesianCoordinates */

Matrix33 : [Object, Equatable] { | elements |

	applyTo { :self :vector |
		let [a, b, c, d, e, f, g, h, i] = self.elements;
		let [x, y, z] = vector.asList;
		CartesianCoordinates(
			(a * x) + (b * y) + (c * z),
			(d * x) + (e * y) + (f * z),
			(g * x) + (h * y) + (i * z)
		)
	}

	asList { :self |
		self.elements.copy
	}

	determinant { :self |
		let [a, b, c, d, e, f, g, h, i] = self.elements;
		(a * e * i) + (b * f * g) + (c * d * h) - (c * e * g) - (b * d * i) - (a * f * h)
	}

	equalBy { :self :aMatrix :aBlock:/2 |
		aMatrix.isMatrix33 & {
			aBlock(self.elements, aMatrix.elements)
		}
	}

	inverse { :self |
		self.copy.invert
	}

	invert { :self |
		let [a, b, c, d, e, f, g, h, i] = self.elements;
		self.elements := self.determinant * [
			(e * i) - (f * h), ((b * i) - (c * h)).negate, (b * f) - (c * e),
			((d * i) - (f * g)).negate, (a * i) - (c * g), ((a * f) - (c * d)).negate,
			(d * h) - (e * g), ((a * h).negate - (b * g)), (a * e) - (b * d)
		];
		self
	}

	identity { :self |
		self.elements := [
			1, 0, 0,
			0, 1, 0,
			0, 0, 1
		]
	}

	xy { :self |
		self.elements := [
			1, 0, 0,
			0, 1, 0,
			0, 0, 0
		]
	}

	xz { :self |
		self.elements := [
			1, 0, 0,
			0, 0, 1,
			0, 0, 0
		]
	}

	yz { :self |
		self.elements := [
			0, 1, 0,
			0, 0, 1,
			0, 0, 0
		]
	}

}

+@Number {

	Matrix33 { :self :b :c :d :e :f :g :h :i |
		[self, b, c, d, e, f, g, h, i].asMatrix33
	}

}

+List {

	asMatrix33 { :self |
		(self.size != 9).if {
			self.error('asMatrix33: not 9-element array')
		} {
			newMatrix33().initializeSlots(self)
		}
	}

}
