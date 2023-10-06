@Tuning {

	cents { :self |
		self.typeResponsibility('cents')
	}

	degree { :self |
		self.typeResponsibility('degree')
	}

	integers { :self |
		self.typeResponsibility('integers')
	}

	isRational { :self |
		self.typeResponsibility('isRational')
	}

	limit { :self |
		self.integers.collect { :each |
			(each = 1).if {
				each
			} {
				each.primeFactors.max
			}
		}.max
	}

	octave { :self |
		self.typeResponsibility('octave')
	}

	ratios { :self |
		self.typeResponsibility('ratios')
	}

}
