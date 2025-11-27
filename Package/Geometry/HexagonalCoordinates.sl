HexagonalCoordinates : [Object, Storeable, Equatable] { | coordinates |

	[plus, +] { :self :operand |
		operand.isHexagonalCoordinates.if {
			HexagonalCoordinates(self.coordinates + operand.coordinates)
		} {
			self.error('HexagonalCoordinates>>+')
		}
	}

	[subtract, -] { :self :operand |
		operand.isHexagonalCoordinates.if {
			HexagonalCoordinates(self.coordinates - operand.coordinates)
		} {
			self.error('HexagonalCoordinates>>-')
		}
	}

	[times, *] { :self :aNumber |
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
		((q2 - q1).square + (r2 - r1).square + ((q2 - q1) * (r2 - r1))).sqrt
	}

	diagonalNeighbourVectors { :unused |
		[
			+2 -1 -1;
			+1 -2 +1;
			-1 -1 +2;
			-2 +1 +1;
			-1 +2 -1;
			+1 +1 -2
		]
	}

	diagonalNeighbours { :self |
		let c = self.coordinates;
		self.diagonalNeighbourVectors.collect { :each |
			HexagonalCoordinates(c + each)
		}
	}

	manhattanDistance { :self :operand |
		(self - operand).coordinates.abs.max
	}

	nearestNeighbourVectors { :unused |
		[
			+1 0 -1;
			+1 -1 0;
			0 -1 +1;
			-1 0 +1;
			-1 +1 0;
			0 +1 -1
		]
	}

	nearestNeighbours { :self |
		let c = self.coordinates;
		self.nearestNeighbourVectors.collect { :each |
			HexagonalCoordinates(c + each)
		}
	}

	round { :self |
		HexagonalCoordinates(
			self.coordinates.roundedHexagonalCoordinates
		)
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

+List {

	fromHexagonalCoordinates { :self :theta |
		let m = 3.sqrt;
		let basisVectors = [[m, theta], [m, theta + 60.degree]].fromPolarCoordinates;
		self.atVectorOrElementwise { :v |
			[2 3].includes(v.size).if {
				let q = v[1];
				let r = v[2];
				(q * basisVectors[1]) + (r * basisVectors[2])
			} {
				self.error('fromHexagonalCoordinates: invalid coordinates')
			}
		}
	}

	fromHexagonalCoordinates { :self |
		self.fromHexagonalCoordinates(0)
	}

	polygonalHexagonalGrid { :self |
		let p = Polygon(self);
		let b = self.coordinateBoundingBox;
		let answer = [];
		let [x1, y1] = b[1];
		let [x2, y2] = b[2];
		let m = 1 / 3.sqrt;
		let k = 3;
		(y1 - k).toDo(y2 + k) { :r |
			let rOffset = (r / 2).floor;
			(x1 - rOffset - k).toDo(x2 - rOffset + k) { :q |
				let s = 0 - q - r;
				let c = [q, r, s].fromHexagonalCoordinates * 0.5;
				let h = 6.regularPolygon(c, 0.5, 0.5.pi);
				h.vertexCoordinates.anySatisfy { :each |
					p.containsPoint(each)
				}.ifTrue {
					answer.add(h)
				}
			}
		};
		answer
	}

	rectangularHexagonalGrid { :self |
		self
		.asRectangle
		.asPolygon
		.vertexCoordinates
		.polygonalHexagonalGrid
	}

	roundedHexagonalCoordinates { :self |
		self.isVector.if {
			let [q, r, s] = self;
			let qR = q.round;
			let rR = r.round;
			let sR = s.round;
			let qD = (qR - q).abs;
			let rD = (rR - r).abs;
			let sD = (sR - s).abs;
			(qD > rD & { qD > sD }).if {
				qD := 0 - rD - sD
			} {
				(rD > sD).if {
					rD := 0 - qD - sD
				} {
					sD := 0 - qD - rD
				}
			};
			[qR rR sR]
		} {
			self.collect(roundedHexagonalCoordinates:/1)
		}
	}

	toHexagonalCoordinates { :self |
		self.atVectorOrElementwise { :v |
			let [x, y] = v;
			let m = 3.sqrt;
			let q = (m / 3 * x) - (1 / 3 * y);
			let r = 2 / 3 * y;
			let s = 0 - q - r;
			[q, r, s]
		}
	}

}
