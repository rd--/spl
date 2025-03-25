GeometricDistribution : [Object, ProbabilityDistribution] { | p |

	cdf { :self |
		let p = self.p;
		{ :x |
			(x >= 0).if {
				1 - ((1 - p) ^ (1 + x.floor))
			} {
				0
			}
		}
	}

	mean { :self |
		let p = self.p;
		-1 + (1 / p)
	}

	pdf { :self |
		{ :x |
			let p = self.p;
			(x >= 0).if {
				((1 - p) ^ x) * p
			} {
				0
			}
		}
	}

	randomVariate { :self :rng :shape |
		let p = self.p;
		{
			let i = 0;
			{
				rng.nextRandomFloat(0, 1) <= p
			}.whileFalse {
				i := i + 1
			};
			i
		} ! shape
	}

	skewness { :self |
		let p = self.p;
		(2 - p) / (1 - p).sqrt
	}

	variance { :self |
		let p = self.p;
		(1 - p) / p.squared
	}

}

+[SmallFloat, Symbol] {

	GeometricDistribution { :p |
		newGeometricDistribution().initializeSlots(p)
	}

}
