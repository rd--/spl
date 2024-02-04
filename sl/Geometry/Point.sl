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

+List {

	asPoint { :self |
		self.size.caseOfOtherwise([
			{ 2 } -> { self.asRectangularCoordinate },
			{ 3 } -> { self.asCartesianCoordinate },
			{ 4 } -> { self.asFourVector }
		]) {
			'List>>asPoint: invalid size'.error
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

+Tuple {

	asPoint { :self |
		self.size.caseOfOtherwise([
			{ 2 } -> { RectangularCoordinate(self.first, self.second) },
			{ 3 } -> { CartesianCoordinate(self.first, self.second, self.third) },
			{ 4 } -> { FourVector(self.first, self.second, self.third, self.fourth) }
		]) {
			'Tuple>>asPoint'.error
		}
	}

}
