PlaneAngle : [Object, Magnitude] { | radians |

	= { :self :anAngle |
		self.radians = anAngle.radians
	}

	< { :self :anAngle |
		self.radians < anAngle.radians
	}

	cos { :self |
		self.radians.cos
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

+[PlaneAngle, Quantity] {

	asRadians { :self |
		self.radians
	}

	degrees { :self |
		self.radians / 1.pi * 180
	}

	gradians { :self |
		self.radians / 400
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
