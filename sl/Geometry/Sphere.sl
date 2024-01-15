{- Requires: CartesianCoordinate -}

Sphere : [Object] { | center radius |

	= { :self :anObject |
		anObject.isSphere & {
			self.center = anObject.center & {
				self.radius = anObject.radius
			}
		}
	}

	diameter { :self |
		self.radius * 2
	}

	storeString { :self |
		[
			'Sphere(',
				self.center.storeString,
				', ',
				self.radius.storeString,
			')'
		].join
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
		self.center.x
	}

	y { :self |
		self.center.y
	}

	z { :self |
		self.center.z
	}

}

+CartesianCoordinate {

	Sphere { :center :radius |
		newSphere().initializeSlots(center, radius)
	}

}
