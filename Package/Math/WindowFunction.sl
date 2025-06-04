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
		let n = self;
		(n.abs > 0.5).if {
			0
		}  {
			let a0 = 0.35875;
			let a1 = 0.48829;
			let a2 = 0.14128;
			let a3 = 0.01168;
			a0 + (a1 * (2.pi * n).cos) + (a2 * (4.pi * n).cos) + (a3 * (6.pi * n).cos)
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

	lanczosWindow { :x |
		(x = 0).if {
			1
		} {
			(x.abs <= 0.5).if {
				let z = 2.pi * x;
				z.sin / z
			} {
				0
			}
		}
	}

	parzenWindow { :x |
		[
			{ x.abs > 0.5 } -> {
				0
			},
			{ x.between(0.25 -- 0.5) } -> {
				-2 * ((2 * x) - 1).cubed
			},
			{ x.between(-0.5 -- -0.25) } -> {
				2 * ((2 * x) + 1).cubed
			},
			{ x.between(-0.25 -- 0) } -> {
				0 - (48 * x.cubed) - (24 * x.squared) + 1
			},
			{ x.between(0 -- 0.25) } -> {
				(48 * x.cubed) - (24 * x.squared) + 1
			}
		].which
	}

	raisedCosinePulse { :alpha |
		{ :x |
			x.sincNormalized * ((alpha.pi * x).cos / (1 - ((2 * alpha * x) ^ 2)))
		}
	}

	tukeyWindow { :x :alpha |
		[
			{ x.abs > 0.5 } -> {
				0
			},
			{ alpha <= 0 } -> {
				1
			},
			{ alpha >= 1.0 } -> {
				x.hannWindow
			},
			{ (alpha - (2 * x) - 1) > 0 & { x >= -0.5 } } -> {
				0.5 * (((2.pi * (0 - (alpha / 2) + x + 0.5)) / alpha).cos + 1)
			},
			{ (alpha + (2 * x) - 1) > 0 & { x <= 0.5 } } -> {
				0.5 * (((2.pi * ((alpha / 2) + x - 0.5)) / alpha).cos + 1)
			},
			{ true } -> {
				1
			}
		].which
	}

	tukeyWindow { :x |
		tukeyWindow(x, 2 / 3)
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

	bartlettHannWindow { :self |
		self.collect(bartlettHannWindow:/1)
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

	flatTopWindow { :x |
		(x.abs > 0.5).if {
			0
		} {
			let a0 = 0.21557895;
			let a1 = 0.41663158;
			let a2 = 0.277263158;
			let a3 = 0.083578947;
			let a4 = 0.006947368;
			a0 + (a1 * (2.pi * x).cos) + (a2 * (4.pi * x).cos) + (a3 * (6.pi * x).cos) + (a4 * (8.pi * x).cos)
		}
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

	kaiserWindow { :self :a |
		self.collect { :each |
			each.kaiserWindow(a)
		}
	}

	lanczosWindow { :self |
		self.collect(lanczosWindow:/1)
	}

	parzenWindow { :self |
		self.collect(parzenWindow:/1)
	}

	tukeyWindow { :self :alpha |
		self.collect { :each |
			each.tukeyWindow(alpha)
		}
	}

	tukeyWindow { :self |
		self.collect(tukeyWindow:/1)
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
