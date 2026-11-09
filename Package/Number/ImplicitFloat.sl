@ImplicitFloat {

	cubeRoot { :self |
		Float(self).cubeRoot
	}

	exp { :self |
		Float(self).exp
	}

	isCloseBy { :self :aNumber :epsilon |
		aNumber.isNumber & {
			Float(self).isCloseBy(
				Float(aNumber),
				epsilon
			)
		}
	}

	log { :self :base |
		Float(self).log(
			base
		)
	}

	log { :self |
		Float(self).log
	}

	log10 { :self |
		Float(self).log10
	}

	log2 { :self |
		Float(self).log2
	}

	nthRoot { :self :aNumber |
		Float(self).nthRoot(
			Float(aNumber)
		)
	}

	printStringToFixed { :self :anInteger |
		Float(self).printStringToFixed(anInteger)
	}

	realDigits { :self :base :size |
		Float(self).realDigits(
			base,
			size
		)
	}

	realExponent { :x :b |
		Float(x).abs.log(
			Float(b)
		)
	}

	[squareRoot, sqrt] { :self |
		Float(self).sqrt
	}

}
