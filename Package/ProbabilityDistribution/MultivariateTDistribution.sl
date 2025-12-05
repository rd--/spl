MultivariateTDistribution : [Object] { | mu sigma nu |

	randomVariate { :self :r :shape |
		let k = self.sigma.size;
		let [n] = shape;
		let x = ChiSquareDistribution(self.nu).randomVariate(r, shape) / self.nu;
		let z = MultinormalDistribution(List(k, 0), self.sigma).randomVariate(r, shape);
		[self.mu] + (z / x.sqrt)
	}

}

+List {

	MultivariateTDistribution { :mu :sigma :nu |
		newMultivariateTDistribution().initializeSlots(mu, sigma, nu)
	}

}
