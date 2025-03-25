NoncentralBetaDistribution : [Object, ProbabilityDistribution] { | alpha beta delta |

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		let delta = self.delta;
		{
			rng.noncentralBetaDistribution(alpha, beta, delta)
		} ! shape
	}

}

+[SmallFloat, Symbol] {

	NoncentralBetaDistribution { :alpha :beta :delta |
		newNoncentralBetaDistribution().initializeSlots(alpha, beta, delta)
	}

}
