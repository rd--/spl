ArcSinDistribution : [Object, Equatable, ProbabilityDistribution] { | minMax |

	cdf { :self |
		let [xMin, xMax] = self.minMax;
		let p = 2 / 1.pi;
		{ :x |
			(x >= xMax).if {
				1
			} {
				(x <= xMin).if {
					0
				} {
					p * ((x - xMin) / (xMax - xMin)).sqrt.arcSin
				}
			}
		}
	}

	entropy { :self |
		let [xMin, xMax] = self.minMax;
		((xMax - xMin) / 4).pi .log
	}

	mean { :self |
		let [xMin, xMax] = self.minMax;
		(xMin + xMax) / 2
	}

	median { :self |
		self.mean
	}

	pdf { :self |
		let [xMin, xMax] = self.minMax;
		{ :x |
			(x < xMin | { x > xMax }).if {
				0
			} {
				1 / ((xMax - x) * (x - xMin)).sqrt.pi
			}
		}
	}

	skewness { :unused |
		0
	}

	variance { :self |
		let [xMin, xMax] = self.minMax;
		(xMax - xMin).square / 8
	}

}

+List {

	ArcSinDistribution { :minMax |
		newArcSinDistribution().initializeSlots(minMax)
	}

}
