+@RandomNumberGenerator {

	poissonDistribution { :self :mu |
		let k = 0;
		let r = self.nextRandomFloat;
		let t = mu.negate.exp;
		{
			r > t
		}.whileTrue {
			k := k + 1;
			r := r * self.nextRandomFloat
		};
		k
	}

}

PoissonDistribution : [Object, Equatable, ProbabilityDistribution] { | mu |

	cdf { :self |
		let mu = self.mu;
		{ :x |
			(0 .. x).collect { :i |
				(mu.-.exp * (mu ^ i)) / i.!
			}.sum
		}
	}

	kurtosis { :self |
		3 + (1 / self.mu)
	}

	mean { :self |
		self.mu
	}

	pdf { :self |
		let mu = self.mu;
		{ :x |
			(x * mu.log - mu - (x + 1).logGamma).exp
		}
	}

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		{
			rng.poissonDistribution(mu)
		} ! shape
	}

	skewness { :self |
		1 / self.mu.sqrt
	}

	variance { :self |
		self.mu
	}

}

+[SmallFloat, Symbol] {

	PoissonDistribution { :mu |
		newPoissonDistribution().initializeSlots(mu)
	}

}
