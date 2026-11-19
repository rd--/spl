+@RandomNumberGenerator {

	betaDistribution { :self :alpha :beta |
		let x = self.gammaDistribution(alpha, 1.0);
		let y = self.gammaDistribution(beta, 1.0);
		x / (x + y)
	}

}

BetaDistribution : [Object, Store, Equal, ProbabilityDistribution] {

	| alpha beta |

	cdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			x.betaRegularized(alpha, beta)
		}
	}

	mean { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		alpha / (alpha + beta)
	}

	pdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			x.isBetween(0.0, 1.0).if {
				let b = (alpha.gamma * beta.gamma) / (alpha + beta).gamma;
				((x ^ (alpha - 1.0)) * ((1.0 - x) ^ (beta - 1.0))) / b
			} {
				0.0
			}
		}
	}

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		{
			rng.betaDistribution(alpha, beta)
		} ! shape
	}

}

+[Float, Symbol] {

	BetaDistribution { :alpha :beta |
		newBetaDistribution().initializeSlots(alpha, beta)
	}

}
