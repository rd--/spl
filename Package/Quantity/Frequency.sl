@Frequency {

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

	gigahertz { :self |
		self.hertz / 1E9
	}

	hertz { :self |
		self.typeResponsibility('hertz')
	}

	kilohertz { :self |
		self.hertz / 1E3
	}

	megaherz { :self |
		self.hertz / 1E6
	}

}

+SmallFloat {

	Frequency { :self |
		Quantity(self, 'hertz')
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
