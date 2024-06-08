Projection3 : [Object] { | alpha beta x y z |

	applyTo { :self :vector |
		let [x, y, _] = vector;
		self.asMatrix.dot([x, y])
	}

	asMatrix { :self |
		[
			[self.x * self.beta.cos.negated, 0, self.z * self.alpha.cos],
			[self.x * self.beta.sin, self.y , self.z * self.alpha.sin],
			[0, 0, 0]
		]
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

	block { :self |
		let matrix = self.asMatrix;
		{ :aVector |
			let [x, y, _] = matrix.dot(aVector);
			[x, y]
		}
	}

}

+Void {

	Projection3 {
		newProjection3().identity
	}

}
