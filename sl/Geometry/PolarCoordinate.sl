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

	asTuple { :self |
		(self.r, self.theta)
	}

	phi { :self |
		self.theta
	}

	rho { :self |
		self.r
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

+List {

	asPolarCoordinate { :self |
		let [r, theta] = self;
		PolarCoordinate(r, theta)
	}

}

+Record {

	asPolarCoordinate { :self |
		PolarCoordinate(self::r, self::theta)
	}

}

+TwoTuple {

	asPolarCoordinate { :self |
		PolarCoordinate(self.first, self.second)
	}

}
