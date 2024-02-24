+@Number {

	beta { :self :aNumber |
		self.logBeta(aNumber).exp
	}

	gammaLanczosFormulaLeadingFactor { :self |
		let z = self + 5.5;
		z.log * (self + 0.5) - z
	}

	gammaLanczosFormulaSeries { :self |
		let term = self;
		let coefficients = [
			76.18009172947146,
			-86.50532032941677,
			24.01409824083091,
			-1.231739572450155,
			0.001208650973866179,
			-0.000005395239384953
		];
		coefficients.injectInto(1.000000000190015) { :sum :each |
			term := term + 1;
			each / term + sum
		}
	}

	gammaLanczosFormula { :self |
		let sqrtTwoPi = (pi * 2).sqrt;
		let leadingFactor = self.gammaLanczosFormulaLeadingFactor;
		let series = self.gammaLanczosFormulaSeries;
		(leadingFactor.exp * series) * sqrtTwoPi / self
	}

	gamma { :self |
		(self.isInteger & {
			(self >= 1)
		}).if {
			(self - 1).factorial
		} {
			(self < 0).if {
				pi / ((pi * self).sin * (1 - self).gamma)
			} {
				(self + 1).gammaLanczosFormula / self
			}
		}
	}

	logBeta { :self :aNumber |
		self.logGamma + aNumber.logGamma - (self + aNumber).logGamma
	}

	logGammaLanczosFormula { :self |
		let sqrtTwoPi = (pi * 2).sqrt;
		let leadingFactor = self.gammaLanczosFormulaLeadingFactor;
		let series = self.gammaLanczosFormulaSeries;
		leadingFactor + (series * sqrtTwoPi / self).log
	}

	logGamma { :self |
		(self > 1).if {
			self.logGammaLanczosFormula
		} {
			(self > 0).if {
				(self + 1).logGammaLanczosFormula - self.log
			} {
				'@Number>>logGamma: non-positive'.error
			}
		}
	}

}
