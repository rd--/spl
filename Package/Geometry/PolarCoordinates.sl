PolarCoordinates : [Object, Store, Equal] { | coordinates |

	isOrigin { :self |
		self.r.isZero
	}

	[List, polarCoordinatesToList] { :self |
		self.coordinates.copy
	}

	phi { :self |
		self.theta
	}

	PlanarCoordinates { :self |
		PlanarCoordinates([self.x, self.y])
	}

	PolarCoordinates { :self |
		self
	}

	r { :self |
		self.coordinates[1]
	}

	radius { :self |
		self.coordinates[1]
	}

	Record { :self |
		(r: self.r, theta: self.theta)
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
			self.collect(PolarCoordinates/1)
		}
	}

}

+List {

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

	PolarCoordinates { :self |
		PolarCoordinates[
				self['r'],
				self['theta']
		]
	}

}
