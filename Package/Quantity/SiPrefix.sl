+String {

	isSiPrefix { :self |
		system.siPrefixList.includes(self)
	}

}

+System {

	siPrefixList { :self |
		self.cached('siPrefixList') {
			[
				'centi' 'deca' 'deci' 'hecto' 'giga'
				'mega' 'kilo' 'micro' 'milli' 'nano'
				'pico' 'terra'
			]
		}
	}

}

+@Number {

	centi { :self |
		self * 1E-2
	}

	deca { :self |
		self * 1E1
	}

	deci { :self |
		self * 1E-1
	}

	hecto { :self |
		self * 1E2
	}

	giga { :self |
		self * 1E9
	}

	mega { :self |
		self * 1E6
	}

	kilo { :self |
		self * 1E3
	}

	micro { :self |
		self * 1E-6
	}

	milli { :self |
		self * 1E-3
	}

	nano { :self |
		self * 1E-9
	}

	pico { :self |
		self * 1E-12
	}

	terra { :self |
		self * 1E12
	}

}
