CartesianCoordinate : [Object, Magnitude] { | x y z |

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	asCartesianCoordinate { :self |
		self
	}

	at { :self :index |
		index.caseOfOtherwise([
			1 -> { self.x },
			2 -> { self.y },
			3 -> { self.z }
		]) {
			self.error('CartesianCoordinate>>at: index out of range')
		}
	}

	atPut { :self :index :value |
		index.caseOfOtherwise([
			1 -> { self.x := value },
			2 -> { self.y := value },
			3 -> { self.z := value }
		]) {
			self.error('CartesianCoordinate>>atPut: index out of range')
		}
	}

	asArray { :self |
		[self.x, self.y, self.z]
	}

	asRecord { :self |
		(x: self.x, y: self.y, z: self.z)
	}

	asTuple { :self |
		(self.x, self.y, self.z)
	}

	compareBy { :self :anObject :aBlock:/2 |
		aBlock(self.x, anObject.x) & {
			aBlock(self.y, anObject.y) & {
				aBlock(self.z, anObject.z)
			}
		}
	}

	distance { :self :other |
		(
			(other.x - self.x).squared +
			(other.y - self.y).squared +
			(other.z - self.z).squared
		).sqrt
	}

	dotProduct { :self :anObject |
		(self.x * anObject.x) + (self.y * anObject.y) + (self.z * anObject.z)
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isCartesianCoordinate & {
			aBlock(self.x, anObject.x) & {
				aBlock(self.y, anObject.y) & {
					aBlock(self.z, anObject.z)
				}
			}
		}
	}

	first { :self |
		self.x
	}

	isCartesianCoordinate { :self |
		true
	}

	isZero { :self |
		self.x.isZero & {
			self.y.isZero & {
				self.z.isZero
			}
		}
	}

	second { :self |
		self.y
	}

	size { :self |
		3
	}

	third { :self |
		self.z
	}

	xy { :self |
		RectangularCoordinate(self.x, self.y)
	}

	xz { :self |
		RectangularCoordinate(self.x, self.z)
	}

	yz { :self |
		RectangularCoordinate(self.y, self.z)
	}

}

+@Number {

	CartesianCoordinate { :x :y :z |
		newCartesianCoordinate().initializeSlots(x, y, z)
	}

}

+Array {

	asCartesianCoordinate { :self |
		let [x, y, z] = self;
		CartesianCoordinate(x, y, z)
	}

}

+Record {

	asCartesianCoordinate { :self |
		CartesianCoordinate(self::x, self::y, self::z)
	}

}

+ThreeTuple {

	asCartesianCoordinate { :self |
		CartesianCoordinate(self.first, self.second, self.third)
	}

}
