SechDistribution : [Object, Equatable, ProbabilityDistribution] { | mu sigma |

	cdf { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		{ :x |
			(((x - mu).pi / (2 * sigma)).exp.arcTan * 2) / 1.pi
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
		let sigma = self.sigma;
		let p = 2 * sigma;
		{ :x |
			((x - mu).pi / p).sech / p
		}
	}

	variance { :self |
		self.sigma.square
	}

}

+[SmallFloat, Symbol] {

	SechDistribution { :mu :sigma |
		newSechDistribution().initializeSlots(mu, sigma)
	}

}
