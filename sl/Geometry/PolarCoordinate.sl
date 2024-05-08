PolarCoordinate : [Object] { | r theta |

	= { :self :anObject |
		anObject.isPolarCoordinate & {
			self.r = anObject.r & {
				self.theta = anObject.theta
			}
		}
	}

	asList { :self |
		[self.r, self.theta]
	}

	asPolarCoordinate { :self |
		self
	}

	asRecord { :self |
		(r: self.r, theta: self.theta)
	}

	asRectangularCoordinate { :self |
		RectangularCoordinate(self.x, self.y)
	}

	asTuple { :self |
		(self.r, self.theta)
	}

	phi { :self |
		self.theta
	}

	radius { :self |
		self.r
	}

	rho { :self |
		self.r
	}

	storeString { :self |
		[
			'PolarCoordinate(',
			self.r.storeString,
			', ',
			self.theta.storeString,
			')'
		].join
	}

	x { :self |
		self.r * self.theta.cos
	}

	y { :self |
		self.r * self.theta.sin
	}

}

+@Number {

	PolarCoordinate { :r :theta |
		newPolarCoordinate().initializeSlots(r, theta)
	}

}

+[List, Tuple] {

	asPolarCoordinate { :self |
		let [r, theta] = self;
		PolarCoordinate(r, theta)
	}

	fromPolarCoordinates { :self |
		self.isVector.if {
			self.asPolarCoordinate.asRectangularCoordinate.asList
		} {
			self.collect(fromPolarCoordinates:/1)
		}
	}

	toPolarCoordinates { :self |
		self.isVector.if {
			self.asRectangularCoordinate.asPolarCoordinate.asList
		} {
			self.collect(toPolarCoordinates:/1)
		}
	}

}

+Record {

	asPolarCoordinate { :self |
		PolarCoordinate(self::r, self::theta)
	}

}
