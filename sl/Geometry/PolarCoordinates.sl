PolarCoordinates : [Object] { | r theta |

	= { :self :anObject |
		anObject.isPolarCoordinates & {
			self.r = anObject.r & {
				self.theta = anObject.theta
			}
		}
	}

	asList { :self |
		[self.r, self.theta]
	}

	asPolarCoordinates { :self |
		self
	}

	asRecord { :self |
		(r: self.r, theta: self.theta)
	}

	asRectangularCoordinates { :self |
		RectangularCoordinates(self.x, self.y)
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
			'PolarCoordinates(',
				self.r.storeString,
				', ',
				self.theta.storeString,
			')'
		].stringJoin
	}

	x { :self |
		self.r * self.theta.cos
	}

	y { :self |
		self.r * self.theta.sin
	}

}

+@Number {

	PolarCoordinates { :r :theta |
		newPolarCoordinates().initializeSlots(r, theta)
	}

}

+[List, Tuple] {

	asPolarCoordinates { :self |
		let [r, theta] = self;
		PolarCoordinates(r, theta)
	}

	fromPolarCoordinates { :self |
		self.isVector.if {
			self.asPolarCoordinates.asRectangularCoordinates.asList
		} {
			self.collect(fromPolarCoordinates:/1)
		}
	}

	toPolarCoordinates { :self |
		self.isVector.if {
			self.asRectangularCoordinates.asPolarCoordinates.asList
		} {
			self.collect(toPolarCoordinates:/1)
		}
	}

}

+Record {

	asPolarCoordinates { :self |
		PolarCoordinates(self::r, self::theta)
	}

}
