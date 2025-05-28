+[SmallFloat, Fraction] {

	sawtoothWave { :x |
		x % 1
	}

	squareWave { :x |
		let u = x % 1;
		(u >= 0.5).if {
			-1
		} {
			1
		}
	}

	triangleWave { :x |
		let u = x % 1;
		(u >= 0.75).if {
			4 * (u - 1)
		} {
			(u >= 0.25).if {
				-2 * ((2 * u) - 1)
			} {
				4 * u
			}
		}
	}

}

+[List, Range] {

	sawtoothWave { :self |
		self.collect(sawtoothWave:/1)
	}

	squareWave { :self |
		self.collect(squareWave:/1)
	}

	triangleWave { :self |
		self.collect(triangleWave:/1)
	}

}
