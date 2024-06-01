{- https://github.com/supercollider/sc3-plugins/blob/main/source/LoopBufUGens/sc/classes/LJP%20Classes/ProbabilityDistributions.sc -}

+@Number {

	NormalDistribution { :mu :sigma |
		newNormalDistribution().initializeSlots(mu, sigma)
	}

	normalDistributionCdf { :mu :sigma :x |
		0.5 * ((mu - x) / (2.sqrt * sigma)).erfc
	}

	normalDistributionPdf { :mu :sigma :x |
		let n = (-0.5 * ((x - mu) / sigma).squared).exp;
		let d = sigma * 2.pi.sqrt;
		n / d
	}

	poissonDistributionPdf { :lambda :x |
		(x * lambda.log - lambda - (x + 1).logGamma).exp
	}

	randomFloatEularianBetaDistribution { :x1 :x2 :p1 :p2 |
		let p1r = 1 / p1;
		let p2r = 1 / p2;
		let sum = 2;
		let next = nil;
		{
			sum > 1
		}.whileTrue {
			next := 1.randomFloat ^ p1r;
			sum := next + (1.randomFloat ^ p2r)
		};
		((next / sum) * (x2 - x1)) + x1
	}

	randomFloatCauchyDistribution { :mean :spread |
		let r = 0.5;
		{
			r = 0.5
		}.whileTrue {
			r := 1.randomFloat
		};
		spread * (r * pi).tan + mean
	}

	randomFloatGaussianDistribution { :mu :sigma |
		(((-2 * 1.randomFloat.log).sqrt * 2.pi.randomFloat.sin) * sigma) + mu
	}

	randomFloatLinearDistribution { :x1 :x2 |
		let r1 = 1.randomFloat;
		let r2 = 1.randomFloat;
		(r1 < r2).ifTrue {
			r2 := r1
		};
		r2 * (x2 - x1) + x1
	}

	randomFloatLogisticDistribution { :mean :spread |
		let u = 1.randomFloat;
		(u / (1 - u)).log * spread + mean
	}

	randomFloatParetoDistribution { :self :shape |
		(1.randomFloat ^ (-1 / shape)) * self
	}

	randomIntegerPoissonDistribution { :self |
		let k = 0;
		let r = 1.randomFloat;
		let t = self.negated.exp;
		{
			r > t
		}.whileTrue {
			k := k + 1;
			r := r * 1.randomFloat
		};
		k
	}

	randomFloatWeibullDistribution { :location :spread :shape |
		let r = 1;
		{
			r = 1
		}.whileTrue {
			r := 1.randomFloat
		};
		spread * (r.log.negated ^ (1 / shape)) + location
	}

	UniformDistribution { :min :max |
		newUniformDistribution().initializeSlots(min, max)
	}

}

UniformDistribution : [Object] { | min max |

	cdf { :self :x |
		let [min, max] = [self.min, self.max];
		(x < min).if {
			0
		} {
			(x > max).if {
				1
			} {
				(x - min) / (max - min)
			}
		}
	}

	entropy { :self |
		(self.max - self.min).log
	}

	kurtosis { :self |
		9/5
	}

	mean { :self |
		(self.min + self.max) / 2
	}

	median { :self |
		(self.min + self.max) / 2
	}

	pdf { :self :x |
		x.betweenAnd(self.min, self.max).if {
			1
		} {
			0
		}
	}

	randomVariate { :self |
		randomFloat(self.min, self.max)
	}

	randomVariate { :self :shape |
		let [min, max] = [self.min, self.max];
		{
			randomFloat(min, max)
		} ! shape
	}

	skewness { :self |
		0
	}

	standardDeviation { :self |
		self.variance.sqrt
	}

	variance { :self |
		(self.max - self.min).squared / 12
	}

}

NormalDistribution : [Object] { | mu sigma |

	cdf { :self :x |
		normalDistributionCdf(self.mu, self.sigma, x)
	}

	mean { :self |
		self.mu
	}

	pdf { :self :x |
		normalDistributionPdf(self.mu, self.sigma, x)
	}

	randomVariate { :self |
		randomFloatGaussianDistribution(self.mu, self.sigma)
	}

	randomVariate { :self :shape |
		let [mu, sigma] = [self.mu, self.sigma];
		{
			randomFloatGaussianDistribution(mu, sigma)
		} ! shape
	}

	standardDeviation { :self |
		self.sigma
	}

	variance { :self |
		self.sigma.squared
	}

}
