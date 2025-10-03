+@RandomNumberGenerator {

	cauchyDistribution { :self :x0 :gamma |
		let u = self.nextRandomFloat;
		x0 + (gamma * (u - 0.5).pi.tan)
	}

}

CauchyDistribution : [Object, Equatable, ProbabilityDistribution] { | x0 gamma |

	cdf { :self |
		let x0 = self.x0;
		let gamma = self.gamma;
		{ :x |
			(1 / 1.pi) * ((x - x0) / gamma).arcTan + 0.5
		}
	}

	entropy { :self |
		(4.pi * self.gamma).log
	}

	mean { :self |
		self.error('CauchyDistribution>>mean: undefined')
	}

	median { :self |
		self.x0
	}

	mode { :self |
		self.x0
	}

	pdf { :self |
		let x0 = self.x0;
		let gamma = self.gamma;
		{ :x |
			1 / (gamma.pi * (1 + ((x - x0) / gamma).square))
		}
	}

	quantile { :self |
		let x0 = self.x0;
		let gamma = self.gamma;
		{ :p |
			x0 + (gamma * (p - 0.5).pi.tan)
		}
	}

	randomVariate { :self :rng :shape |
		let x0 = self.x0;
		let gamma = self.gamma;
		{
			rng.cauchyDistribution(x0, gamma)
		} ! shape
	}

	variance { :self |
		self.error('CauchyDistribution>>variance: undefined')
	}

}

+[SmallFloat, Symbol] {

	CauchyDistribution { :x0 :gamma |
		newCauchyDistribution().initializeSlots(x0, gamma)
	}

}
