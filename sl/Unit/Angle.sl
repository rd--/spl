Angle : [Object, Magnitude] { | radians |

	< { :self :anAngle |
		self.radians < anAngle.radians
	}

	asRadians { :self |
		self.radians
	}

	degrees { :self |
		self.radians / pi * 180
	}

	storeString { :self |
		self.radians.storeString ++ '.radians'
	}

}

+@Number {

	asRadians { :self |
		self
	}

	degrees { :self |
		(self / 180 * pi).radians
	}

	radians { :self |
		newAngle().initializeSlots(self)
	}

}
