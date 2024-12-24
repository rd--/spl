/* Requires: CartesianCoordinates */

CylindricalCoordinates : [Object] { | rho phi z |

	asList { :self |
		[self.rho, self.phi, self.z]
	}

	asCartesianCoordinates { :self |
		CartesianCoordinates(self.x, self.y, self.z)
	}

	asRecord { :self |
		(rho: self.rho, phi: self.phi, z: self.z)
	}

	asTuple { :self |
		(self.rho, self.phi, self.z)
	}

	r { :self |
		self.rho
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

}

+@Number {

	CylindricalCoordinates { :rho :phi :z |
		newCylindricalCoordinates().initializeSlots(rho, phi, z)
	}

}

+[List, Tuple] {

	asCylindricalCoordinates { :self |
		let [rho, phi, z] = self;
		CylindricalCoordinates(rho, phi, z)
	}

	fromCylindricalCoordinates { :self |
		let [rho, phi, z] = self;
		let x = rho * phi.cos;
		let y = rho * phi.sin;
		[x y z]
	}

	toCylindricalCoordinates { :self |
		let [x, y, z] = self;
		let rho = (x.squared + y.squared).sqrt;
		let phi = y.atan2(x);
		[rho phi z]
	}

}

+Record {

	asCylindricalCoordinates { :self |
		CylindricalCoordinates(
			self['rho'],
			self['phi'],
			self['z']
		)
	}



}

+CartesianCoordinates {

	asCylindricalCoordinates { :self |
		let x = self.x;
		let y = self.y;
		let z = self.z;
		CylindricalCoordinates(
			(x.squared + y.squared).sqrt,
			y.atan2(x),
			z
		)
	}

}
