@CartesianCoordinates {

	asList { :self |
		self.coordinates.copy
	}

	at { :self :index |
		self.coordinates.at(index)
	}

	dimension { :self |
		0
	}

	embeddingDimension { :self |
		self.coordinates.size
	}

	isPlanar { :self |
		self.coordinates.size = 2
	}

	size { :self |
		self.coordinates.size
	}

	x { :self |
		self.coordinates[1]
	}

	y { :self |
		let v = self.coordinates;
		(v.size < 2).if {
			self.error('@CartesianCoordinates>>y: no y')
		} {
			v[2]
		}
	}

	z { :self |
		let v = self.coordinates;
		(v.size < 3).if {
			self.error('@CartesianCoordinates>>z: no z')
		} {
			v[3]
		}
	}

}

CartesianCoordinates : [Object, Magnitude, Indexable, CartesianCoordinates] { | coordinates |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	< { :self :anObject |
		self.compare(anObject) = -1
	}

	asCartesianCoordinates { :self |
		self
	}

	assertIsCompatibleOperand { :self :operand |
		(
			operand.isCartesianCoordinates & {
				self.size = operand.size
			}
		).if {
			operand
		} {
			self.error('assertIsCompatibleOperand: not CartesianCoordinates or not of equal size')
		}
	}

	atPut { :self :index :value |
		self.coordinates.atPut(index, value)
	}

	compare { :self :anObject |
		self.coordinates.compare(
			self.assertIsCompatibleOperand(anObject).coordinates
		)
	}

	cross { :u :v |
		CartesianCoordinates(
			u.coordinates.cross(
				u.assertIsCompatibleOperand(v).coordinates
			)
		)
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

	first { :self |
		self.at(1)
	}

	isZero { :self |
		self.coordinates.allSatisfy(isZero:/1)
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
		PlanarCoordinates(self.x, self.y)
	}

	xz { :self |
		PlanarCoordinates(self.x, self.z)
	}

	yz { :self |
		PlanarCoordinates(self.y, self.z)
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
		self.size.caseOfOtherwise([
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
		]) {
			self.error('asCartesianCoordinates: not x,y or x,y,z')
		}
	}

}
