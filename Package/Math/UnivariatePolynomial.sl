UnivariatePolynomial : [Object] { | coefficients |

	+ { :self :anObject |
		let c1 = self.coefficients;
		let c2 = anObject.coefficients;
		let n = c1.size.max(c2.size);
		UnivariatePolynomial(
			c1.padLeft(n, 0) + c2.padLeft(n, 0)
		)
	}

	at { :self :x |
		let answer = 0;
		let exponent = self.degree;
		self.coefficients.do { :each |
			answer := answer + (each * (x ^ exponent));
			exponent := exponent - 1
		};
		answer
	}

	atAll { :self :aCollection |
		aCollection.collect { :each |
			self.at(each)
		}
	}

	degree { :self |
		self.coefficients.size - 1
	}

}

+List {

	UnivariatePolynomial { :self |
		newUnivariatePolynomial().initializeSlots(self)
	}

}

+SmallFloat {

	chebyshevT { :self |
		let c = self.caseOfOtherwise([
			0 -> [1],
			1 -> [1 0],
			2 -> [2 0 -1],
			3 -> [4 0 -3 0],
			4 -> [8 0 -8 0 1],
			5 -> [16 0 -20 0 5 0],
			6 -> [32 0 -48 0 18 0 -1],
			7 -> [64 0 -112 0 56 0 -7 0],
			8 -> [128 0 -256 0 160 0 -32 0 1],
			9 -> [256 0 -576 0 432 0 -120 0 9 0],
			10 -> [512 0 -1280 0 1120 0 -400 0 50 0 -1],
			11 -> [1024 0 -2816 0 2816 0 -1232 0 220 0 -11 0],
			12 -> [2048 0 -6144 0 6912 0 -3584 0 840 0 -72 0 1]
		]) {
			self.error('chebyshevT: not implemented')
		};
		UnivariatePolynomial(c)
	}

	chebyshevU { :self |
		let c = self.caseOfOtherwise([
			0 -> [1],
			1 -> [2 0],
			2 -> [4 0 -1],
			3 -> [8 0 -4 0],
			4 -> [16 0 -12 0 1],
			5 -> [32 0 -32 0 6 0],
			6 -> [64 0 -80 0 24 0 -1],
			7 -> [128 0 -192 0 80 0 -8 0],
			8 -> [256 0 -448 0 240 0 -40 0 1],
			9 -> [512 0 -1024 0 672 0 -160 0 10 0],
			10 -> [1024 0 -2304 0 1792 0 -560 0 60 0 -1],
			11 -> [2048 0 -5120 0 4608 0 -1792 0 280 0 -12 0]
		]) {
			self.error('chebyshevU: not implemented')
		};
		UnivariatePolynomial(c)
	}

}
