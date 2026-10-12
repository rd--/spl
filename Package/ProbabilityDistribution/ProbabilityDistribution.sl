@ProbabilityDistribution {

	[cdf, cumulativeDistributionFunction] { :self |
		self.typeResponsibility('cdf')
	}

	[cdf, cumulativeDistributionFunction] { :self :x |
		let f/1 = self.cdf;
		f(x)
	}

	cumulativeDistributionFunction { :self |
		self.cdf
	}

	hazardFunction { :self :x |
		let f/1 = self.hazardFunction;
		f(x)
	}

	inverseCdf { :self :x |
		let f/1 = self.inverseCdf;
		f(x)
	}

	inverseSurvivalFunction { :self :x |
		let f/1 = self.inverseSurvivalFunction;
		f(x)
	}

	[pdf, probabilityDensityFunction] { :self |
		self.typeResponsibility('pdf')
	}

	[pdf, probabilityDensityFunction] { :self :x |
		let f/1 = self.pdf;
		f(x)
	}

	probabilityDensityFunction { :self |
		self.pdf
	}

	quantileFunction { :self :x |
		let f/1 = self.quantileFunction;
		f(x)
	}

	survivalFunction { :self |
		let f/1 = self.cdf;
		{ :x |
			1 - f(x)
		}
	}

	survivalFunction { :self :x |
		let f/1 = self.survivalFunction;
		f(x)
	}

}
