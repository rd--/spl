PolarCoordinates : [Object] { | r theta |

	= { :self :anObject |
		anObject.isPolarCoordinates & {
			self.r = anObject.r & {
				self.theta = anObject.theta
			}
		}
	}

	asList { :self |
		[self.r, self.theta]
	}

	asPolarCoordinates { :self |
		self
	}

	asRecord { :self |
		(r: self.r, theta: self.theta)
	}

	asPlanarCoordinates { :self |
		PlanarCoordinates(self.x, self.y)
	}

	asTuple { :self |
		(self.r, self.theta)
	}

	phi { :self |
		self.theta
	}

	radius { :self |
		self.r
	}

	rho { :self |
		self.r
	}

	storeString { :self |
		[
			'PolarCoordinates(',
			self.r.storeString,
			', ',
			self.theta.storeString,
			')'
		].join
	}

	x { :self |
		self.r * self.theta.cos
	}

	y { :self |
		self.r * self.theta.sin
	}

}

+@Number {

	PolarCoordinates { :r :theta |
		newPolarCoordinates().initializeSlots(r, theta)
	}

}

+[List, Tuple] {

	asPolarCoordinates { :self |
		let [r, theta] = self;
		PolarCoordinates(r, theta)
	}

	fromPolarCoordinates { :self |
		self.isVector.if {
			self.asPolarCoordinates.asPlanarCoordinates.asList
		} {
			self.collect(fromPolarCoordinates:/1)
		}
	}

	PolarCoordinates { :radius :theta |
		theta.adaptToCollectionAndApply(radius, PolarCoordinates:/2)
	}

	toPolarCoordinates { :self |
		self.isVector.if {
			self.asPlanarCoordinates.asPolarCoordinates.asList
		} {
			self.collect(toPolarCoordinates:/1)
		}
	}

}

+Record {

	asPolarCoordinates { :self |
		PolarCoordinates(self::r, self::theta)
	}

}
