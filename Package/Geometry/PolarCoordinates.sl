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

	asPlanarCoordinates { :self |
		PlanarCoordinates(self.x, self.y)
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
		self.storeStringAsInitializeSlots
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

+List {

	asPolarCoordinates { :self |
		let [r, theta] = self;
		PolarCoordinates(r, theta)
	}

	fromPolarCoordinates { :self |
		self.isVector.if {
			self.asPolarCoordinates.asPlanarCoordinates.asList
		} {
			self.collect(fromPolarCoordinates:/1)
		}
	}

	PolarCoordinates { :radius :theta |
		radius.withCollect(theta, PolarCoordinates:/2)
	}

	toPolarCoordinates { :self |
		self.isVector.if {
			self.asPlanarCoordinates.asPolarCoordinates.asList
		} {
			self.collect(toPolarCoordinates:/1)
		}
	}

}

+Record {

	asPolarCoordinates { :self |
		PolarCoordinates(
			self['r'],
			self['theta']
		)
	}

}
