+@RandomNumberGenerator {

	uniformDistribution { :self :min :max |
		self.nextRandomFloat * (max - min) + min
	}

}

UniformDistribution : [Object, ProbabilityDistribution] { | min max |

	cdf { :self |
		let min = self.min;
		let max = self.max;
		{ :x |
			(x < min).if {
				0
			} {
				(x > max).if {
					1
				} {
					(x - min) / (max - min)
				}
			}
		}
	}

	entropy { :self |
		(self.max - self.min).log
	}

	kurtosis { :self |
		9/5
	}

	mean { :self |
		(self.min + self.max) / 2
	}

	median { :self |
		(self.min + self.max) / 2
	}

	pdf { :self |
		{ :x |
			x.betweenAnd(self.min, self.max).if {
				1
			} {
				0
			}
		}
	}

	randomVariate { :self :rng :shape |
		rng.randomReal(self.min, self.max, shape)
	}

	skewness { :self |
		0
	}

	standardDeviation { :self |
		self.variance.sqrt
	}

	variance { :self |
		(self.max - self.min).squared / 12
	}

}

+[SmallFloat, Symbol] {

	UniformDistribution { :min :max |
		newUniformDistribution().initializeSlots(min, max)
	}

}
