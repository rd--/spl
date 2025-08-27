+@RandomNumberGenerator {

	exponentialDistribution { :self :lambda |
		let u = self.nextRandomFloat;
		(1 - u).log / lambda.-
	}

}

ExponentialDistribution : [Object, ProbabilityDistribution] { | lambda |

	cdf { :self |
		let lambda = self.lambda;
		{ :x |
			(x >= 0).if {
				1 - (-1 * x * lambda).exp
			} {
				0
			}
		}
	}

	beta { :self |
		1 / self.lambda
	}

	hazardFunction { :self |
		let lambda = self.lambda;
		{ :x |
			(x >= 0).if {
				lambda
			} {
				0
			}
		}
	}

	inverseCdf { :self |
		let lambda = self.lambda;
		{ :p |
			(p < 1 & { p >= 0 }).if {
				-1 * (1 - p).log / lambda
			} {
				Infinity
			}
		}
	}

	inverseSurvivalFunction { :self |
		let lambda = self.lambda;
		{ :p |
			(p <= 1 & { p >= 0 }).if {
				-1 * (p.log / lambda)
			} {
				(p <= 0).if {
					Infinity
				} {
					0
				}
			}
		}
	}

	kurtosis { :unused |
		9
	}

	mean { :self |
		self.beta
	}

	median { :self |
		2.log / self.lambda
	}

	pdf { :self |
		{ :x |
			let lambda = self.lambda;
			(x >= 0).if {
				(-1 * x * lambda).exp * lambda
			} {
				0
			}
		}
	}

	randomVariate { :self :rng :shape |
		let lambda = self.lambda;
		{
			rng.exponentialDistribution(lambda)
		} ! shape
	}

	skewness { :unused |
		2
	}

	standardDeviation { :self |
		self.beta
	}

	survivalFunction { :self |
		let lambda = self.lambda;
		{ :x |
			(x >= 0).if {
				(-1 * x * lambda).exp
			} {
				1
			}
		}
	}

	variance { :self |
		1 / self.lambda.square
	}

}

+[SmallFloat, Symbol] {

	ExponentialDistribution { :lambda |
		newExponentialDistribution().initializeSlots(lambda)
	}

}
