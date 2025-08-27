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
		let a = self.a;
		let b = self.b;
		{ :x |
			x.betweenAnd(a, b).if {
				1 / (b - a)
			} {
				0
			}
		}
	}

	randomVariate { :self :r :shape |
		let a = self.a;
		let b = self.b;
		{
			r.uniformDistribution(a, b)
		} ! shape
	}

	skewness { :self |
		0
	}

	standardDeviation { :self |
		self.variance.sqrt
	}

	variance { :self |
		(self.b - self.a).square / 12
	}

}

+List {

	UniformDistribution { :self |
		let [a, b] = self.isVector.if {
			self
		} {
			self.transpose
		};
		newUniformDistribution().initializeSlots(a, b)
	}

}
