@Frequency {

	asDuration { :self |
		Duration(1 / self.inHertz)
	}

	cyclesPerMinute { :self |
		self.inHertz * 60
	}

	cyclesPerSecond { :self |
		self.inHertz
	}

	inGigahertz { :self |
		self.inHertz / 1E9
	}

	inHertz { :self |
		self.typeResponsibility('hertz')
	}

	inKilohertz { :self |
		self.inHertz / 1E3
	}

	inMegaherz { :self |
		self.inHertz / 1E6
	}

}

+SmallFloat {

	Frequency { :self |
		Quantity(self, 'hertz')
	}

}

+@Number {

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
