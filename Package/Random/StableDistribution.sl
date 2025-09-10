+@RandomNumberGenerator {

	stableDistribution { :self :alpha :beta :mu :sigma |
		let u = self.nextRandomFloat(-0.5.pi, 0.5.pi);
		let w = self.exponentialDistribution(1);
		let zeta = beta.negate * (alpha.pi / 2).tan;
		let xi = (alpha != 1).if {
			(1 / alpha) * zeta.negate.arcTan
		} {
			1/2.pi
		};
		let x = (alpha != 1).if {
			((1 + zeta.square) ^ (1 / (2 * alpha)))
			*
			(sin(alpha * (u + xi)) / (cos(u) ^ (1 / alpha)))
			*
			((cos(u - (alpha * (u + xi))) / w) ^ ((1 - alpha) / alpha))
		} {
			(1 / xi)
			*
			(
				((1/2.pi + (beta * u)) * tan(u))
				-
				(beta * log(1/2.pi * w * cos(u) / 1/2.pi + (beta * u)))
			)
		};
		let y = (alpha != 1).if {
			(sigma * x) + mu
		} {
			(sigma * x) + ((2 / 1.pi) * beta * sigma * log(sigma)) + mu
		};
		y
	}

}

StableDistribution : [Object, ProbabilityDistribution] { | alpha beta mu sigma |

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		let mu = self.mu;
		let sigma = self.sigma;
		{
			rng.stableDistribution(alpha, beta, mu, sigma)
		} ! shape
	}

}

+SmallFloat {

	StableDistribution { :alpha :beta :mu :sigma |
		newStableDistribution().initializeSlots(alpha, beta, mu, sigma)
	}

}
