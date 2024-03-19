@Tuning {

	cents { :self |
		self.typeResponsibility('cents')
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

	size { :self |
		self.typeResponsibility('size')
	}

}

+@Number {

	centsToRatio { :self |
		2 ^ ((self / 100) * (1 / 12))
	}

	ratioToCents { :self |
		(12 * self.log2) * 100
	}

}

+@Collection {

	centsToRatio { :self |
		self.collect(centsToRatio:/1)
	}

	ratioToCents { :self |
		self.collect(ratioToCents:/1)
	}

}
