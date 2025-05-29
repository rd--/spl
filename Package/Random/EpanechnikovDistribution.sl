EpanechnikovDistribution : [Object] { | c |

	cdf { :self |
		let c = self.c;
		let m = 3 / (4 * c);
		{ :x |
			let y = x.clip([0 - c, c]);
			0.5 + (m * y) - ((y ^ 3) / (4 * (c ^ 3)))
		}
	}

	mean { :self |
		0
	}

	median { :self |
		0
	}

	pdf { :self |
		let c = self.c;
		let m = 3 / (4 * c);
		{ :x |
			m * max(0, 1 - ((x / c) ^ 2))
		}
	}

	skewness { :self |
		0
	}

	support { :self |
		let c = self.c;
		Interval(c.negated, c)
	}

	variance { :self |
		self.c.squared / 5
	}

}

+SmallFloat {

	EpanechnikovDistribution { :c |
		newEpanechnikovDistribution().initializeSlots(c)
	}

}
