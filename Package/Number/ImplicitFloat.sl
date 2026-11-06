@ImplicitFloat {

	cubeRoot { :self |
		SmallFloat(self).cubeRoot
	}

	exp { :self |
		SmallFloat(self).exp
	}

	isCloseBy { :self :aNumber :epsilon |
		aNumber.isNumber & {
			SmallFloat(self).isCloseBy(
				SmallFloat(aNumber),
				epsilon
			)
		}
	}

	log { :self :base |
		SmallFloat(self).log(
			base
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

	realDigits { :self :base :size |
		SmallFloat(self).realDigits(
			base,
			size
		)
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
