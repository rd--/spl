+@RandomNumberGenerator {

	chiSquareDistribution { :self :nu |
		self.gammaDistribution(nu / 2, 2)
	}

	gammaDistribution { :self :alpha :beta |
		var a, afix, c, d, u, v, x;
		(alpha < 1).if {
			a := alpha + 1;
			afix := self.nextRandomFloat ^ (1 / alpha)
		} {
			a := alpha;
			afix := 1
		};
		d := a - (1 / 3);
		c := 1 / (9 * d).sqrt;
		{
			{
				x := self.normalDistribution(0, 1);
				v := 1 + (c * x)
			}.doWhileTrue {
				v <= 0
			};
			v := v * v * v;
			x := x * x;
			u := self.nextRandomFloat
		}.doWhileTrue {
			u >= (1 - (0.0331 * x * x)) | {
				u.log >= ((0.5 * x) + (d * (1 - v + v.log)))
			}
		};
		afix * d * v * beta
	}

}

GammaDistribution : [Object, ProbabilityDistribution] { | alpha beta |

	cdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			(x / beta).lowerIncompleteGamma(alpha)
		}
	}

	mean { :self |
		self.alpha * self.beta
	}

	pdf { :self |
		{ :x |
			let alpha = self.alpha;
			let beta = self.beta;
			((x / beta).-.exp * (x ^ (alpha - 1)) * (beta ^ alpha.-)) / alpha.gamma
		}
	}

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		{
			rng.gammaDistribution(alpha, beta)
		} ! shape
	}

	survivalFunction { :self :x |
		(x / self.beta).upperIncompleteGamma(self.alpha)
	}

	variance { :self |
		self.alpha * self.beta.squared
	}

}

+[SmallFloat, Symbol] {

	ChiSquareDistribution { :nu |
		newGammaDistribution().initializeSlots(nu / 2, 2)
	}

	GammaDistribution { :alpha :beta |
		newGammaDistribution().initializeSlots(alpha, beta)
	}

}
