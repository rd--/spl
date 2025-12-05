+@RandomNumberGenerator {

	triangularDistribution { :self :min :max :c |
		let u = self.nextRandomFloat;
		(u < ((c - min) / (max - min))).if {
			min + (u * (max - min) * (c - min)).sqrt
		} {
			max - ((1 - u) * (max - min) * (max - c)).sqrt
		}
	}

}

TriangularDistribution : [Object, Equatable, ProbabilityDistribution] { | i c |

	cdf { :self |
		let a = self.i.min;
		let b = self.i.max;
		let c = self.c;
		{ :x |
			(x <= a).if {
				0
			} {
				(x <= c).if {
					(x - a) * (x - a) / ((b - a) * (c - a))
				} {
					(x < b).if {
						1 - ((b - x) * (b - x) / ((b - a) * (b - c)))
					} {
						1
					}
				}
			}
		}
	}

	pdf { :self |
		let a = self.i.min;
		let b = self.i.max;
		let c = self.c;
		{ :x |
			(a <= x & { x <= c }).if {
				2 * (x - a) / ((b - a) * (c - a))
			} {
				(c < x & { x <= b }).if {
					2 * (b - x) / ((b - a) * (b - c))
				} {
					0
				}
			}
		}
	}

	randomVariate { :self :rng :shape |
		let a = self.i.min;
		let b = self.i.max;
		let c = self.c;
		{
			rng.triangularDistribution(a, b, c)
		} ! shape
	}

}

+Interval {

	TriangularDistribution { :m :c |
		newTriangularDistribution().initializeSlots(m, c)
	}

}
