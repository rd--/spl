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

}
