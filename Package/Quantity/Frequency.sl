Frequency : [Object, Magnitude] { | hertz |

	~ { :self :anObject |
		self.hasEqualSlotsBy(anObject, ~)
	}

	< { :self :aFrequency |
		self.hertz < aFrequency.hertz
	}

	asDuration { :self |
		Duration(1 / self.hertz)
	}

	asHertz { :self |
		self.hertz
	}

	cyclesPerMinute { :self |
		self.hertz * 60
	}

	cyclesPerSecond { :self |
		self.hertz
	}

	kilohertz { :self |
		self.hertz / 1000
	}

	megaherz { :self |
		self.hertz / 1000000
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+SmallFloat {

	hertz { :self |
		Quantity(self, 'hertz') /* Hz */
	}

	Frequency { :self |
		newFrequency().initializeSlots(self)
	}

}

+@Number {

	asHertz { :self |
		self
	}

	kilohertz { :self |
		(self * 1000).hertz
	}

	megaherz { :self |
		(self * 1000000).hertz
	}

}

/*
+Duration {

	asFrequency { :self |
		self.seconds.reciprocal.hertz
	}

}
*/
