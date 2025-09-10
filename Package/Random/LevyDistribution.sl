LevyDistribution : [Object, ProbabilityDistribution] { | mu sigma |

	pdf { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		let a = (sigma / 2.pi).sqrt;
		{ :x |
			let b = (sigma / (2 * (x - mu))).negate.exp;
			let c = (x - mu) ^ (3 / 2);
			a * (b / c)
		}
	}

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		let sigma = self.sigma;
		let f:/1 = NormalDistribution(0, 1).inverseCdf;
		{
			let u = rng.nextRandomFloat(0, 1);
			(sigma / f(1 - (u / 2)).square) + mu
		} ! shape
	}

}

+SmallFloat {

	LevyDistribution { :mu :sigma |
		newLevyDistribution().initializeSlots(mu, sigma)
	}

}
