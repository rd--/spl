@ImplicitFloat {

	exp { :self |
		SmallFloat(self).exp
	}

	isCloseBy { :self :aNumber :epsilon |
		SmallFloat(self).isCloseBy(
			SmallFloat(aNumber),
			epsilon
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

	log10 { :self |
		SmallFloat(self).log10
	}

	log2 { :self |
		SmallFloat(self).log2
	}

	nthRoot { :self :aNumber |
		SmallFloat(self).nthRoot(
			SmallFloat(aNumber)
		)
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
