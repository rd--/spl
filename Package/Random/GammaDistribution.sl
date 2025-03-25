GammaDistribution : [Object, ProbabilityDistribution] { | alpha beta |

	cdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			(x / beta).lowerIncompleteGamma(alpha)
		}
	}

	mean { :self |
		self.alpha * self.beta
	}

	pdf { :self |
		{ :x |
			let alpha = self.alpha;
			let beta = self.beta;
			((x / beta).-.exp * (x ^ (alpha - 1)) * (beta ^ alpha.-)) / alpha.gamma
		}
	}

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		{
			rng.gammaDistribution(alpha, beta)
		} ! shape
	}

	survivalFunction { :self :x |
		(x / self.beta).upperIncompleteGamma(self.alpha)
	}

	variance { :self |
		self.alpha * self.beta.squared
	}

}

+[SmallFloat, Symbol] {

	ChiSquareDistribution { :nu |
		newGammaDistribution().initializeSlots(nu / 2, 2)
	}

	GammaDistribution { :alpha :beta |
		newGammaDistribution().initializeSlots(alpha, beta)
	}

}
