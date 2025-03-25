ExtremeValueDistribution : [Object, ProbabilityDistribution] { | alpha beta |

	cdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			((x - alpha).- / beta).exp.-.exp
		}
	}

	inverseCdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :p |
			(p <= 0).if {
				-Infinity
			} {
				(p >= 1).if {
					Infinity
				} {
					alpha - (beta * p.log.-.log)
				}
			}
		}
	}

	pdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			let z = (x - alpha) / beta;
			(1 / beta)	* (z + z.-.exp).-.exp
		}
	}

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		{
			let u = rng.nextRandomFloat;
			alpha - (beta * u.log.-.log)
		} ! shape
	}

}

+[SmallFloat, Symbol] {

	ExtremeValueDistribution { :alpha :beta |
		newExtremeValueDistribution().initializeSlots(alpha, beta)
	}

}
