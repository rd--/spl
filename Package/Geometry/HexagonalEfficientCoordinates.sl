HexagonalEfficientCoordinates : [Object] { | coordinates |

	+ { :self :operand |
		let [a1, r1, c1] = self.coordinates;
		let [a2, r2, c2] = operand.coordinates;
		HexagonalEfficientCoordinates(
			a1.bitXor(a2),
			r1 + r2 + a1.bitAnd(a2),
			c1 + c2 + a1.bitAnd(a2)
		)
	}

	- { :self :operand |
		self + operand.negated
	}

	* { :self :operand |
		self.operand.isNonNegativeInteger.if {
			let [a, r, c] = self.coordinates;
			let z = a * (operand / 2).floor;
			HexagonalEfficientCoordinates(
				(a * operand) % 2,
				(r * operand) + z,
				(c * operand) + z
			)
		} {
			self.negated * operand.abs
		}

	}

	asCartesianCoordinates { :self |
		self
		.coordinates
		.fromHexagonalEfficientCoordinates
		.CartesianCoordinates
	}

	asList { :self |
		self.coordinates
	}

	negated { :self |
		let [a, r, c] = self.coordinates;
		HexagonalEfficientCoordinates(
			a,
			0 - r - a,
			0 - c - a
		)
	}

	nearestNeighbors { :self |
		let [a, c, r] = self.coordinates;
		[
			[a, r, c + 1],
			[1 - a, r - (1 - a), c + a],
			[1 - a, r - (1 - a), c - (1 - a)],
			[a, r, c - 1],
			[1 - a, r + a, c - (1 - a)],
			[1 - a, r + a, c + a]
		].collect(HexagonalEfficientCoordinates:/1)
	}

}

+List {

	fromHexagonalEfficientCoordinates { :self |
		let [a, r, c] = self;
		[
			(a / 2) + c,
			3.sqrt * ((a / 2) + r)
		]
	}

	HexagonalEfficientCoordinates { :self |
		let [a, r, c] = self;
		newHexagonalEfficientCoordinates().initializeSlots([a, r, c])
	}

}
