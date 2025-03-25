NoncentralChiSquareDistribution : [Object, ProbabilityDistribution] { | nu lambda |

	randomVariate { :self :rng :shape |
		let nu = self.nu;
		let lambda = self.lambda;
		{
			rng.noncentralChiSquareDistribution(nu, lambda)
		} ! shape
	}

}

+[SmallFloat, Symbol] {

	NoncentralChiSquareDistribution { :nu :lambda |
		newNoncentralChiSquareDistribution().initializeSlots(nu, lambda)
	}

}
