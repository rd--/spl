@SphericalCoordinate {

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	asSphericalCoordinate { :self |
		self
	}

	asCartesianCoordinate { :self |
		let r = self.r;
		let theta = self.theta;
		let phi = self.phi;
		Vector3(
			r * theta.cos * phi.sin,
			r * theta.sin * phi.sin,
			r * phi.cos
		)
	}

	asRecord { :self |
		(r: self.r, theta: self.theta, phi: self.phi)
	}

	azimuth { :self |
		self.theta
	}

	elevation { :self |
		(self.phi - (pi / 2)).negated
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isSphericalCoordinate & {
			aBlock(self.r, anObject.r) & {
				aBlock(self.theta, anObject.theta) & {
					aBlock(self.phi, anObject.phi)
				}
			}
		}
	}

	inclination { :self |
		self.phi
	}

	radius { :self |
		self.r
	}

	rho { :self |
		self.r
	}

	x { :self |
		self.r * self.theta.cos * self.phi.sin
	}

	y { :self |
		self.r * self.theta.sin * self.phi.sin
	}

	z { :self |
		self.r * self.phi.cos
	}

}

SphericalCoordinate : [Object, SphericalCoordinate] { | r theta phi |

}

+@Number {

	IsoSphericalCoordinate { :r :theta :phi |
		newSphericalCoordinate().initializeSlots(r, phi, theta)
	}

	SphericalCoordinate { :r :theta :phi |
		newSphericalCoordinate().initializeSlots(r, theta, phi)
	}

}

+Array {

	asSphericalCoordinate { :self |
		let [r, theta, phi] = self;
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
		let x = self.x;
		let y = self.y;
		let z = self.z;
		SphericalCoordinate(
			(x.squared + y.squared + z.squared).sqrt,
			y.atan2(x),
			(x.squared + y.squared).sqrt.atan2(z)
		)
	}

}
