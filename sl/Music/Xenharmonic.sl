{- Requires: Fraction -}

+Fraction {

	benedettiHeight { :self |
		self.numerator * self.denominator
	}

	keesSemiHeight { :self |
		let [n, d] = self.withoutFactorsOfTwo.asTuple;
		n.max(d)
	}

	octaveReduced { :self |
		self.octaveReduced(2)
	}

	octaveReduced { :self :octaveRatio |
		let exponent = self.asFloat.log(octaveRatio.asFloat).floor.negated;
		self * (2/1 ^ exponent)
	}

	tenneyHeight { :self |
		(self.numerator * self.denominator).log2
	}

	weilHeight { :self |
		self.numerator.max(self.denominator).log2 * 2
	}

	wilsonHeight { :self |
		(self.numerator * self.denominator).primeFactors.sum
	}

	withoutFactorsOfTwo { :self |
		self.primeFactors.reject { :each |
			[1/2 2].includes(each)
		}.product.asFraction
	}

}

+@Collection {

	benedettiHeight { :self |
		self.collect(benedettiHeight:/1)
	}

	keesSemiHeight { :self |
		self.collect(keesSemiHeight:/1)
	}

	tenneyHeight { :self |
		self.collect(tenneyHeight:/1)
	}

	weilHeight { :self |
		self.collect(weilHeight:/1)
	}

	wilsonHeight { :self |
		self.collect(wilsonHeight:/1)
	}

}

+@Number {

	pythagoreanComma { :self |
		self * 531441/524288
	}

	pythagoreanChroma { :self |
		self * 2187/2048
	}

	pythagoreanLimma { :self |
		self * 256/243
	}

	septimalComma { :self |
		self * 64/63
	}

	syntonicComma { :self |
		self * 81/80
	}

}
