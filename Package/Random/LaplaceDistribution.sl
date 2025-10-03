LaplaceDistribution : [Object, Equatable, ProbabilityDistribution] { | mu beta |

	cdf { :self |
		let mu = self.mu;
		let beta = self.beta;
		{ :x |
			let y = ((x - mu).abs.negate / beta).exp / 2;
			(x >= mu).if {
				1 - y
			} {
				y
			}
		}
	}

	entropy { :self |
		(2 * self.beta).log + 1
	}

	mean { :self |
		self.mu
	}

	median { :self |
		self.mu
	}

	mode { :self |
		self.mu
	}

	pdf { :self |
		let mu = self.mu;
		let beta = self.beta;
		{ :x |
			((x - mu).abs.negate / beta).exp / (2 * beta)
		}
	}

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		let beta = self.beta;
		{
			let u = rng.nextRandomFloat - 0.5;
			mu - (beta * u.sign * (1 - (2 * u.abs)).log)
		} ! shape
	}

	skewness { :unused |
		0
	}

	variance { :self |
		2 * self.beta.square
	}

}

+[SmallFloat, Symbol] {

	LaplaceDistribution { :mu :beta |
		newLaplaceDistribution().initializeSlots(mu, beta)
	}

}
