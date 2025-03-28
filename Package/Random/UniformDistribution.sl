+@RandomNumberGenerator {

	uniformDistribution { :self :a :b |
		let u = a.isList.if {
			{ self.nextRandomFloat } ! a.size
		} {
			self.nextRandomFloat
		};
		u * (b - a) + a
	}

}

UniformDistribution : [Object, ProbabilityDistribution] { | a b |

	cdf { :self |
		let a = self.a;
		let b = self.b;
		{ :x |
			(x < a).if {
				0
			} {
				(x > b).if {
					1
				} {
					(x - a) / (b - a)
				}
			}
		}
	}

	dimensions { :self |
		self.a.size
	}

	entropy { :self |
		(self.b - self.a).log
	}

	excessKurtosis { :self |
		6/5
	}

	kurtosis { :self |
		9/5
	}

	mean { :self |
		(self.a + self.b) / 2
	}

	median { :self |
		(self.a + self.b) / 2
	}

	pdf { :self |
		{ :x |
			x.betweenAnd(self.a, self.b).if {
				1
			} {
				0
			}
		}
	}

	randomVariate { :self :r :shape |
		{
			r.uniformDistribution(self.a, self.b)
		} ! shape
	}

	skewness { :self |
		0
	}

	standardDeviation { :self |
		self.variance.sqrt
	}

	variance { :self |
		(self.b - self.a).squared / 12
	}

}

+List {

	UniformDistribution { :self |
		let [a, b] = self.isVector.if {
			self
		} {
			self.transposed
		};
		newUniformDistribution().initializeSlots(a, b)
	}

}
