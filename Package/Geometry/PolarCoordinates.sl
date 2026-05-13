PolarCoordinates : [Object, Storeable, Equatable] { | coordinates |

	asPolarCoordinates { :self |
		self
	}

	asRecord { :self |
		(r: self.r, theta: self.theta)
	}

	asPlanarCoordinates { :self |
		PlanarCoordinates([self.x, self.y])
	}

	isOrigin { :self |
		self.r.isZero
	}

	phi { :self |
		self.theta
	}

	[polarCoordinatesToList, asList] { :self |
		self.coordinates.copy
	}

	r { :self |
		self.coordinates[1]
	}

	radius { :self |
		self.coordinates[1]
	}

	rho { :self |
		self.coordinates[1]
	}

	theta { :self |
		self.coordinates[2]
	}

	x { :self |
		let [r, theta] = self.coordinates;
		r * theta.cos
	}

	y { :self |
		let [r, theta] = self.coordinates;
		r * theta.sin
	}

}

+List {

	PolarCoordinates { :self |
		self.isVector.if {
			let [r, theta] = self;
			newPolarCoordinates().initializeSlots([r, theta])
		} {
			self.collect(PolarCoordinates:/1)
		}
	}

}

+List {

	asPolarCoordinates { :self |
		PolarCoordinates(self)
	}

	fromPolarCoordinates { :self |
		self.atVectorOrElementwise { :v |
			let [r, theta] = v;
			[r * theta.cos, r * theta.sin]
		}
	}

	toPolarCoordinates { :self :rule |
		rule.caseOf(
			[
				'Signed' -> { self.toPolarCoordinates },
				'Unsigned' -> {
					self.atVectorOrElementwise { :v |
						let [x, y] = v;
						[(x.square + y.square).sqrt, atan2(y, x) % 2.pi]
					}
				}
			]
		)
	}

	toPolarCoordinates { :self |
		self.atVectorOrElementwise { :v |
			let [x, y] = v;
			[(x.square + y.square).sqrt, atan2(y, x)]
		}
	}

}

+Record {

	asPolarCoordinates { :self |
		PolarCoordinates(
			[
				self['r'],
				self['theta']
			]
		)
	}

}
