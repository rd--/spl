+@RandomNumberGenerator {

	noncentralChiSquareDistribution { :self :nu :lambda |
		(lambda = 0).if {
			(nu = 0).if {
				0
			} {
				self.gammaDistribution(nu / 2, 2)
			}
		} {
			let r = self.poissonDistribution(lambda / 2);
			(r > 0).ifTrue {
				r := self.gammaDistribution(r, 2)
			};
			(nu > 0).ifTrue {
				r := r + self.gammaDistribution(nu / 2, 2)
			};
			r
		}
	}

}

NoncentralChiSquareDistribution : [Object, Equatable, ProbabilityDistribution] { | nu lambda |

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
