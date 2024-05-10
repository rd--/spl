{- Requires: RectangularCoordinates -}

Matrix22 : [Object] { | a b c d |

	= { :self :aMatrix |
		aMatrix.isMatrix22 & {
			self.a = aMatrix.a & {
				self.b = aMatrix.b & {
					self.c = aMatrix.c & {
						self.d = aMatrix.d
					}
				}
			}
		}
	}

	applyTo { :self :vector |
		RectangularCoordinates(
			(self.a * vector.x) + (self.b * vector.y),
			(self.c * vector.x) + (self.d * vector.y)
		)
	}

	asList { :self |
		[self.a, self.b, self.c, self.d]
	}

	copy { :self |
		Matrix22(self.a, self.b, self.c, self.d)
	}

	determinant { :self |
		(self.a * self.d) - (self.b * self.c)
	}

	identity { :self |
		self.initializeSlots(
			1, 0,
			0, 1
		)
	}

	inverse { :self |
		self.copy.invert
	}

	invert { :self |
		let m = 1 / self.determinant;
		self.initializeSlots(
			self.d * m, self.b.negated * m,
			self.c.negated * m, self.a * m
		)
	}

	rotation { :self :n |
		self.initializeSlots(
			n.cos, n.sin,
			n.sin.negated, n.cos
		)
	}

	transpose { :self |
		let b = self.b;
		let c = self.c;
		self.b := c;
		self.c := b
	}

	transposed { :self |
		Matrix22(self.a, self.c, self.b, self.d)
	}

}

+Void {

	Matrix22 {
		newMatrix22()
	}

}

+@Number {

	Matrix22 { :a :b :c :d |
		newMatrix22().initializeSlots(a, b, c, d)
	}

}

+List {

	asMatrix22 { :self |
		let [a, b, c, d] = self;
		Matrix22(a, b, c, d)
	}

}
