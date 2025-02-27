/* Requires: Fraction */

+Fraction {

	barlowDisharmonicity { :self |
		self.isOne.if {
			0
		} {
			1 / self.barlowHarmonicity
		}
	}

	barlowHarmonicity { :self |
		self.isOne.if {
			Infinity
		} {
			let q = self.numerator.barlowIndigestibility;
			let p = self.denominator.barlowIndigestibility;
			(q - p).sign / (p + q)
		}
	}

	benedettiHeight { :self |
		self.numerator * self.denominator
	}

	eulerGradusSuavitatis { :self |
		let n = self.numerator;
		let d = self.denominator;
		n.isCoprime(d).if {
			let factors = n.primeFactors ++ d.primeFactors;
			factors.sum - factors.size + 1
		} {
			self.error('Fraction>>eulerGradusSuavitatis: n/d not coprime')
		}
	}

	isPythagorean { :self |
		self.primeLimit <= 3
	}

	keesSemiHeight { :self |
		let [n, d] = self.withoutFactorsOfTwo.asList;
		n.max(d)
	}

	octaveReduced { :self |
		self.octaveReduced(2)
	}

	octaveReduced { :self :octaveRatio |
		let exponent = self.asFloat.log(octaveRatio.asFloat).floor.negated;
		self * (2/1 ^ exponent)
	}

	tenneyHeight { :self :base |
		(self.numerator * self.denominator).asFloat.log(base)
	}

	tenneyHeight { :self |
		self.tenneyHeight(2)
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

+@Integer {

	barlowIndigestibility { :p |
		p.isOne.if {
			0
		} {
			p.isPrime.if {
				(p - 1).squared / p * 2
			} {
				p.primeFactors.collect { :n |
					(n - 1).squared / n * 2
				}.sum
			}
		}
	}

	eulerGradusSuavitatis { :self |
		self.isOne.if {
			1
		} {
			let factors = self.primeFactors;
			factors.sum - factors.size + 1
		}
	}

	octaveReduced { :self |
		self.isInteger.ifFalse {
			self.error('octaveReduced: not integer')
		};
		Fraction(self, 1).octaveReduced(2)
	}

}

+@Collection {

	benedettiHeight { :self |
		self.collect(benedettiHeight:/1)
	}

	eulerGradusSuavitatis { :self |
		self.collect(eulerGradusSuavitatis:/1)
	}

	keesSemiHeight { :self |
		self.collect(keesSemiHeight:/1)
	}

	kurenniemiMajorMinorIndex { :self |
		let l = self.lcm.log;
		let g = self.gcd.log;
		self.collect { :each |
			each.log.rescale(g, l, -1, 1)
		}.sum / self.size
	}

	octaveReduced { :self |
		self.collect(octaveReduced:/1)
	}

	tenneyHeight { :self :base |
		self.collect { :each |
			each.tenneyHeight(base)
		}
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

	holdersComma { :self |
		2.nthRoot(53) ^ self
	}

	mercatorsComma { :self |
		Fraction(3L ^ 53, 2L ^ 84) ^ self
	}

	pythagoreanComma { :self |
		531441/524288 ^ self
	}

	pythagoreanChroma { :self |
		2187/2048 ^ self
	}

	pythagoreanLimma { :self |
		256/243 ^ self
	}

	septimalComma { :self |
		64/63 ^ self
	}

	syntonicComma { :self |
		81/80 ^ self
	}

}

+@Integer {

	tonalityDiamond { :self |
		let n = [1, 3 .. self];
		let o = n.collect { :i | Fraction(i, 1).octaveReduced }.sort;
		let u = 1 / o;
		{ :i :j | (i * j).octaveReduced }.table(u, o)
	}

}

+@Collection {

	octaveReduced { :self |
		self.collect(octaveReduced:/1)
	}

}
