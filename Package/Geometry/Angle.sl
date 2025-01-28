Angle : [Object, Magnitude] { | radians |

	= { :self :anAngle |
		self.radians = anAngle.radians
	}

	< { :self :anAngle |
		self.radians < anAngle.radians
	}

	asGradians { :self |
		self.radians / 400
	}

	asRadians { :self |
		self.radians
	}

	cos { :self |
		self.radians.cos
	}

	degrees { :self |
		self.radians / 1.pi * 180
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
		(self.pi / 180).radians
	}

	gradians { :self |
		(self * 400).radians
	}

	radians { :self |
		newAngle().initializeSlots(self)
	}

}
