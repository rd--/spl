/* Requires: RandomNumberGenerator */

+@Number {

	normalDistributionCdf { :x :mu :sigma |
		0.5 * ((mu - x) / (2.sqrt * sigma)).erfc
	}

	normalDistributionPdf { :x :mu :sigma |
		let n = (-0.5 * ((x - mu) / sigma).squared).exp;
		let d = sigma * 2.pi.sqrt;
		n / d
	}

	poissonDistributionPdf { :x :lambda |
		(x * lambda.log - lambda - (x + 1).logGamma).exp
	}

	weibullDistributionCdf { :x :gamma :alpha :mu |
		(x >= 0).if {
			1 - (((x - mu) / alpha) ^ gamma).negated.exp
		} {
			0
		}
	}

	weibullDistributionCdf { :x :gamma |
		x.weibullDistributionCdf(gamma, 1, 0)
	}

	weibullDistributionPdf { :x :gamma :alpha :mu |
		(x >= mu).if {
			(gamma / alpha) * (((x - mu) / alpha) ^ (gamma - 1)) * (((x - mu) / alpha) ^ gamma).negated.exp
		} {
			0
		}
	}

	weibullDistributionPdf { :x :gamma |
		x.weibullDistributionPdf(gamma, 1, 0)
	}

}

+List {

	normalDistributionCdf { :self :mu :sigma |
		self.collect { :x |
			x.normalDistributionCdf(mu, sigma)
		}
	}

	normalDistributionPdf { :self :mu :sigma |
		self.collect { :x |
			x.normalDistributionPdf(mu, sigma)
		}
	}

	poissonDistributionPdf { :x :lambda |
		self.collect { :x |
			x.poissonDistributionPdf(lambda)
		}
	}

}

+@RandomNumberGenerator {

	nextRandomFloatEulerianBetaDistribution { :self :x1 :x2 :p1 :p2 |
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
		spread * r.pi.tan + mean
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

	nextRandomFloatWeibullDistribution { :self :alpha :beta :mu |
		let r = 1;
		{
			r = 1
		}.whileTrue {
			r := self.nextRandomFloat
		};
		beta * (r.log.negated ^ (1 / alpha)) + mu
	}

}

BernoulliDistribution : [Object] { | p |

	cdf { :self :x |
		(x < 0).if {
			0
		} {
			(x < 1).if {
				1 - self.p
			} {
				1
			}
		}
	}

	kurtosis { :self |
		let p = self.p;
		let v = (1 - p) * p;
		3 + ((1 - (6 * v)) / v)
	}

	mean { :self |
		self.p
	}

	median { :self |
		(self.p > 0.5).if {
			1
		} {
			0
		}
	}

	pdf { :self :x |
		let p = self.p;
		(x = 0).if {
			1 - p
		} {
			(x = 1).if {
				p
			} {
				0
			}
		}
	}

	randomVariate { :self :rng :shape |
		let p = self.p;
		{
			(rng.nextRandomFloat < p).boole
		} ! shape
	}

	skewness { :self |
		let p = self.p;
		let v = (1 - p) * p;
		(1 - (2 * p)) / v.sqrt
	}

	variance { :self |
		let p = self.p;
		(1 - p) * p
	}

}

CauchyDistribution : [Object] { | x0 gamma |

	cdf { :self :x |
		let [x0, gamma] = [self.x0, self.gamma];
		(1 / 1.pi) * ((x - x0) / gamma).arcTan + 0.5
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

	randomVariate { :self :rng :shape |
		let [x0, gamma] = [self.x0, self.gamma];
		{
			rng.nextRandomFloatCauchyDistribution(x0, gamma)
		} ! shape
	}

	variance { :self |
		self.error('CauchyDistribution>>variance: undefined')
	}

}

ExponentialDistribution : [Object] { | lambda |

	cdf { :self :x |
		let lambda = self.lambda;
		(x >= 0).if {
			1 - (-1 * x * lambda).exp
		} {
			0
		}
	}

	kurtosis { :unused |
		9
	}

	mean { :self |
		1 / self.lambda
	}

	median { :self |
		2.log / self.lambda
	}

	pdf { :self :x |
		let lambda = self.lambda;
		(x >= 0).if {
			(-1 * x * lambda).exp * lambda
		} {
			0
		}
	}

	randomVariate { :self :rng :shape |
		let lambda = self.lambda;
		let negativeLambda = lambda.-;
		{
			let u = rng.nextRandomFloat;
			(1 - u).log / negativeLambda
		} ! shape
	}

	skewness { :unused |
		2
	}

	variance { :self |
		1 / self.lambda.squared
	}

}

GeometricDistribution : [Object] { | p |

	cdf { :self :x |
		let p = self.p;
		(x >= 0).if {
			1 - ((1 - p) ^ (1 + x.floor))
		} {
			0
		}
	}

	mean { :self |
		let p = self.p;
		-1 + (1 / p)
	}

	pdf { :self :x |
		let p = self.p;
		(x >= 0).if {
			((1 - p) ^ x) * p
		} {
			0
		}
	}

	randomVariate { :self :rng :shape |
		let p = self.p;
		{
			let i = 0;
			{
				rng.nextRandomFloat(0, 1) <= p
			}.whileFalse {
				i := i + 1
			};
			i
		} ! shape
	}

	skewness { :self |
		let p = self.p;
		(2 - p) / (1 - p).sqrt
	}

	variance { :self |
		let p = self.p;
		(1 - p) / p.squared
	}

}

NormalDistribution : [Object] { | mu sigma |

        cdf { :self :x |
		x.normalDistributionCdf(self.mu, self.sigma)
	}

        mean { :self |
		self.mu
	}

        pdf { :self :x |
		x.normalDistributionPdf(self.mu, self.sigma)
	}

	randomVariate { :self :rng :shape |
		let [mu, sigma] = [self.mu, self.sigma];
		{
			rng.nextRandomFloatGaussianDistribution(mu, sigma)
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

	randomVariate { :self :rng :shape |
		rng.randomReal(self.min, self.max, shape)
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

WeibullDistribution : [Object] { | alpha beta mu |

	cdf { :self :x |
		x.weibullDistributionCdf(self.alpha, self.beta, self.mu)
	}

	mean { :self |
		self.beta * (1 + (1 / self.alpha)).gamma + self.mu
	}

	median { :self |
		self.beta * (2.log ^ (1 / self.alpha)) + self.mu
	}

	pdf { :self :x |
		x.weibullDistributionPdf(self.alpha, self.beta, self.mu)
	}

	randomVariate { :self :rng :shape |
		let [alpha, beta, mu] = [self.alpha, self.beta, self.mu];
		{
			rng.nextRandomFloatWeibullDistribution(alpha, beta, mu)
		} ! shape
	}

}

+@Number {

	BernoulliDistribution { :p |
		newBernoulliDistribution().initializeSlots(p)
	}

	CauchyDistribution { :x0 :gamma |
		newCauchyDistribution().initializeSlots(x0, gamma)
	}

	ExponentialDistribution { :lambda |
		newExponentialDistribution().initializeSlots(lambda)
	}

	GeometricDistribution { :p |
		newGeometricDistribution().initializeSlots(p)
	}

	NormalDistribution { :mu :sigma |
		newNormalDistribution().initializeSlots(mu, sigma)
	}

	UniformDistribution { :min :max |
		newUniformDistribution().initializeSlots(min, max)
	}

	WeibullDistribution { :alpha :beta :mu |
		newWeibullDistribution().initializeSlots(alpha, beta, mu)
	}

}
