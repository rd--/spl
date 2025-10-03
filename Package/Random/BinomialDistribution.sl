+@RandomNumberGenerator {

	binomialDistribution { :self :n :p |
		let answer = 0;
		n.timesRepeat {
			let u = self.nextRandomFloat;
			(u < p).ifTrue {
				answer := answer + 1
			}
		};
		answer
	}

}

BinomialDistribution : [Object, Equatable, ProbabilityDistribution] { | n p |

	cdf { :self |
		let n = self.n;
		let p = self.p;
		{ :k |
			(0 .. k).collect { :i |
				n.binomial(i) * (p ^ i) * ((1 - p) ^ (n - i))
			}.sum
		}
	}

	kurtosis { :self |
		let n = self.n;
		let p = self.p;
		1 - (6 / n) + (1 / (n * p * (1 - p)))
	}

	mean { :self |
		self.n * self.p
	}

	pdf { :self |
		let n = self.n;
		let p = self.p;
		{ :k |
			n.binomial(k) * (p ^ k) * ((1 - p) ^ (n - k))
		}
	}

	randomVariate { :self :rng :shape |
		let n = self.n;
		let p = self.p;
		{
			rng.binomialDistribution(n, p)
		} ! shape
	}

	skewness { :self |
		let n = self.n;
		let p = self.p;
		(1 - (2 * p)) / (n * (1 - p) * p).sqrt
	}

	standardDeviation { :self |
		(self.n * self.p * (1 - self.p)).sqrt
	}

}

+[SmallFloat, Symbol] {

	BinomialDistribution { :n :p |
		newBinomialDistribution().initializeSlots(n, p)
	}

}
