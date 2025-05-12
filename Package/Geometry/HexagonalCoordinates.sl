HexagonalCoordinates : [Object] { | coordinates |

	= { :self :operand |
		self.hasEqualSlots(operand)
	}

	~ { :self :operand |
		self.hasEqualSlotsBy(operand, ~)
	}

	+ { :self :operand |
		operand.isHexagonalCoordinates.if {
			HexagonalCoordinates(self.coordinates + operand.coordinates)
		} {
			self.error('HexagonalCoordinates>>+')
		}
	}

	- { :self :operand |
		operand.isHexagonalCoordinates.if {
			HexagonalCoordinates(self.coordinates - operand.coordinates)
		} {
			self.error('HexagonalCoordinates>>-')
		}
	}

	* { :self :aNumber |
		HexagonalCoordinates(self.coordinates * aNumber)
	}

	asCartesianCoordinates { :self |
		self
		.coordinates
		.fromHexagonalCoordinates
		.CartesianCoordinates
	}

	asList { :self |
		self.coordinates
	}

	euclideanDistance { :self :operand |
		let [q1, r1, _] = self.coordinates;
		let [q2, r2, _] = operand.coordinates;
		((q2 - q1).squared + (r2 - r1).squared + ((q2 - q1) * (r2 - r1))).sqrt
	}

	diagonalNeighborVectors { :unused |
		[
			+2 -1 -1;
			+1 -2 +1;
			-1 -1 +2;
			-2 +1 +1;
			-1 +2 -1;
			+1 +1 -2
		]
	}

	diagonalNeighbors { :self |
		let c = self.coordinates;
		self.diagonalNeighborVectors.collect { :each |
			HexagonalCoordinates(c + each)
		}
	}

	manhattanDistance { :self :operand |
		(self - operand).coordinates.abs.max
	}

	nearestNeighborVectors { :unused |
		[
			+1 0 -1;
			+1 -1 0;
			0 -1 +1;
			-1 0 +1;
			-1 +1 0;
			0 +1 -1
		]
	}

	nearestNeighbors { :self |
		let c = self.coordinates;
		self.nearestNeighborVectors.collect { :each |
			HexagonalCoordinates(c + each)
		}
	}

	rounded { :self |
		HexagonalCoordinates(
			self.coordinates.roundedHexagonalCoordinates
		)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	HexagonalCoordinates { :self |
		(self.size = 2).ifTrue {
			self.addLast(0 - self[1] - self[2])
		};
		(self.size = 3).if {
			newHexagonalCoordinates().initializeSlots(self)
		} {
			self.error('HexagonalCoordinates: invalid parameters')
		}
	}

}

+List{

	fromHexagonalCoordinates { :self :basisVectors |
		[2 3].includes(self.size).if {
			let q = self[1];
			let r = self[2];
			(q * basisVectors[1]) + (r * basisVectors[2])
		} {
			self.error('fromHexagonalCoordinates: invalid coordinates')
		}
	}

	fromHexagonalCoordinates { :self |
		let m = 3.sqrt;
		let halfM = m * 0.5;
		self.fromHexagonalCoordinates([m 0; halfM 1.5])
	}

	roundedHexagonalCoordinates { :self |
		let [q, r, s] = self;
		let qR = q.rounded;
		let rR = r.rounded;
		let sR = s.rounded;
		let qD = (qR - q).abs;
		let rD = (rR - r).abs;
		let sD = (sR - s).abs;
		(qD > rD & { qD > sD }).if {
			qD := 0 - rD - sD
		} {
			(rD > sD).if {
				rD := 0 - qD - sD
			} {
				sD := 0 - qS - rD
			}
		};
		[qR rR sR]
	}

	toHexagonalCoordinates { :self |
		let [x, y] = self;
		let m = 3.sqrt;
		let q = (m / 3 * x) - (1 / 3 * y);
		let r = 2 / 3 * y;
		let s = 0 - q - r;
		[q, r, s]
	}

}
