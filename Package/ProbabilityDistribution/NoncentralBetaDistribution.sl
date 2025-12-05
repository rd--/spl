+@RandomNumberGenerator {

	noncentralBetaDistribution { :self :alpha :beta :delta |
		(delta = 0).if {
			self.betaDistribution(alpha, beta)
		} {
			let x = self.noncentralChiSquareDistribution(2 * alpha, delta);
			x / (x + self.gammaDistribution(beta, 2))
		}
	}

}

NoncentralBetaDistribution : [Object, Equatable, ProbabilityDistribution] { | alpha beta delta |

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
