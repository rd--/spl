{- Requires: RectangularCoordinates CartesianCoordinates FourVector -}

+RectangularCoordinates {

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

+CartesianCoordinates {

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
		RectangularCoordinates(x, y)
	}

	Point { :x :y |
		RectangularCoordinates(x, y)
	}

	Point { :x :y :z |
		CartesianCoordinates(x, y, z)
	}

	Point { :w :x :y :z |
		FourVector(w, x, y, z)
	}

}

+List {

	asPoint { :self |
		self.size.caseOfOtherwise([
			{ 2 } -> { self.asRectangularCoordinates },
			{ 3 } -> { self.asCartesianCoordinates },
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
				self.asCartesianCoordinates
			} {
				self.includesAllIndices(['x','y']).if {
					self.asRectangularCoordinates
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
			{ 2 } -> { RectangularCoordinates(self.first, self.second) },
			{ 3 } -> { CartesianCoordinates(self.first, self.second, self.third) },
			{ 4 } -> { FourVector(self.first, self.second, self.third, self.fourth) }
		]) {
			'Tuple>>asPoint'.error
		}
	}

}
