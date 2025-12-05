+@RandomNumberGenerator {

	betaBinomialDistribution { :self :alpha :beta :n |
		let p = self.betaDistribution(alpha, beta);
		self.binomialDistribution(n, p)
	}

}

BetaBinomialDistribution : [Object, Storeable, Equatable, ProbabilityDistribution] { | alpha beta n |

	mean { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let n = self.n;
		(n * alpha) / (alpha + beta)
	}

	pdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let n = self.n;
		{ :x |
			binomial(n, x) * (beta(x + alpha, n - x + beta) / beta(alpha, beta))
		}
	}

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		let n = self.n;
		{
			rng.betaBinomialDistribution(alpha, beta, n)
		} ! shape
	}

	variance { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let n = self.n;
		(n * alpha * beta * (n + (alpha * beta))) / (((alpha + beta) ^ 2) + (1 + alpha + beta))
	}

}

+[SmallFloat, Symbol] {

	BetaBinomialDistribution { :alpha :beta :n |
		newBetaBinomialDistribution().initializeSlots(alpha, beta, n)
	}

}
