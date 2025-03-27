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
