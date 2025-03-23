/* Requires: RandomNumberGenerator */

+@Number {

	standardNormalDistributionInverseCdf { :self |
		let ratEval = { :a :b :x |
			let u = a.last;
			let v = b.last;
			(a.size - 1).downToDo(1) { :i |
				u := (x * u) + a[i]
			};
			(b.size - 1).downToDo(1) { :i |
				v := (x * v) + b[i]
			};
			u / v
		};
		let small = { :q |
			let a = [
				3.387132872796366608, 133.14166789178437745,
				1971.5909503065514427, 13731.693765509461125,
				45921.953931549871457, 67265.770927008700853,
				33430.575583588128105, 2509.0809287301226727
			];
			let b = [
				1.0, 42.313330701600911252,
				687.1870074920579083, 5394.1960214247511077,
				21213.794301586595867, 39307.89580009271061,
				28729.085735721942674, 5226.495278852854561
			];
			let r = 0.180625 - (q * q);
			let x = q * ratEval(a, b, r);
			x
		};
		let intermediate = { :r |
			let a = [
				1.42343711074968357734, 4.6303378461565452959,
				5.7694972214606914055, 3.64784832476320460504,
				1.27045825245236838258, 0.24178072517745061177,
				0.0227238449892691845833, 7.7454501427834140764E-4
			];
			let b = [ 1.0, 2.05319162663775882187,
				1.6763848301838038494, 0.68976733498510000455,
				0.14810397642748007459, 0.0151986665636164571966,
				5.475938084995344946E-4, 1.05075007164441684324E-9
			];
			let x = ratEval(a, b, r - 1.6);
			x
		};
		let tail = { :r |
			let a = [ 6.6579046435011037772, 5.4637849111641143699,
				1.7848265399172913358, 0.29656057182850489123,
				0.026532189526576123093, 0.0012426609473880784386,
				2.71155556874348757815E-5, 2.01033439929228813265E-7
			];
			let b = [ 1.0, 0.59983220655588793769,
				0.13692988092273580531, 0.0148753612908506148525,
				7.868691311456132591E-4, 1.8463183175100546818E-5,
				1.4215117583164458887E-7, 2.04426310338993978564E-15
			];
			let x = ratEval(a, b, r - 5.0);
			x
		};
		let p = self;
		let dP = p - 0.5;
		(p = 1).if {
			Infinity
		} {
			(p = 0).if {
				-Infinity
			} {
				(dP.abs <= 0.425).if {
					small(dP)
				} {
					let pp = (p < 0.5).if { p } { 1 - p };
					let r = pp.log.-.sqrt;
					let x = (r <= 5.0).if {
						intermediate(r)
					} {
						tail(r)
					};
					(p < 0.5).if {
						x.-
					} {
						x
					}
				}
			}
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

	nextRandomFloatExponentialDistribution { :self :lambda |
		(1 - self.nextRandomFloat).log / lambda.-
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

	nextRandomFloatParetoDistribution { :self :k :alpha |
		let u = self.nextRandomFloat;
		k * (u ^ (-1 / alpha))
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

@ProbabilityDistribution {

	cdf { :self :x |
		self.cdf.value(x)
	}

	hazardFunction { :self :x |
		self.hazardFunction.value(x)
	}

	inverseCdf { :self :x |
		self.inverseCdf.value(x)
	}

	inverseSurvivalFunction { :self :x |
		self.inverseSurvivalFunction.value(x)
	}

	pdf { :self :x |
		self.pdf.value(x)
	}

	quantile { :self :x |
		self.quantile.value(x)
	}

	survivalFunction { :self :x |
		1 - self.cdf(x)
	}

}

BernoulliDistribution : [Object, ProbabilityDistribution] { | p |

	cdf { :self |
		{ :x |
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

	pdf { :self |
		{ :x |
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

BetaDistribution : [Object, ProbabilityDistribution] { | alpha beta |

	cdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			x.betaRegularized(alpha, beta)
		}
	}

	pdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		{ :x |
			let b = (alpha.gamma * beta.gamma) / (alpha + beta).gamma;
			((x ^ (alpha - 1)) * ((1 - x) ^ (beta - 1))) / b
		}
	}

}

BinomialDistribution : [Object, ProbabilityDistribution] { | n p |

	cdf { :self |
		let n = self.n;
		let p = self.p;
		{ :k |
			(0 .. k).collect { :i |
				n.binomial(i) * (p ^ i) * ((1 - p) ^ (n - i))
			}.sum
		}
	}

	kurtosis { :self |
		let n = self.n;
		let p = self.p;
		1 - (6 / n) + (1 / (n * p * (1 - p)))
	}

	mean { :self |
		self.n * self.p
	}

	pdf { :self |
		{ :k |
			let n = self.n;
			let p = self.p;
			n.binomial(k) * (p ^ k) * ((1 - p) ^ (n - k))
		}
	}

	skewness { :self |
		let n = self.n;
		let p = self.p;
		(1 - (2 * p)) / (n * (1 - p) * p).sqrt
	}

	standardDeviation { :self |
		(self.n * self.p * (1 - self.p)).sqrt
	}

}

CauchyDistribution : [Object, ProbabilityDistribution] { | x0 gamma |

	cdf { :self |
		let x0 = self.x0;
		let gamma = self.gamma;
		{ :x |
			(1 / 1.pi) * ((x - x0) / gamma).arcTan + 0.5
		}
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

	pdf { :self |
		let x0 = self.x0;
		let gamma = self.gamma;
		{ :x |
			1 / (gamma.pi * (1 + ((x - x0) / gamma).squared))
		}
	}

	quantile { :self |
		let x0 = self.x0;
		let gamma = self.gamma;
		{ :p |
			x0 + (gamma * (p - 0.5).pi.tan)
		}
	}

	randomVariate { :self :rng :shape |
		let x0 = self.x0;
		let gamma = self.gamma;
		{
			rng.nextRandomFloatCauchyDistribution(x0, gamma)
		} ! shape
	}

	variance { :self |
		self.error('CauchyDistribution>>variance: undefined')
	}

}

ExponentialDistribution : [Object, ProbabilityDistribution] { | lambda |

	cdf { :self |
		let lambda = self.lambda;
		{ :x |
			(x >= 0).if {
				1 - (-1 * x * lambda).exp
			} {
				0
			}
		}
	}

	beta { :self |
		1 / self.lambda
	}

	hazardFunction { :self |
		let lambda = self.lambda;
		{ :x |
			(x >= 0).if {
				lambda
			} {
				0
			}
		}
	}

	inverseCdf { :self |
		let lambda = self.lambda;
		{ :p |
			(p < 1 & { p >= 0 }).if {
				-1 * (1 - p).log / lambda
			} {
				Infinity
			}
		}
	}

	inverseSurvivalFunction { :self |
		let lambda = self.lambda;
		{ :p |
			(p <= 1 & { p >= 0 }).if {
				-1 * (p.log / lambda)
			} {
				(p <= 0).if {
					Infinity
				} {
					0
				}
			}
		}
	}

	kurtosis { :unused |
		9
	}

	mean { :self |
		self.beta
	}

	median { :self |
		2.log / self.lambda
	}

	pdf { :self |
		{ :x |
			let lambda = self.lambda;
			(x >= 0).if {
				(-1 * x * lambda).exp * lambda
			} {
				0
			}
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

	standardDeviation { :self |
		self.beta
	}

	survivalFunction { :self |
		let lambda = self.lambda;
		{ :x |
			(x >= 0).if {
				(-1 * x * lambda).exp
			} {
				1
			}
		}
	}

	variance { :self |
		1 / self.lambda.squared
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

	survivalFunction { :self :x |
		(x / self.beta).upperIncompleteGamma(self.alpha)
	}

	variance { :self |
		self.alpha * self.beta.squared
	}

}

GeometricDistribution : [Object, ProbabilityDistribution] { | p |

	cdf { :self |
		let p = self.p;
		{ :x |
			(x >= 0).if {
				1 - ((1 - p) ^ (1 + x.floor))
			} {
				0
			}
		}
	}

	mean { :self |
		let p = self.p;
		-1 + (1 / p)
	}

	pdf { :self |
		{ :x |
			let p = self.p;
			(x >= 0).if {
				((1 - p) ^ x) * p
			} {
				0
			}
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

LogNormalDistribution : [Object, ProbabilityDistribution] { | mu sigma |

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		let sigma = self.sigma;
		{
			rng.nextRandomFloatGaussianDistribution(mu, sigma).exp
		} ! shape
	}

}

NormalDistribution : [Object, ProbabilityDistribution] { | mu sigma |

        cdf { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		{ :x |
			0.5 * ((mu - x) / (2.sqrt * sigma)).erfc
		}
	}

	inverseCdf { :self |
		{ :p |
			(p >= 0 & { p <= 1 }).if {
				/* self.mu - (2.sqrt * self.sigma * (2 * p).inverseErfc) */
				self.mu + (p.standardNormalDistributionInverseCdf * self.sigma)
			} {
				self.error('inverseCdf')
			}
		}
	}

	inverseSurvivalFunction { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		{ :p |
			(p > 0 & { p < 1 }).if {
				mu + (2.sqrt * sigma * (2 * p).inverseErfc)
			} {
				(p <= 0).if {
					Infinity
				} {
					-Infinity
				}
			}
		}
	}

        mean { :self |
		self.mu
	}

        pdf { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		let d = sigma * 2.pi.sqrt;
		{ :x |
			(-0.5 * ((x - mu) / sigma).squared).exp / d
		}
	}

	randomVariate { :self :rng :shape |
		let mu = self.mu;
		let sigma = self.sigma;
		{
			rng.nextRandomFloatGaussianDistribution(mu, sigma)
		} ! shape
	}

	survivalFunction { :self |
		let mu = self.mu;
		let sigma = self.sigma;
		{ :x |
			0.5 * ((x - mu) / (2.sqrt * sigma)).erfc
		}
	}

	standardDeviation { :self |
		self.sigma
	}

	variance { :self |
		self.sigma.squared
	}

}

ParetoDistribution : [Object, ProbabilityDistribution] { | k alpha |

	cdf { :self |
		let k = self.k;
		let alpha = self.alpha;
		{ :x |
			1 - ((k / x) ^ alpha)
		}
	}

	pdf { :self |
		{ :x |
			let k = self.k;
			let alpha = self.alpha;
			(alpha * (k ^ alpha)) / (x ^ (alpha + 1))
		}
	}

	randomVariate { :self :rng :shape |
		let k = self.k;
		let alpha = self.alpha;
		let e = -1 / alpha;
		{
			let u = rng.nextRandomFloat;
			k * (u ^ e)
		} ! shape
	}

}

PoissonDistribution : [Object, ProbabilityDistribution] { | mu |

        cdf { :self |
		let mu = self.mu;
		{ :x |
			(0 .. x).collect { :i |
				(mu.-.exp * (mu ^ i)) / i.!
			}.sum
		}
	}

	kurtosis { :self |
		3 + (1 / self.mu)
	}

	mean { :self |
		self.mu
	}

        pdf { :self |
		let mu = self.mu;
		{ :x |
			(x * mu.log - mu - (x + 1).logGamma).exp
		}
	}

	skewness { :self |
		1 / self.mu.sqrt
	}

	variance { :self |
		self.mu
	}

}

UniformDistribution : [Object, ProbabilityDistribution] { | min max |

	cdf { :self |
		let min = self.min;
		let max = self.max;
		{ :x |
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

	pdf { :self |
		{ :x |
			x.betweenAnd(self.min, self.max).if {
				1
			} {
				0
			}
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

WeibullDistribution : [Object, ProbabilityDistribution] { | alpha beta mu |

	cdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let mu = self.mu;
		{ :x |
			(x >= 0).if {
				1 - (((x - mu) / beta) ^ alpha).negated.exp
			} {
				0
			}
		}
	}

	hazardFunction { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let mu = self.mu;
		{ :x |
			(x > mu).if {
				(alpha * (((mu.- + x) / beta) ^ (-1 + alpha))) / beta
			} {
				0
			}
		}
	}

	inverseCdf { :self |
		{ :p |
			(p > 0 & { p < 1 }).if {
				self.mu + (self.beta * ((1 - p).log.- ^ (1 / self.alpha)))
			} {
				(p <= 0).if {
					self.mu
				} {
					Infinity
				}
			}
		}
	}

	mean { :self |
		self.beta * (1 + (1 / self.alpha)).gamma + self.mu
	}

	median { :self |
		self.beta * (2.log ^ (1 / self.alpha)) + self.mu
	}

	pdf { :self |
		let alpha = self.alpha;
		let beta = self.beta;
		let mu = self.mu;
		{ :x |
			(x >= mu).if {
				(alpha / beta) * (((x - mu) / beta) ^ (alpha - 1)) * (((x - mu) / beta) ^ alpha).negated.exp
			} {
				0
			}
		}
	}

	randomVariate { :self :rng :shape |
		let alpha = self.alpha;
		let beta = self.beta;
		let mu = self.mu;
		{
			rng.nextRandomFloatWeibullDistribution(alpha, beta, mu)
		} ! shape
	}

}

+@Number {

	BernoulliDistribution { :p |
		newBernoulliDistribution().initializeSlots(p)
	}

	BetaDistribution { :alpha :beta |
		newBetaDistribution().initializeSlots(alpha, beta)
	}

	BinomialDistribution { :n :p |
		newBinomialDistribution().initializeSlots(n, p)
	}

	CauchyDistribution { :x0 :gamma |
		newCauchyDistribution().initializeSlots(x0, gamma)
	}

	ExponentialDistribution { :lambda |
		newExponentialDistribution().initializeSlots(lambda)
	}

	GammaDistribution { :alpha :beta |
		newGammaDistribution().initializeSlots(alpha, beta)
	}

	GeometricDistribution { :p |
		newGeometricDistribution().initializeSlots(p)
	}

	LogNormalDistribution { :mu :sigma |
		newLogNormalDistribution().initializeSlots(mu, sigma)
	}

	NormalDistribution { :mu :sigma |
		newNormalDistribution().initializeSlots(mu, sigma)
	}

	ParetoDistribution { :k :alpha |
		newParetoDistribution().initializeSlots(k, alpha)
	}

	PoissonDistribution { :mu |
		newPoissonDistribution().initializeSlots(mu)
	}

	UniformDistribution { :min :max |
		newUniformDistribution().initializeSlots(min, max)
	}

	WeibullDistribution { :alpha :beta :mu |
		newWeibullDistribution().initializeSlots(alpha, beta, mu)
	}

}
