@CartesianCoordinates {

	assertIsCompatibleOperand { :self :operand |
		(
			(self.typeOf = operand.typeOf) & {
				self.size = operand.size
			}
		).if {
			operand
		} {
			self.error('assertIsCompatibleOperand: not of equal type or size')
		}
	}

	at { :self :index |
		self.coordinates.at(index)
	}

	atPut { :self :index :value |
		self.coordinates.atPut(index, value)
	}

	compare { :self :anObject |
		self.coordinates.compare(
			self.assertIsCompatibleOperand(anObject).coordinates
		)
	}

	dimension { :self |
		0
	}

	distance { :self :other |
		self.coordinates.euclideanDistance(
			self.assertIsCompatibleOperand(other).coordinates
		)
	}

	dotProduct { :self :anObject |
		(
			self.coordinates * self.assertIsCompatibleOperand(anObject).coordinates
		).sum
	}

	embeddingDimension { :self |
		self.coordinates.size
	}

	first { :self |
		self.coordinates.first
	}

	isOrigin { :self |
		self.coordinates.allSatisfy(isZero:/1)
	}

	isPlanar { :self |
		self.coordinates.size = 2
	}

	negate { :self |
		self.coordinates := self.coordinates.negate
	}

	norm { :self |
		self.coordinates.square.sum.sqrt
	}

	second { :self |
		self.coordinates.second
	}

	size { :self |
		self.coordinates.size
	}

	x { :self |
		self.coordinates[1]
	}

	x { :self :anObject |
		self.coordinates[1] := anObject
	}

	y { :self |
		let v = self.coordinates;
		(v.size < 2).if {
			self.error('@CartesianCoordinates>>y: no y')
		} {
			v[2]
		}
	}

	y { :self :anObject |
		self.coordinates[2] := anObject
	}

	z { :self |
		let v = self.coordinates;
		(v.size < 3).if {
			self.error('@CartesianCoordinates>>z: no z')
		} {
			v[3]
		}
	}

	z { :self :anObject |
		self.coordinates[3] := anObject
	}

}

CartesianCoordinates : [Object, Copyable, Equatable, Comparable, Magnitude, Indexable, CartesianCoordinates] { | coordinates |

	asCartesianCoordinates { :self |
		self
	}

	asRecord { :self |
		self.size.caseOf([
			2 -> { (x: self.x, y: self.y) },
			3 -> { (x: self.x, y: self.y, z: self.z) },
			4 -> { (x: self.x, y: self.y, z: self.z, w: self.w) }
		]) {
			self.error('asRecord: not x,y or x,y,z or x,z,y,w')
		}
	}

	cross { :u :v |
		CartesianCoordinates(
			u.coordinates.cross(
				u.assertIsCompatibleOperand(v).coordinates
			)
		)
	}

	first { :self |
		self.at(1)
	}

	postCopy { :self |
		self.coordinates := self.coordinates.copy
	}

	second { :self |
		self.at(2)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	third { :self |
		self.at(3)
	}

	xy { :self |
		CartesianCoordinates([self.x, self.y])
	}

	xz { :self |
		CartesianCoordinates([self.x, self.z])
	}

	yz { :self |
		CartesianCoordinates([self.y, self.z])
	}

}

+List {

	asCartesianCoordinates { :self |
		CartesianCoordinates(self)
	}

	CartesianCoordinates { :self |
		newCartesianCoordinates().initializeSlots(self)
	}

}

+Record {

	asCartesianCoordinates { :self |
		self.size.caseOf(
			[
				2 -> {
					let (x: x, y: y) = self;
					CartesianCoordinates([x y])
				},
				3 -> {
					let (x: x, y: y, z: z) = self;
					CartesianCoordinates([x y z])
				},
				4 -> {
					let (x: x, y: y, z: z, w: w) = self;
					CartesianCoordinates([x y z w])
				}
			]
		) {
			self.error('asCartesianCoordinates: not x,y or x,y,z or x,y,z,w')
		}
	}

}
