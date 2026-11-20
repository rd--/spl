@CartesianCoordinates {

	assertIsCompatibleOperand { :self :operand |
		(
			(self.typeName = operand.typeName) & {
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

	compare { :self :operand |
		self.assertIsCompatibleOperand(operand);
		compareOn(self, operand, coordinates/1)
	}

	dimension { :self |
		0L
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
		self.coordinates.allSatisfy(isZero/1)
	}

	isPlanar { :self |
		self.coordinates.size = 2L
	}

	[negate, -] { :self |
		self.coordinates := self.coordinates.negate
	}

	norm { :self |
		self.coordinates.square.sum.sqrt
	}

	put! { :self :index :value |
		self.coordinates.put!(index, value)
	}

	second { :self |
		self.coordinates.second
	}

	size { :self |
		self.coordinates.size
	}

	x { :self |
		self.coordinates.at(1L)
	}

	x! { :self :anObject |
		self.coordinates.put!(1L, anObject)
	}

	y { :self |
		let v = self.coordinates;
		(v.size < 2L).if {
			self.error('@CartesianCoordinates>>y: no y')
		} {
			v.at(2L)
		}
	}

	y! { :self :anObject |
		self.coordinates.put!(2L, anObject)
	}

	z { :self |
		let v = self.coordinates;
		(v.size < 3L).if {
			self.error('@CartesianCoordinates>>z: no z')
		} {
			v.at(3L)
		}
	}

	z! { :self :anObject |
		self.coordinates.put!(3L, anObject)
	}

}

CartesianCoordinates : [Object, Copy, Store, Equal, Compare, At, Indices, Put, CartesianCoordinates] {

	| coordinates | <List>

	CartesianCoordinates { :self |
		self
	}

	Record { :self |
		self.size.caseOf(
			[
				2L -> { (x: self.x, y: self.y) },
				3L -> { (x: self.x, y: self.y, z: self.z) },
				4L -> { (x: self.x, y: self.y, z: self.z, w: self.w) }
			]
		) {
			self.error('Record: not x,y or x,y,z or x,z,y,w')
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
		self.at(1L)
	}

	postCopy { :self |
		self.coordinates := self.coordinates.copy
	}

	second { :self |
		self.at(2L)
	}

	third { :self |
		self.at(3L)
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

	[CartesianCoordinates, listToCartesianCoordinates] { :self |
		uncheckedCartesianCoordinates(self)
	}

}

+Record {

	[CartesianCoordinates, recordToCartesianCoordinates] { :self |
		self.size.caseOf(
			[
				2L -> {
					let (x: x, y: y) = self;
					CartesianCoordinates([x y])
				},
				3L -> {
					let (x: x, y: y, z: z) = self;
					CartesianCoordinates([x y z])
				},
				4L -> {
					let (x: x, y: y, z: z, w: w) = self;
					CartesianCoordinates([x y z w])
				}
			]
		) {
			self.error('CartesianCoordinates: not x,y or x,y,z or x,y,z,w')
		}
	}

}

+List {

	curvilinearProjection { :self :radius |
		self.atVectorOrElementwise { :v |
			let [x, y, z] = v;
			let d = (x.square + y.square + z.square).sqrt;
			[(x * radius) / d, (y * radius) / d]
		}
	}

	curvilinearProjection { :self |
		self.curvilinearProjection(1.0)
	}

}
