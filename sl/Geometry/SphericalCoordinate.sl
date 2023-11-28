@SphericalCoordinate {

	= { :self :anObject |
		self.equalBy(anObject, equals:/2)
	}

	~ { :self :anObject |
		self.equalBy(anObject, tilde:/2)
	}

	asSphericalCoordinate { :self |
		self
	}

	asCartesianCoordinate { :self |
		|( rho = self.rho, theta = self.theta, phi = self.phi )|
		Vector3(
			rho * theta.sin * phi.cos,
			rho * theta.sin * phi.sin,
			rho * theta.cos
		)
	}

	azimuth { :self |
		self.phi
	}

	elevation { :self |
		(self.theta - (pi / 2)).negated
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isSphericalCoordinate & {
			aBlock(self.rho, anObject.rho)
		} & {
			aBlock(self.theta, anObject.theta)
		} & {
			aBlock(self.phi, anObject.phi)
		}
	}

	inclination { :self |
		self.theta
	}

	radius { :self |
		self.rho
	}

	x { :self |
		self.rho * self.theta.sin * self.phi.cos
	}

	y { :self |
		self.rho * self.theta.sin * self.phi.sin
	}

	z { :self |
		self.rho * self.theta.cos
	}

}

SphericalCoordinate : [Object, SphericalCoordinate] { | rho theta phi |

}

+@Number {

	SphericalCoordinate { :rho :theta :phi |
		newSphericalCoordinate().initializeSlots(rho, theta, phi)
	}

}

+Array {

	asSphericalCoordinate { :self |
		| [rho, theta, phi] = self; |
		SphericalCoordinate(rho, theta, phi)
	}

}

+Record {

	asSphericalCoordinate { :self |
		SphericalCoordinate(self::rho, self::theta, self::phi)
	}

}

+@CartesianCoordinate {

	asSphericalCoordinate { :self |
		|( x = self.x, y = self.y, z = self.z )|
		SphericalCoordinate(
			(x.squared + y.squared + z.squared).sqrt,
			(x.squared + y.squared).sqrt.atan2(z),
			y.atan2(x)
		)
	}

}
