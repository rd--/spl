PlaneAngle : [Object, Magnitude] { | radians |

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

	magnitude { :self |
		self.radians
	}

	sin { :self |
		self.radians.sin
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	tan { :self |
		self.radians.tan
	}

	unit { :unused |
		'radians'
	}

	vector { :self |
		self.radians.angleVector
	}

}

+SmallFloat {

	PlaneAngle { :self |
		newPlaneAngle().initializeSlots(self)
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

}
