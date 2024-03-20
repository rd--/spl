@Tuning {

	asCents { :self |
		self.typeResponsibility('@Tuning>>asCents')
	}

	asIntegers { :self |
		self.typeResponsibility('@Tuning>>asIntegers')
	}

	asRatios { :self |
		self.typeResponsibility('@Tuning>>asRatios')
	}

	isRational { :self |
		self.typeResponsibility('@Tuning>>isRational')
	}

	isTuning { :self |
		true
	}

	limit { :self |
		self.asIntegers.collect { :each |
			(each = 1).if {
				each
			} {
				each.primeFactors.max
			}
		}.max
	}

	octave { :self |
		self.typeResponsibility('@Tuning>>octave')
	}

	size { :self |
		self.typeResponsibility('@Tuning>>size')
	}

}

+@Object {

	isTuning { :self |
		false
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
