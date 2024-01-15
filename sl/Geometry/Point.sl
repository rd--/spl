{- Requires: RectangularCoordinate CartesianCoordinate FourVector -}

+RectangularCoordinate {

	asPoint { :self |
		self
	}

	isPoint { :self |
		true
	}

	printString { :self |
		[self.x, '@', self.y].join
	}

}

+CartesianCoordinate {

	asPoint { :self |
		self
	}

	isPoint { :self |
		true
	}

}

+@Object {

	isPoint { :self |
		false
	}

}

+@Number {

	@ { :x :y |
		RectangularCoordinate(x, y)
	}

	asPoint { :self |
		RectangularCoordinate(self, self)
	}

	Point { :x :y |
		RectangularCoordinate(x, y)
	}

	Point { :x :y :z |
		CartesianCoordinate(x, y, z)
	}

	Point { :w :x :y :z |
		FourVector(w, x, y, z)
	}

}

+Array {

	asPoint { :self |
		self.size.caseOfOtherwise([
			{ 2 } -> { self.asRectangularCoordinate },
			{ 3 } -> { self.asCartesianCoordinate },
			{ 4 } -> { self.asFourVector }
		]) {
			'Array>>asPoint: invalid size'.error
		}
	}

}

+Record {

	asPoint { :self |
		self.includesAllIndices(['w','x','y','z']).if {
			self.asFourVector
		} {
			self.includesAllIndices(['x','y','z']).if {
				self.asCartesianCoordinate
			} {
				self.includesAllIndices(['x','y']).if {
					self.asRectangularCoordinate
				} {
					'Record>>asPoint: invalid record'.error
				}
			}
		}
	}

}

+TwoTuple {

	asPoint { :self |
		RectangularCoordinate(self.first, self.second)
	}

}

+ThreeTuple {

	asPoint { :self |
		CartesianCoordinate(self.first, self.second, self.third)
	}

}

+FourTuple {

	asPoint { :self |
		FourVector(self.first, self.second, self.third, self.fourth)
	}

}
