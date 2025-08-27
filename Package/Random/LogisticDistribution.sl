+@RandomNumberGenerator {

	logisticDistribution { :self :mu :beta |
		let u = self.nextRandomFloat;
		(u / (1 - u)).log * beta + mu
	}

}

LogisticDistribution : [Object, ProbabilityDistribution] { | mu beta |

	cdf { :self |
		let mu = self.mu;
		let beta = self.beta;
		{ :x |
			let z = ((x - mu) / beta).-.exp;
			1 / (1 + z)
		}
	}

	mean { :self |
		self.mu
	}

	median { :self |
		self.mu
	}

	pdf { :self |
		let mu = self.mu;
		let beta = self.beta;
		{ :x |
			let z = ((x - mu) / beta).-.exp;
			z / ((1 + z).square * beta)
		}
	}

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		let beta = self.beta;
		{
			rng.logisticDistribution(mu, beta)
		} ! shape
	}

}

+[SmallFloat, Symbol] {

	LogisticDistribution { :mu :beta |
		newLogisticDistribution().initializeSlots(mu, beta)
	}

}
