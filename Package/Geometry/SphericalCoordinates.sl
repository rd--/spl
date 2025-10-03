/* Requires: CartesianCoordinates */

SphericalCoordinates : [Object, Copyable, Equatable] { | coordinates |

	asSphericalCoordinates { :self |
		self
	}

	asCartesianCoordinates { :self |
		CartesianCoordinates(
			self.coordinates.fromSphericalCoordinates
		)
	}

	asList { :self |
		self.coordinates.copy
	}

	asRecord { :self |
		let [r, theta, phi] = self.coordinates;
		(radius: r, theta: theta, phi: phi)
	}

	azimuth { :self |
		self.theta
	}

	elevation { :self |
		(self.phi - 0.5.pi).negate
	}

	inclination { :self |
		self.phi
	}

	phi { :self |
		self.coordinates[3]
	}

	r { :self |
		self.coordinates[1]
	}

	radius { :self |
		self.r
	}

	rho { :self |
		self.radius
	}

	theta { :self |
		self.coordinates[2]
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	x { :self |
		let [r, theta, phi] = self.coordinates;
		r * theta.cos * phi.sin
	}

	y { :self |
		let [r, theta, phi] = self.coordinates;
		r * theta.sin * phi.sin
	}

	z { :self |
		let [r, theta, phi] = self.coordinates;
		r * phi.cos
	}

}

+List {

	IsoSphericalCoordinates { :self |
		let [r, theta, phi] = self;
		SphericalCoordinates([r, phi, theta])
	}

	SphericalCoordinates { :self |
		let [r, theta, phi] = self;
		newSphericalCoordinates().initializeSlots([r, theta, phi])
	}

}

+List {

	asSphericalCoordinates { :self |
		SphericalCoordinates(self.asList)
	}

	fromSphericalCoordinates { :self |
		self.isVector.if {
			let [r, theta, phi] = self;
			[
				r * theta.cos * phi.sin,
				r * theta.sin * phi.sin,
				r * phi.cos
			]
		} {
			self.collect(fromSphericalCoordinates:/1)
		}
	}

	toSphericalCoordinates { :self |
		self.isVector.if {
			let [x, y, z] = self;
			[
				(x.square + y.square + z.square).sqrt,
				y.atan2(x),
				(x.square + y.square).sqrt.atan2(z)
			]
		} {
			self.collect(toSphericalCoordinates:/1)
		}
	}

}

+Record {

	asSphericalCoordinates { :self |
		SphericalCoordinates([
			self['r'],
			self['theta'],
			self['phi']
		])
	}

}

+CartesianCoordinates {

	asSphericalCoordinates { :self |
		SphericalCoordinates(
			self.coordinates.toSphericalCoordinates
		)
	}

	azimuth { :self |
		self.theta
	}

	inclination { :self |
		self.phi
	}

	phi { :self |
		(self.x.square + self.y.square).sqrt.atan2(self.z)
	}

	radius { :self |
		(self.x.square + self.y.square + self.z.square).sqrt
	}

	rho { :self |
		self.radius
	}

	theta { :self |
		self.y.atan2(self.x)
	}

}
