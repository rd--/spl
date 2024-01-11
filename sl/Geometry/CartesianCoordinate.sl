@CartesianCoordinate {

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isVector3 & {
			aBlock(self.x, anObject.x) & {
				aBlock(self.y, anObject.y) & {
					aBlock(self.z, anObject.z)
				}
			}
		}
	}

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	asCartesianCoordinate { :self |
		self
	}

	isCartesianCoordinate { :self |
		true
	}

	asArray { :self |
		[self.x, self.y, self.z]
	}

	asRecord { :self |
		(x: self.x, y: self.y, z: self.z)
	}

	distance { :self :aVector |
		(
			(aVector.x - self.x).squared +
			(aVector.y - self.y).squared +
			(aVector.z - self.z).squared
		).sqrt
	}

	first { :self |
		self.x
	}

	isZero { :self |
		self.x.isZero & {
			self.y.isZero
		} & {
			self.z.isZero
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

}

+@Object {

	isCartesianCoordinate { :self |
		false
	}

}
