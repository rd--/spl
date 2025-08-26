+@RandomNumberGenerator {

	discreteUniformDistribution { :self :a :b |
		let u = a.isList.if {
			{ self.nextRandomFloat } ! a.size
		} {
			self.nextRandomFloat
		};
		(u * (b - a + 1) + a).floor
	}

}

DiscreteUniformDistribution : [Object, ProbabilityDistribution] { | a b |

	randomVariate { :self :r :shape |
		{
			r.discreteUniformDistribution(self.a, self.b)
		} ! shape
	}

}

+List {

	DiscreteUniformDistribution { :self |
		let [a, b] = self.isVector.if {
			self
		} {
			self.transpose
		};
		newDiscreteUniformDistribution().initializeSlots(a, b)
	}

}
