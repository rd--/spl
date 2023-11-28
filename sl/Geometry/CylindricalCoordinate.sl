CylindricalCoordinate : [Object] { | rho phi z |

	asArray { :self |
		[self.rho, self.phi, self.z]
	}

	asCartesianCoordinate { :self |
		Vector3(self.x, self.y, self.z)
	}

	asRecord { :self |
		(rho: self.rho, phi: self.phi, z: self.z)
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

+Array {

	asCylindricalCoordinate { :self |
		| [rho, phi, z] = self; |
		CylindricalCoordinate(rho, phi, z)
	}

}

+Record {

	asCylindricalCoordinate { :self |
		CylindricalCoordinate(self::rho, self::phi, self::z)
	}

}

+@CartesianCoordinate {

	asCylindricalCoordinate { :self |
		|( x = self.x, y = self.y, z = self.z )|
		CylindricalCoordinate(
			(x.squared + y.squared).sqrt,
			y.atan2(x),
			z
		)
	}

}

