/* Requires: CartesianCoordinates */

CylindricalCoordinates : [Object, Equatable] { | coordinates |

	asList { :self |
		self.coordinates.copy
	}

	asCartesianCoordinates { :self |
		CartesianCoordinates(
			self.coordinates.fromCylindricalCoordinates
		)
	}

	asRecord { :self |
		let [rho, phi, z] = self.coordinates;
		(rho: rho, phi: phi, z: z)
	}

	radius { :self |
		self.rho
	}

	rho { :self |
		self.coordinates[1]
	}

	phi { :self |
		self.coordinates[2]
	}

	theta { :self |
		self.phi
	}

	x { :self |
		self.rho * self.phi.cos
	}

	y { :self |
		self.rho * self.phi.sin
	}

	z { :self |
		self.coordinates[3]
	}

}

+List {

	asCylindricalCoordinates { :self |
		CylindricalCoordinates(self)
	}

	CylindricalCoordinates { :self |
		let [rho, phi, z] = self;
		newCylindricalCoordinates().initializeSlots(self)
	}

	fromCylindricalCoordinates { :self |
		self.isVector.if {
			let [rho, phi, z] = self;
			let x = rho * phi.cos;
			let y = rho * phi.sin;
			[x y z]
		} {
			self.collect(fromCylindricalCoordinates:/1)
		}
	}

	toCylindricalCoordinates { :self |
		self.isVector.if {
			let [x, y, z] = self;
			let rho = (x.square + y.square).sqrt;
			let phi = y.atan2(x);
			[rho phi z]
		} {
			self.collect(toCylindricalCoordinates:/1)
		}
	}

}

+Record {

	asCylindricalCoordinates { :self |
		CylindricalCoordinates(
			[
				self['rho'],
				self['phi'],
				self['z']
			]
		)
	}

}

+CartesianCoordinates {

	asCylindricalCoordinates { :self |
		CylindricalCoordinates(
			self.coordinates.toCylindricalCoordinates
		)
	}

}
