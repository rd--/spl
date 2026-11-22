+@RandomNumberGenerator {

	binomialDistribution { :self :n :p |
		let answer = 0L;
		n.timesRepeat {
			let u = self.nextRandomFloat;
			(u < p).ifTrue {
				answer := answer + 1L
			}
		};
		answer
	}

}

BinomialDistribution : [Object, Equal, ProbabilityDistribution] {

	| n p |

	cdf { :self |
		let n = self.n;
		let p = self.p;
		{ :k |
			0.0.to(k).collect { :i |
				n.binomial(i) * (p ^ i) * ((1.0 - p) ^ (n - i))
			}.sum
		}
	}

	kurtosis { :self |
		let n = self.n;
		let p = self.p;
		1.0 - (6.0 / n) + (1.0 / (n * p * (1.0 - p)))
	}

	mean { :self |
		self.n * self.p
	}

	pdf { :self |
		let n = self.n;
		let p = self.p;
		{ :k |
			n.binomial(k) * (p ^ k) * ((1.0 - p) ^ (n - k))
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
		(1.0 - (2.0 * p)) / (n * (1.0 - p) * p).sqrt
	}

	standardDeviation { :self |
		(self.n * self.p * (1.0 - self.p)).sqrt
	}

}

+[Integer, @SmallInteger, Symbol] {

	BinomialDistribution { :n :p |
		newBinomialDistribution().initializeSlots(n, p)
	}

}
