BernoulliDistribution : [Object, ProbabilityDistribution] { | p |

	cdf { :self |
		{ :x |
			(x < 0).if {
				0
			} {
				(x < 1).if {
					1 - self.p
				} {
					1
				}
			}
		}
	}

	kurtosis { :self |
		let p = self.p;
		let v = (1 - p) * p;
		3 + ((1 - (6 * v)) / v)
	}

	mean { :self |
		self.p
	}

	median { :self |
		(self.p > 0.5).if {
			1
		} {
			0
		}
	}

	pdf { :self |
		{ :x |
			let p = self.p;
			(x = 0).if {
				1 - p
			} {
				(x = 1).if {
					p
				} {
					0
				}
			}
		}
	}

	randomVariate { :self :rng :shape |
		let p = self.p;
		{
			(rng.nextRandomFloat < p).boole
		} ! shape
	}

	skewness { :self |
		let p = self.p;
		let v = (1 - p) * p;
		(1 - (2 * p)) / v.sqrt
	}

	variance { :self |
		let p = self.p;
		(1 - p) * p
	}

}

+[SmallFloat, Symbol] {

	BernoulliDistribution { :p |
		newBernoulliDistribution().initializeSlots(p)
	}

}
