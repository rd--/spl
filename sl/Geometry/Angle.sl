Angle : [Object, Magnitude] { | radians |

	= { :self :anAngle |
		self.radians = anAngle.radians
	}

	< { :self :anAngle |
		self.radians < anAngle.radians
	}

	asRadians { :self |
		self.radians
	}

	cos { :self |
		self.radians.cos
	}

	degrees { :self |
		self.radians / pi * 180
	}

	sin { :self |
		self.radians.sin
	}

	storeString { :self |
		self.radians.storeString ++ '.radians'
	}

	tan { :self |
		self.radians.tan
	}

	vector { :self |
		self.radians.angleVector
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
