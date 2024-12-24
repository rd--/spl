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

	storeString { :self |
		[
			'Sphere(',
			self.center.storeString,
			', ',
			self.radius.storeString,
			')'
		].join('')
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
