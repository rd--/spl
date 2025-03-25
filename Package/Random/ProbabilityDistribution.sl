/* Requires: RandomNumberGenerator */

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

	survivalFunction { :self |
		let f:/1 = self.cdf;
		{ :x |
			1 - f(x)
		}
	}

	survivalFunction { :self :x |
		self.survivalFunction.value(x)
	}

}

+@RandomNumberGenerator {

	betaDistribution { :self :alpha :beta |
		let x = self.gammaDistribution(alpha, 1);
		let y = self.gammaDistribution(beta, 1);
		x / (x + y)
	}

	binomialDistribution { :self :n :p |
		let answer = 0;
		n.timesRepeat {
			let u = self.nextRandomFloat;
			(u < p).ifTrue {
				answer := answer + 1
			}
		};
		answer
	}

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

	eulerianBetaDistribution { :self :x1 :x2 :p1 :p2 |
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

	cauchyDistribution { :self :x0 :gamma |
		let u = self.nextRandomFloat;
		x0 + (gamma * (u - 0.5).pi.tan)
	}
	exponentialDistribution { :self :lambda |
		let u = self.nextRandomFloat;
		(1 - u).log / lambda.-
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

	noncentralBetaDistribution { :self :alpha :beta :delta |
		(delta = 0).if {
			self.betaDistribution(alpha, beta)
		} {
			let x = self.noncentralChiSquareDistribution(2 * alpha, delta);
			x / (x + self.gammaDistribution(beta, 2))
		}
	}

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

	normalDistribution { :self :mu :sigma |
		let u = self.nextRandomFloat;
		let v = self.nextRandomFloat;
		let x = (-2 * u.log).sqrt * (2.pi * v).sin;
		(x * sigma) + mu
	}

	studentTDistribution { :self :mu :sigma :nu |
		let gamma = self.gammaDistribution(0.5 * nu, 0.5);
		self.normalDistribution(
			mu,
			sigma * (nu / gamma).sqrt
		)
	}

	triangularDistribution { :self :min :max :c |
		let u = self.nextRandomFloat;
		(u < ((c - min) / (max - min))).if {
			min + (u * (max - min) * (c - min)).sqrt
		} {
			max - ((1 - u) * (max - min) * (max - c)).sqrt
		}
	}

	logisticDistribution { :self :mu :beta |
		let u = self.nextRandomFloat;
		(u / (1 - u)).log * beta + mu
	}

	paretoDistribution { :self :k :alpha |
		let e = -1 / alpha;
		let u = self.nextRandomFloat;
		k * (u ^ e)
	}

	poissonDistribution { :self :mu |
		let k = 0;
		let r = self.nextRandomFloat;
		let t = mu.negated.exp;
		{
			r > t
		}.whileTrue {
			k := k + 1;
			r := r * self.nextRandomFloat
		};
		k
	}

	weibullDistribution { :self :alpha :beta :mu |
		let r = 1;
		{
			r = 1
		}.whileTrue {
			r := self.nextRandomFloat
		};
		beta * (r.log.negated ^ (1 / alpha)) + mu
	}

}
