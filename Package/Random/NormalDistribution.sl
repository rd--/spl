+@RandomNumberGenerator {

	boxMullerTransform { :self |
		let u = self.nextRandomFloat;
		let v = self.nextRandomFloat;
		let r = (-2 * u.log).sqrt;
		let z = 2.pi * v;
		[
			r * z.sin,
			r * z.cos
		]
	}

	marsagliaPolarMethod { :self |
		let u = nil;
		let v = nil;
		let w = nil;
		{
			u := self.nextRandomFloat * 2 - 1;
			v := self.nextRandomFloat * 2 - 1;
			w := (u * u) + (v * v);
			w >= 1
		}.whileTrue;
		[
			u * (-2 * w.log / w).sqrt,
			v * (-2 * w.log / w).sqrt
		]
	}

	normalDistribution { :self :mu :sigma |
		/* Box-Muller */
		let u = self.nextRandomFloat;
		let v = self.nextRandomFloat;
		let x = (-2 * u.log).sqrt * (2.pi * v).sin;
		(x * sigma) + mu
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
		let mu = self.mu;
		let sigma = self.sigma;
		{ :p |
			(p >= 0 & { p <= 1 }).if {
				/* mu - (2.sqrt * sigma * (2 * p).inverseErfc) */
				mu + (p.standardNormalDistributionInverseCdf * sigma)
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
			rng.normalDistribution(mu, sigma)
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

+[SmallFloat, Symbol] {

	NormalDistribution { :mu :sigma |
		newNormalDistribution().initializeSlots(mu, sigma)
	}

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
