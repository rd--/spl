+@RandomNumberGenerator {

	inverseGaussianDistribution { :self :mu :lambda |
		let v = self.normalDistribution(0, 1);
		let y = v * v;
		let x = mu + ((mu * mu * y) / (2 * lambda)) - ((mu / (2 * lambda)) * ((4 * mu * lambda * y) + (mu * mu * y * y)).sqrt);
		let z = self.nextRandomFloat;
		(z <= (mu / (mu + x))).if {
			x
		} {
			(mu * mu) / x
		}
	}

}

InverseGaussianDistribution : [Object] { | mu lambda |

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		let lambda = self.lambda;
		{
			rng.inverseGaussianDistribution(mu, lambda)
		} ! shape
	}

}

+SmallFloat {

	InverseGaussianDistribution { :mu :lambda |
		newInverseGaussianDistribution().initializeSlots(mu, lambda)
	}

}
