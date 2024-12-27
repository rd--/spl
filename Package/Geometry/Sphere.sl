Sphere : [Object] { | center radius |

	= { :self :anObject |
		anObject.isSphere & {
			self.center = anObject.center & {
				self.radius = anObject.radius
			}
		}
	}

	area { :self |
		self.surfaceArea
	}

	diameter { :self |
		self.radius * 2
	}

	randomSurfacePoint { :self :aRandom |
		let c = self.center;
		let r = self.radius;
		let z = aRandom.randomReal(r.negated, r, []);
		let phi = aRandom.randomReal(0, 2.pi, []);
		let m = (r.squared - z.squared).sqrt;
		let x = m * phi.cos;
		let y = m * phi.sin;
		[x, y, z] + c
	}

	randomSurfacePoint { :self :aRandom :shape |
		{ self.randomSurfacePoint(aRandom) } ! shape
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	surfaceArea { :self |
		(self.radius.squared * 4).pi
	}

	volume { :self |
		(self.radius.cubed * 4 / 3).pi
	}

	translateBy { :self :factor |
		Sphere(self.center + factor, self.radius)
	}

	x { :self |
		self.center[1]
	}

	y { :self |
		self.center[2]
	}

	z { :self |
		self.center[3]
	}

}

+@Sequence {

	Sphere { :center :radius |
		newSphere().initializeSlots(center, radius)
	}

}
