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

	bartlettHannWindow { :self |
		(self.abs > 0.5).if {
			0
		}  {
			let a0 = 0.62;
			let a1 = 0.48;
			let a2 = 0.38;
			a0 - (a1 * self.abs) + (a2 * (2.pi * self).cos)
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

	cosineWindow { :self :alpha |
		(self.abs > 0.5).if {
			0
		}  {
			self.pi.cos ^ alpha
		}
	}

	cosineWindow { :self |
		self.cosineWindow(1)
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

	kaiserWindow { :x :a |
		(x.abs <= 0.5).if {
			0.besselI((1 - (2 * x)).sqrt * (1 + (2 * x)).sqrt * a) / 0.besselI(a)
		} {
			0
		}
	}

	kaiserWindow { :x |
		x.kaiserWindow(3)
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

	cosineWindow { :self :alpha |
		self.collect { :each |
			each.cosineWindow(alpha)
		}
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

	hammingWindowTable { :self |
		Interval(-0.5, 0.5).discretize(self, hammingWindow:/1)
	}

	hannWindowTable { :self |
		Interval(-0.5, 0.5).discretize(self, hannWindow:/1)
	}

	kaiserWindowTable { :self :alpha |
		Interval(-0.5, 0.5).discretize(self) { :x |
			x.kaiserWindow(alpha)
		}
	}

	welchWindowTable { :self :alpha |
		Interval(-0.5, 0.5).discretize(self) { :x |
			x.welchWindow(alpha)
		}
	}

}
