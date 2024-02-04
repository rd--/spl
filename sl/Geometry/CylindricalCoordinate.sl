{- Requires: CartesianCoordinate -}

CylindricalCoordinate : [Object] { | rho phi z |

	asList { :self |
		[self.rho, self.phi, self.z]
	}

	asCartesianCoordinate { :self |
		CartesianCoordinate(self.x, self.y, self.z)
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

	CylindricalCoordinate { :rho :phi :z |
		newCylindricalCoordinate().initializeSlots(rho, phi, z)
	}

}

+[List, Tuple] {

	asCylindricalCoordinate { :self |
		let [rho, phi, z] = self;
		CylindricalCoordinate(rho, phi, z)
	}

}

+Record {

	asCylindricalCoordinate { :self |
		CylindricalCoordinate(self::rho, self::phi, self::z)
	}

}

+CartesianCoordinate {

	asCylindricalCoordinate { :self |
		let x = self.x;
		let y = self.y;
		let z = self.z;
		CylindricalCoordinate(
			(x.squared + y.squared).sqrt,
			y.atan2(x),
			z
		)
	}

}
