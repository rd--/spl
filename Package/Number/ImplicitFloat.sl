@ImplicitFloat {

	[exp, ^] { :self |
		SmallFloat(self).exp
	}

	isCloseToBy { :self :aNumber :epsilon |
		SmallFloat(self).isCloseToBy(
			SmallFloat(aNumber),
			epsilon
		)
	}

	nthRoot { :self :aNumber |
		SmallFloat(self).nthRoot(
			SmallFloat(aNumber)
		)
	}

	log { :self :base |
		SmallFloat(self).log(
			SmallFloat(base)
		)
	}

	log { :self |
		SmallFloat(self).log
	}

	log2 { :self |
		SmallFloat(self).log2
	}

	log10 { :self |
		SmallFloat(self).log10
	}

	printStringToFixed { :self :anInteger |
		SmallFloat(self).printStringToFixed(anInteger)
	}

	realExponent { :x :b |
		SmallFloat(x).abs.log(
			SmallFloat(b)
		)
	}

	[squareRoot, sqrt] { :self |
		SmallFloat(self).sqrt
	}

}
