+@RandomNumberGenerator {

	poissonDistribution { :self :mu |
		let k = 0L;
		let r = self.nextRandomFloat;
		let t = mu.negate.exp;
		{
			r > t
		}.whileTrue {
			k := k + 1L;
			r := r * self.nextRandomFloat
		};
		k
	}

}

PoissonDistribution : [Object, Equal, ProbabilityDistribution] {

	| mu |

	cdf { :self |
		let mu = self.mu;
		let a = mu.-.exp;
		{ :x |
			0.0.to(x).collect { :i |
				(a * (mu ^ i)) / i.!
			}.sum
		}
	}

	kurtosis { :self |
		3.0 + (1.0 / self.mu)
	}

	mean { :self |
		self.mu
	}

	pdf { :self |
		let mu = self.mu;
		{ :x |
			(x * mu.log - mu - (x + 1.0).logGamma).exp
		}
	}

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		{
			rng.poissonDistribution(mu)
		} ! shape
	}

	skewness { :self |
		1.0 / self.mu.sqrt
	}

	variance { :self |
		self.mu
	}

}

+[Float, Integer, Fraction, Symbol] {

	PoissonDistribution { :mu |
		newPoissonDistribution().initializeSlots(mu)
	}

}
