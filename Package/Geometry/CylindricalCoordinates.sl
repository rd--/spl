/* Requires: CartesianCoordinates */

CylindricalCoordinates : [Object, Equal] {

	| coordinates |

	CartesianCoordinates { :self |
		CartesianCoordinates(
			self.coordinates.fromCylindricalCoordinates
		)
	}

	[List, cylindricalCoordinatesToList] { :self |
		self.coordinates.copy
	}

	[Record, cylindricalCoordinatesToRecord] { :self |
		let [rho, phi, z] = self.coordinates;
		(rho: rho, phi: phi, z: z)
	}

	phi { :self |
		self.coordinates[2]
	}

	radius { :self |
		self.rho
	}

	rho { :self |
		self.coordinates[1]
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

	[CylindricalCoordinates, listToCylindricalCoordinates] { :self |
		self.atVectorOrElementwise { :each |
			let [rho, phi, z] = each;
			newCylindricalCoordinates().initializeSlots(each)
		}
	}

	fromCylindricalCoordinates { :self |
		self.isVector.if {
			let [rho, phi, z] = self;
			let x = rho * phi.cos;
			let y = rho * phi.sin;
			[x y z]
		} {
			self.collect(fromCylindricalCoordinates/1)
		}
	}

	toCylindricalCoordinates { :self |
		self.isVector.if {
			let [x, y, z] = self;
			let rho = (x.square + y.square).sqrt;
			let phi = y.atan2(x);
			[rho phi z]
		} {
			self.collect(toCylindricalCoordinates/1)
		}
	}

}

+Record {

	CylindricalCoordinates { :self |
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

	CylindricalCoordinates { :self |
		CylindricalCoordinates(
			self.coordinates.toCylindricalCoordinates
		)
	}

}
