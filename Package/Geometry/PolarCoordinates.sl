PolarCoordinates : [Object, Copy, Store, Equal] {

	| rho phi |

	[List, polarCoordinatesToList] { :self |
		self.coordinates
	}

	PlanarCoordinates { :self |
		PlanarCoordinates(self.x, self.y)
	}

	PolarCoordinates { :self |
		self.copy
	}

	Record { :self |
		(rho: self.rho, phi: self.phi)
	}

	coordinates { :self |
		[self.rho, self.phi]
	}

	isOrigin { :self |
		self.rho.isZero
	}

	x { :self |
		self.rho * self.phi.cos
	}

	y { :self |
		self.rho * self.phi.sin
	}

}

+@Number {

	PolarCoordinates { :rho :phi |
		phi.isNumber.if {
			newPolarCoordinates().initializeSlots(rho, phi)
		} {
			phi.adaptToNumberAndApply(rho, PolarCoordinates/2)
		}
	}

}

+List {

	PolarCoordinates { :rho :phi |
		phi.adaptToCollectionAndApply(rho, PolarCoordinates/2)
	}

	PolarCoordinates { :self |
		self.atVectorOrElementwise { :each |
			let [rho, phi] = each;
			PolarCoordinates(rho, phi)
		}
	}

}

+List {

	fromPolarCoordinates { :self |
		self.atVectorOrElementwise { :v |
			let [rho, phi] = v;
			[rho * phi.cos, rho * phi.sin]
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
		let (rho: rho, phi: phi) = self;
		PolarCoordinates(rho, phi)
	}

}
