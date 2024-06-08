{- Requires: CartesianCoordinates -}

@SphericalCoordinates {

	= { :self :anObject |
		self.compareBy(anObject, =)
	}

	~ { :self :anObject |
		self.compareBy(anObject, ~)
	}

	asSphericalCoordinates { :self |
		self
	}

	asCartesianCoordinates { :self |
		let r = self.r;
		let theta = self.theta;
		let phi = self.phi;
		CartesianCoordinates(
			r * theta.cos * phi.sin,
			r * theta.sin * phi.sin,
			r * phi.cos
		)
	}

	asList { :self |
		[self.r, self.theta, self.phi]
	}

	asRecord { :self |
		(r: self.r, theta: self.theta, phi: self.phi)
	}

	asTuple { :self |
		(self.r, self.theta, self.phi)
	}

	azimuth { :self |
		self.theta
	}

	compareBy { :self :anObject :aBlock:/2 |
		anObject.isSphericalCoordinates & {
			aBlock(self.r, anObject.r) & {
				aBlock(self.theta, anObject.theta) & {
					aBlock(self.phi, anObject.phi)
				}
			}
		}
	}

	elevation { :self |
		(self.phi - (pi / 2)).negated
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

	storeString { :self |
		[
			'SphericalCoordinates(',
			self.r.storeString,
			', ',
			self.theta.storeString,
			', ',
			self.phi.storeString,
			')'
		].join
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

SphericalCoordinates : [Object, SphericalCoordinates] { | r theta phi |

}

+@Number {

	IsoSphericalCoordinates { :r :theta :phi |
		newSphericalCoordinates().initializeSlots(r, phi, theta)
	}

	SphericalCoordinates { :r :theta :phi |
		newSphericalCoordinates().initializeSlots(r, theta, phi)
	}

}

+[List, Tuple] {

	asSphericalCoordinates { :self |
		let [r, theta, phi] = self;
		SphericalCoordinates(r, theta, phi)
	}

	fromSphericalCoordinates { :self |
		self.isVector.if {
			self.asSphericalCoordinates.asCartesianCoordinates.asList
		} {
			self.collect(fromSphericalCoordinates:/1)
		}
	}

	toSphericalCoordinates { :self |
		self.isVector.if {
			self.asCartesianCoordinates.asSphericalCoordinates.asList
		} {
			self.collect(toSphericalCoordinates:/1)
		}
	}

}

+Record {

	asSphericalCoordinates { :self |
		SphericalCoordinates(self::r, self::theta, self::phi)
	}

}

+CartesianCoordinates {

	asSphericalCoordinates { :self |
		let x = self.x;
		let y = self.y;
		let z = self.z;
		SphericalCoordinates(
			(x.squared + y.squared + z.squared).sqrt,
			y.atan2(x),
			(x.squared + y.squared).sqrt.atan2(z)
		)
	}

	azimuth { :self |
		self.theta
	}

	inclination { :self |
		self.phi
	}

	phi { :self |
		(self.x.squared + self.y.squared).sqrt.atan2(self.z)
	}

	r { :self |
		(self.x.squared + self.y.squared + self.z.squared).sqrt
	}

	radius { :self |
		self.r
	}

	rho { :self |
		self.r
	}

	theta { :self |
		self.y.atan2(self.x)
	}

}
