+@RandomNumberGenerator {

	skewNormalDistribution { :self :mu :sigma :alpha |
		let f = { :x | x * sigma + mu };
		let u1 = self.normalDistribution(0, 1);
		(alpha = 0).if {
			f(u1)
		} {
			let u2 = self.normalDistribution(0, 1);
			let [u, v] = [u1.max(u2), u1.min(u2)];
			(alpha = -1).if {
				f(v)
			} {
				(alpha = 1).if {
					f(u)
				} {
					f(
						(((1 + alpha) * u) + ((1 - alpha) * v))
						/
						((1 + (alpha * alpha)).sqrt * 2.sqrt)
					)
				}
			}
		}
	}

}

SkewNormalDistribution : [Object, Equatable, ProbabilityDistribution] { | mu sigma alpha |

	pdf { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		let alpha = self.alpha;
		{ :x |
			(((x - mu).square / (2 * sigma.square)).-.exp * ((alpha * (x - mu)) / (2.sqrt * sigma)).-.erfc) / (2.pi.sqrt * sigma)
		}
	}

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		let sigma = self.sigma;
		let alpha = self.alpha;
		{
			rng.skewNormalDistribution(mu, sigma, alpha)
		} ! shape
	}

}

+[SmallFloat, Symbol] {

	SkewNormalDistribution { :mu :sigma :alpha |
		newSkewNormalDistribution().initializeSlots(mu, sigma, alpha)
	}

}
