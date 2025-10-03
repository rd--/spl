+@RandomNumberGenerator {

	paretoDistribution { :self :k :alpha |
		let e = -1 / alpha;
		let u = self.nextRandomFloat;
		k * (u ^ e)
	}

}

ParetoDistribution : [Object, Equatable, ProbabilityDistribution] { | k alpha |

	cdf { :self |
		let k = self.k;
		let alpha = self.alpha;
		{ :x |
			1 - ((k / x) ^ alpha)
		}
	}

	pdf { :self |
		{ :x |
			let k = self.k;
			let alpha = self.alpha;
			(alpha * (k ^ alpha)) / (x ^ (alpha + 1))
		}
	}

	randomVariate { :self :rng :shape |
		let k = self.k;
		let alpha = self.alpha;
		let e = -1 / alpha;
		{
			let u = rng.nextRandomFloat;
			k * (u ^ e)
		} ! shape
	}

}

+[SmallFloat, Symbol] {

	ParetoDistribution { :k :alpha |
		newParetoDistribution().initializeSlots(k, alpha)
	}

}
