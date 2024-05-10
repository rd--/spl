CartesianCoordinate : [Object, Magnitude, Indexable] { | x y z |

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

	asList { :self |
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

	cross { :u :v |
		CartesianCoordinate(
			(u.y * v.z) - (u.z * v.y),
			(u.z * v.x) - (u.x * v.z),
			(u.x * v.y) - (u.y * v.x)
		)
	}

	dimension { :self |
		0
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

	embeddingDimension { :self |
		3
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

	storeString { :self |
		[
			'CartesianCoordinate(',
				self.x.storeString,
				', ',
				self.y.storeString,
				', ',
				self.z.storeString,
			')'
		].join
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

+@Sequence {

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
