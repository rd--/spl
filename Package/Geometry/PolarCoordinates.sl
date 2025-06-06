PolarCoordinates : [Object] { | coordinates |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	asList { :self |
		self.coordinates.copy
	}

	asPolarCoordinates { :self |
		self
	}

	asRecord { :self |
		(r: self.r, theta: self.theta)
	}

	asPlanarCoordinates { :self |
		PlanarCoordinates([self.x, self.y])
	}

	isOrigin { :self |
		self.r.isZero
	}

	phi { :self |
		self.theta
	}

	r { :self |
		self.coordinates[1]
	}

	radius { :self |
		self.coordinates[1]
	}

	rho { :self |
		self.coordinates[1]
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	theta { :self |
		self.coordinates[2]
	}

	x { :self |
		let [r, theta] = self.coordinates;
		r * theta.cos
	}

	y { :self |
		let [r, theta] = self.coordinates;
		r * theta.sin
	}

}

+List {

	PolarCoordinates { :self |
		self.isVector.if {
			let [r, theta] = self;
			newPolarCoordinates().initializeSlots([r, theta])
		} {
			self.collect(PolarCoordinates:/1)
		}
	}

}

+List {

	asPolarCoordinates { :self |
		PolarCoordinates(self)
	}

	fromPolarCoordinates { :self |
		self.isVector.if {
			let [r, theta] = self;
			[r * theta.cos, r * theta.sin]
		} {
			self.collect(fromPolarCoordinates:/1)
		}
	}

	toPolarCoordinates { :self |
		self.isVector.if {
			let [x, y] = self;
			[(x.squared + y.squared).sqrt, atan2(y, x)]
		} {
			self.collect(toPolarCoordinates:/1)
		}
	}

}

+Record {

	asPolarCoordinates { :self |
		PolarCoordinates(
			[
				self['r'],
				self['theta']
			]
		)
	}

}
