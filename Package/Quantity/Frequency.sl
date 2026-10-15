@Frequency {

	cyclesPerMinute { :self |
		self.inHertz * 60
	}

	cyclesPerSecond { :self |
		self.inHertz
	}

	Duration { :self |
		Duration(1 / self.inHertz)
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

+@Collection {

	Frequency { :self |
		self.collect(Frequency/1)
	}

}

+@Number {

	decahertz { :self |
		(self * 1E1).hertz
	}

	gigahertz { :self |
		(self * 1E9).hertz
	}

	hectohertz { :self |
		(self * 1E2).hertz
	}

	kilohertz { :self |
		(self * 1E3).hertz
	}

	megaherz { :self |
		(self * 1E6).hertz
	}

}
