{- Requires: RectangularCoordinate CartesianCoordinate -}

@Vector {

	isVector { :self |
		true
	}

}

+@Object {

	isVector { :self |
		false
	}

}

TwoVector : [Object, Indexable, Number, Vector, RectangularCoordinate] { | x y |

	asPoint { :self |
		self
	}

	asPolarPoint { :self |
		PolarPoint(self.r, self.theta)
	}

	printString { :self |
		[self.x, '@', self.y].join
	}

	species { :self |
		Vector:/2
	}

}

ThreeVector : [Object, Indexable, Number, Vector, CartesianCoordinate] { | x y z |

	species { :self |
		Vector:/3
	}

	xy { :self |
		Vector(self.x, self.y)
	}

	xz { :self |
		Vector(self.x, self.z)
	}

	yz { :self |
		Vector(self.y, self.z)
	}

}

FourVector : [Object, Indexable] { | w x y z |

	= { :self :anObject |
		anObject.isFourVector & {
			self.asArray = anObject.asArray
		}
	}

	asArray { :self |
		[self.w, self.x, self.y, self.z]
	}

	asRecord { :self |
		(w: self.w, x: self.x, y: self.y, z: self.z)
	}

	isZero { :self |
		self.w = 0 & {
			self.x = 0 & {
				self.y = 0 & {
					self.z = 0
				}
			}
		}
	}

	size { :self |
		4
	}

	species { :self |
		Vector:/4
	}

	xy { :self |
		Vector(self.x, self.y)
	}

	xyz { :self |
		Vector(self.x, self.y, self.z)
	}

}


+Array {

	asVector { :self |
		self.size.caseOfOtherwise([
			{ 2 } -> { Vector(self[1], self[2]) },
			{ 3 } -> { Vector(self[1], self[2], self[3]) },
			{ 4 } -> { Vector(self[1], self[2], self[3], self[4]) }
		]) {
			'Array>>asVector: invalid size'.error
		}
	}

}

+Record {

	asFourVector { :self |
		Vector(self::w, self::x, self::y, self::z)
	}

	asThreeVector { :self |
		Vector(self::x, self::y, self::z)
	}

	asTwoVector { :self |
		Vector(self::x, self::y)
	}

	asVector { :self |
		self.includesAllIndices(['w','x','y','z']).if {
			self.asFourVector
		} {
			self.includesAllIndices(['x','y','z']).if {
				self.asThreeVector
			} {
				self.includesAllIndices(['x','y']).if {
					self.asTwoVector
				} {
					'Record>>asVector: not a vector'.error
				}
			}
		}
	}

}

+@Number {

	@ { :x :y |
		Vector(x, y)
	}

	adaptToRectangularCoordinateAndApply { :self :aPoint :aBlock:/2 |
		aBlock(aPoint, Vector(self, self))
	}

	asPoint { :self |
		Vector(self, self)
	}

	CartesianCoordinate { :x :y :z |
		Vector(x, y, z)
	}

	Point { :x :y |
		Vector(x, y)
	}

	RectangularCoordinate { :x :y |
		Vector(x, y)
	}

	Vector { :x :y |
		newTwoVector().initializeSlots(x, y)
	}

	Vector { :x :y :z |
		newThreeVector().initializeSlots(x, y, z)
	}

	Vector { :w :x :y :z |
		newFourVector().initializeSlots(w, x, y, z)
	}

}

+TwoTuple {

	asVector { :self |
		Vector(self.first, self.second)
	}

}

+ThreeTuple {

	asVector { :self |
		Vector(self.first, self.second, self.third)
	}

}

+FourTuple {

	asVector { :self |
		Vector(self.first, self.second, self.third, self.fourth)
	}

}
