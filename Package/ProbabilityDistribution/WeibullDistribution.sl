+@RandomNumberGenerator {

	weibullDistribution { :self :alpha :beta :mu |
		let r = 1;
		{
			r = 1
		}.whileTrue {
			r := self.nextRandomFloat
		};
		beta * (r.log.negate ^ (1 / alpha)) + mu
	}

}

WeibullDistribution : [Object, Equal, ProbabilityDistribution] {

	| alpha beta mu |

	cdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let mu = self.mu;
		{ :x |
			(x >= 0.0).if {
				1.0 - (((x - mu) / beta) ^ alpha).negate.exp
			} {
				0.0
			}
		}
	}

	hazardFunction { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let mu = self.mu;
		{ :x |
			(x > mu).if {
				(alpha * (((mu.- + x) / beta) ^ (-1.0 + alpha))) / beta
			} {
				0.0
			}
		}
	}

	inverseCdf { :self |
		{ :p |
			(
				p > 0.0 & {
					p < 1.0
				}
			).if {
				self.mu + (self.beta * ((1.0 - p).log.- ^ (1.0 / self.alpha)))
			} {
				(p <= 0.0).if {
					self.mu
				} {
					Infinity
				}
			}
		}
	}

	mean { :self |
		self.beta * (1.0 + (1.0 / self.alpha)).gamma + self.mu
	}

	median { :self |
		self.beta * (2.0.log ^ (1.0 / self.alpha)) + self.mu
	}

	pdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let mu = self.mu;
		{ :x |
			(x >= mu).if {
				(alpha / beta) * (((x - mu) / beta) ^ (alpha - 1)) * (((x - mu) / beta) ^ alpha).negate.exp
			} {
				0.0
			}
		}
	}

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		let mu = self.mu;
		{
			rng.weibullDistribution(alpha, beta, mu)
		} ! shape
	}

}

+[Float, Symbol] {

	WeibullDistribution { :alpha :beta :mu |
		newWeibullDistribution().initializeSlots(alpha, beta, mu)
	}

}
