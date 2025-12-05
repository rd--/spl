LogNormalDistribution : [Object, Equatable, ProbabilityDistribution] { | mu sigma |

	pdf { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		{ :x |
			(x > 0 & { x.isFinite }).if {
				let d = (x.log - mu) / sigma;
				(-0.5 * d * d).exp / (x * 2.pi.sqrt * sigma)
			} {
				0.0
			}
		}
	}

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		let sigma = self.sigma;
		{
			rng.normalDistribution(mu, sigma).exp
		} ! shape
	}

}

+[SmallFloat, Symbol] {

	LogNormalDistribution { :mu :sigma |
		newLogNormalDistribution().initializeSlots(mu, sigma)
	}

}
