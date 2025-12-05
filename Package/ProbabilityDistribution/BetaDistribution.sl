+@RandomNumberGenerator {

	betaDistribution { :self :alpha :beta |
		let x = self.gammaDistribution(alpha, 1);
		let y = self.gammaDistribution(beta, 1);
		x / (x + y)
	}

	/*
	betaDistribution { :self :alpha :beta |
		let p = 1 / alpha;
		let q = 1 / beta;
		let sum = 2;
		let next = nil;
		{
			sum > 1
		}.whileTrue {
			next := self.nextRandomFloat ^ p;
			sum := next + (self.nextRandomFloat ^ q)
		};
		next / sum
	}
	*/

}

BetaDistribution : [Object, Storeable, Equatable, ProbabilityDistribution] { | alpha beta |

	cdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			x.betaRegularized(alpha, beta)
		}
	}

	mean { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		alpha / (alpha + beta)
	}

	pdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			x.betweenAnd(0, 1).if {
				let b = (alpha.gamma * beta.gamma) / (alpha + beta).gamma;
				((x ^ (alpha - 1)) * ((1 - x) ^ (beta - 1))) / b
			} {
				0
			}
		}
	}

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		{
			rng.betaDistribution(alpha, beta)
		} ! shape
	}

}

+[SmallFloat, Symbol] {

	BetaDistribution { :alpha :beta |
		newBetaDistribution().initializeSlots(alpha, beta)
	}

}
