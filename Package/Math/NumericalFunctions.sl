+[Float, Fraction] {

	cosineWave { :x |
		(x * 2.0.pi).cos
	}

	sawtoothWave { :x |
		x % 1.0
	}

	squareWave { :x |
		let u = x % 1.0;
		(u >= 0.5).if {
			-1.0
		} {
			1.0
		}
	}

	triangleWave { :x |
		let u = x % 1.0;
		(u >= 0.75).if {
			4.0 * (u - 1.0)
		} {
			(u >= 0.25).if {
				-2.0 * ((2.0 * u) - 1.0)
			} {
				4.0 * u
			}
		}
	}

}

+[List, Range] {

	cosineWave { :self |
		self.collect(cosineWave/1)
	}

	sawtoothWave { :self |
		self.collect(sawtoothWave/1)
	}

	squareWave { :self |
		self.collect(squareWave/1)
	}

	triangleWave { :self |
		self.collect(triangleWave/1)
	}

}
