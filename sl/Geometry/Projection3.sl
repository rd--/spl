Projection3 : [Object] { | alpha beta x y z |

	applyTo { :self :vector |
		self.Matrix33.applyTo(vector).xy
	}

	chinese { :self |
		self.initializeSlots(pi / 6, 0, 1, 1, 1 / 2)
	}

	identity { :self |
		self.initializeSlots(0, 0, 1, 1, 1)
	}

	isometric { :self |
		self.initializeSlots(pi / 6, pi / 6, 1, 1, 1)
	}

	Matrix33 { :self |
		Matrix33(
			self.x * self.beta.cos.negated, 0, self.z * self.alpha.cos,
			self.x * self.beta.sin, self.y , self.z * self.alpha.sin,
			0, 0, 0
		)
	}

	block { :self |
		| matrix = self.Matrix33; |
		{ :aVector |
			matrix.applyTo(aVector).xy
		}
	}

}

+Void {

	Projection3 {
		newProjection3().identity
	}

}
