{- Requires: RectangularCoordinates CartesianCoordinates -}

FourVector : [Object] { | w x y z |

	= { :self :anObject |
		anObject.isFourVector & {
			self.asList = anObject.asList
		}
	}

	asList { :self |
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

	xy { :self |
		RectangularCoordinates(self.x, self.y)
	}

	xyz { :self |
		CartesianCoordinates(self.x, self.y, self.z)
	}

}

+@Number {

	FourVector { :w :x :y :z |
		newFourVector().initializeSlots(w, x, y, z)
	}

}

+List {

	asFourVector { :self |
		let [w, x, y, z] = self;
		FourVector(w, x, y, z)
	}

}

+Record {

	asFourVector { :self |
		FourVector(self::w, self::x, self::y, self::z)
	}

}

+Tuple {

	asFourVector { :self |
		FourVector(self.first, self.second, self.third, self.fourth)
	}

}
