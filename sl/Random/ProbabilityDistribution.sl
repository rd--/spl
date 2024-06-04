{- Requires: RandomNumberGenerator -}

+@Number {

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

}

+@RandomNumberGenerator {

	nextRandomFloatEularianBetaDistribution { :self :x1 :x2 :p1 :p2 |
		let p1r = 1 / p1;
		let p2r = 1 / p2;
		let sum = 2;
		let next = nil;
		{
			sum > 1
		}.whileTrue {
			next := self.nextRandomFloat ^ p1r;
			sum := next + (self.nextRandomFloat ^ p2r)
		};
		((next / sum) * (x2 - x1)) + x1
	}

	nextRandomFloatCauchyDistribution { :self :mean :spread |
		let r = 0.5;
		{
			r = 0.5
		}.whileTrue {
			r := self.nextRandomFloat
		};
		spread * (r * pi).tan + mean
	}

	nextRandomFloatGaussianDistribution { :self :mu :sigma |
		(((-2 * self.nextRandomFloat.log).sqrt * (2.pi * self.nextRandomFloat).sin) * sigma) + mu
	}

	nextRandomFloatLinearDistribution { :self :x1 :x2 |
		let r1 = self.nextRandomFloat;
		let r2 = self.nextRandomFloat;
		(r1 < r2).ifTrue {
			r2 := r1
		};
		r2 * (x2 - x1) + x1
	}

	nextRandomFloatLogisticDistribution { :self :mean :spread |
		let u = self.nextRandomFloat;
		(u / (1 - u)).log * spread + mean
	}

	nextRandomFloatParetoDistribution { :self :shape |
		(self.nextRandomFloat ^ (-1 / shape)) * self
	}

	nextRandomIntegerPoissonDistribution { :self :n |
		let k = 0;
		let r = self.nextRandomFloat;
		let t = n.negated.exp;
		{
			r > t
		}.whileTrue {
			k := k + 1;
			r := r * self.nextRandomFloat
		};
		k
	}

	nextRandomFloatWeibullDistribution { :self :location :spread :shape |
		let r = 1;
		{
			r = 1
		}.whileTrue {
			r := self.nextRandomFloat
		};
		spread * (r.log.negated ^ (1 / shape)) + location
	}

}

CauchyDistribution : [Object] { | x0 gamma |

	cdf { :self :x |
		let [x0, gamma] = [self.x0, self.gamma];
		(1 / pi) * ((x - x0) / gamma).arcTan + 0.5
	}

	entropy { :self |
		(4.pi * self.gamma).log
	}

	mean { :self |
		self.error('CauchyDistribution>>mean: undefined')
	}

	median { :self |
		self.x0
	}

	mode { :self |
		self.x0
	}

	pdf { :self :x |
		let [x0, gamma] = [self.x0, self.gamma];
		1 / (gamma.pi * (1 + ((x - x0) / gamma).squared))
	}

	quantile { :self :p |
		self.x0 + (self.gamma * (p - 0.5).pi.tan)
	}

	randomVariate { :self :shape |
		let [x0, gamma] = [self.x0, self.gamma];
		{
			system.nextRandomFloatCauchyDistribution(x0, gamma)
		} ! shape
	}

	variance { :self |
		self.error('CauchyDistribution>>variance: undefined')
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

	randomVariate { :self :shape |
		let [mu, sigma] = [self.mu, self.sigma];
		{
			system.nextRandomFloatGaussianDistribution(mu, sigma)
		} ! shape
	}

	standardDeviation { :self |
		self.sigma
	}

	variance { :self |
		self.sigma.squared
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

	randomVariate { :self :shape |
		system.randomReal(self.min, self.max, shape)
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

+@Number {

	CauchyDistribution { :x0 :gamma |
		newCauchyDistribution().initializeSlots(x0, gamma)
	}

	NormalDistribution { :mu :sigma |
		newNormalDistribution().initializeSlots(mu, sigma)
	}

	UniformDistribution { :min :max |
		newUniformDistribution().initializeSlots(min, max)
	}

}
