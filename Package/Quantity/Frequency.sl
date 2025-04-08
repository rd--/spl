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

	cyclesPerMinute { :self |
		self.hertz * 60
	}

	cyclesPerSecond { :self |
		self.hertz
	}

	magnitude { :self |
		self.hertz
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	unit { :unused |
		'hertz'
	}

}

+SmallFloat {

	Frequency { :self |
		newFrequency().initializeSlots(self)
	}

}

+[Frequency, Quantity] {

	asHertz { :self |
		self.hertz
	}

	gigahertz { :self |
		self.hertz / 1E9
	}

	kilohertz { :self |
		self.hertz / 1E3
	}

	megaherz { :self |
		self.hertz / 1E6
	}

}

+@Number {

	asHertz { :self |
		self
	}

	gigahertz { :self |
		(self * 1E9).hertz
	}

	kilohertz { :self |
		(self * 1000).hertz
	}

	megaherz { :self |
		(self * 1000000).hertz
	}

}

+Quantity {

	asFrequency { :self |
		Frequency(self.hertz)
	}

}
