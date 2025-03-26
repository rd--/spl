FRatioDistribution : [Object] { | n m |

	randomVariate { :self :r :shape |
		let n = ChiSquareDistribution(self.n).randomVariate(r, shape);
		let d = ChiSquareDistribution(self.m).randomVariate(r, shape);
		(n / d) * (self.m / self.n)
	}

}

+SmallFloat {

	FRatioDistribution { :n :m |
		newFRatioDistribution().initializeSlots(n, m)
	}

}
