{- Requires: RectangularCoordinates -}

Circle : [Object] { | center radius |

	= { :self :anObject |
		anObject.isCircle & {
			self.center = anObject.center & {
				self.radius = anObject.radius
			}
		}
	}

	arcLength { :self |
		2.pi
	}

	area { :self |
		self.radius.squared.pi
	}

	circumference { :self |
		(self.radius * 2).pi
	}

	diameter { :self |
		self.radius * 2
	}

	r { :self |
		self.radius
	}

	storeString { :self |
		[
			'Circle(',
				self.center.storeString,
				', ',
				self.radius.storeString,
			')'
		].join
	}

	translateBy { :self :factor |
		Circle(self.center + factor, self.radius)
	}

	x { :self |
		self.center.x
	}

	y { :self |
		self.center.y
	}

}

+[List, RectangularCoordinates] {

	Circle { :center :radius |
		newCircle().initializeSlots(center.asRectangularCoordinates, radius)
	}

}
