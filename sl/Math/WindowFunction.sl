/* Requires: Interval */

+@Number {

	bartlettWindow { :self |
		(self.abs > 0.5).if {
			0
		}  {
			(self  > 0).if {
				1 - (2 * self)
			} {
				1 + (2 * self)
			}
		}
	}

	blackmanWindow { :self |
		(self.abs > 0.5).if {
			0
		}  {
			(1 / 50) * (25 * (2.pi * self).cos + (4 * (4.pi * self).cos) + 21)
		}
	}

	blackmanHarrisWindow { :self |
		(self.abs > 0.5).if {
			0
		}  {
			((48829 * (2.pi * self).cos) + (14128 * (4.pi * self).cos) + (1168 * (6.pi * self).cos) + 35875) / 100000
		}
	}

	dirichletWindow { :self |
		(self.abs > 0.5).if {
			0
		}  {
			1
		}
	}

	gaussianWindow { :self :sigma |
		(self.abs > 0.5).if {
			0
		} {
			(self.squared / (2 * sigma.squared)).negated.exp
		}
	}

	gaussianWindow { :self |
		self.gaussianWindow(3 / 10)
	}

	hammingWindow { :self |
		(self.abs > 0.5).if {
			0
		}  {
			(21 / 46) * (2.pi * self).cos + (25 / 46)
		}
	}

	hannWindow { :self :alpha |
		(self.abs > 0.5).if {
			0
		}  {
			let c = (2.pi * self).cos;
			alpha - (alpha * c) + c
		}
	}

	hannWindow { :self |
		self.hannWindow(0.5)
	}

	welchWindow { :self :alpha |
		(self.abs > 0.5).if {
			0
		}  {
			(alpha.squared - (4 * self.squared)) / alpha.squared
		}
	}

	welchWindow { :self |
		self.welchWindow(1)
	}

}

+@Collection {

	bartlettWindow { :self |
		self.collect(bartlettWindow:/1)
	}

	blackmanWindow { :self |
		self.collect(blackmanWindow:/1)
	}

	blackmanHarrisWindow { :self |
		self.collect(blackmanHarrisWindow:/1)
	}

	dirichletWindow { :self |
		self.collect(dirichletWindow:/1)
	}

	gaussianWindow { :self :sigma |
		self.collect { :each |
			each.gaussianWindow(sigma)
		}
	}

	gaussianWindow { :self |
		self.collect(gaussianWindow:/1)
	}

	hammingWindow { :self |
		self.collect(hammingWindow:/1)
	}

	hannWindow { :self :alpha |
		self.collect { :each |
			each.hannWindow(alpha)
		}
	}

	hannWindow { :self |
		self.hannWindow(0.5)
	}

	welchWindow { :self :alpha |
		self.collect { :each |
			each.welchWindow(alpha)
		}
	}

	welchWindow { :self |
		self.collect(welchWindow:/1)
	}

}

+@Integer {

	hammingTable { :self |
		Interval(-0.5, 0.5).discretize(self, hammingWindow:/1)
	}

	hannTable { :self |
		Interval(-0.5, 0.5).discretize(self, hannWindow:/1)
	}

	welchTable { :self |
		Interval(-0.5, 0.5).discretize(self, welchWindow:/1)
	}

}
