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
		|( r = self.r, theta = self.theta, phi = self.phi )|
		Vector3(
			r * theta.sin * phi.cos,
			r * theta.sin * phi.sin,
			r * theta.cos
		)
	}

	asRecord { :self |
		(r: self.r, theta: self.theta, phi: self.phi)
	}

	azimuth { :self |
		self.phi
	}

	elevation { :self |
		(self.theta - (pi / 2)).negated
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isSphericalCoordinate & {
			aBlock(self.r, anObject.r)
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
		self.r
	}

	rho { :self |
		self.r
	}

	x { :self |
		self.r * self.theta.sin * self.phi.cos
	}

	xy { :self |
		Vector2(self.x, self.y)
	}

	y { :self |
		self.r * self.theta.sin * self.phi.sin
	}

	z { :self |
		self.r * self.theta.cos
	}

}

SphericalCoordinate : [Object, SphericalCoordinate] { | r theta phi |

}

+@Number {

	SphericalCoordinate { :r :theta :phi |
		newSphericalCoordinate().initializeSlots(r, theta, phi)
	}

}

+Array {

	asSphericalCoordinate { :self |
		| [r, theta, phi] = self; |
		SphericalCoordinate(r, theta, phi)
	}

}

+Record {

	asSphericalCoordinate { :self |
		SphericalCoordinate(self::r, self::theta, self::phi)
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
