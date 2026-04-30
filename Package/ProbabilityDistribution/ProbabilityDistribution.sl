@ProbabilityDistribution {

	[cdf, cumulativeDistributionFunction] { :self :x |
		self.cdf.value(x)
	}

	cumulativeDistributionFunction { :self |
		self.cdf
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

	[pdf, probabilityDensityFunction] { :self :x |
		self.pdf.value(x)
	}

	probabilityDensityFunction { :self |
		self.pdf
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
