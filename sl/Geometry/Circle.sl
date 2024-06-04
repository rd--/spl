Circle : [Object] { | center radius |

	= { :self :anObject |
		anObject.isCircle & {
			self.center = anObject.center & {
				self.radius = anObject.radius
			}
		}
	}

	arcLength { :self |
		self.circumference
	}

	area { :self |
		self.radius.squared.pi
	}

	centroid { :self |
		self.center
	}

	circumference { :self |
		(self.radius * 2).pi
	}

	diameter { :self |
		self.radius * 2
	}

	perimeter { :self |
		self.circumference
	}

	r { :self |
		self.radius
	}

	randomPoint { :self :shape |
		{
			let theta = system.randomReal(0, 2.pi, []);
			self.center + [self.radius, theta].fromPolarCoordinates
		} ! shape
	}

	storeString { :self |
		[
			'Circle(',
				self.center.storeString,
				', ',
				self.radius.storeString,
			')'
		].stringJoin
	}

	translateBy { :self :factor |
		Circle(self.center + factor, self.radius)
	}

	x { :self |
		self.center[1]
	}

	y { :self |
		self.center[2]
	}

}

+@Sequence {

	Circle { :center :radius |
		newCircle().initializeSlots(center, radius)
	}

}
