{- Requires: Fraction -}

+Fraction {

	benedettiHeight { :self |
		self.numerator * self.denominator
	}

	keesSemiHeight { :self |
		let [n, d] = self.withoutFactorsOfTwo.asTuple;
		n.max(d)
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
