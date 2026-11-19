/* Requires: Interval */

+@Number {

	bartlettHannWindow { :self |
		(self.abs > 0.5).if {
			0.0
		} {
			let a0 = 0.62;
			let a1 = 0.48;
			let a2 = 0.38;
			a0
			- (a1 * self.abs)
			+ (a2 * (2.0.pi * self).cos)
		}
	}

	bartlettWindow { :self |
		(self.abs > 0.5).if {
			0.0
		} {
			(self  > 0.0).if {
				1.0 - (2.0 * self)
			} {
				1.0 + (2.0 * self)
			}
		}
	}

	blackmanHarrisWindow { :x |
		(x.abs > 0.5).if {
			0.0
		} {
			let a0 = 0.35875;
			let a1 = 0.48829;
			let a2 = 0.14128;
			let a3 = 0.01168;
			a0
			+ (a1 * (2.0.pi * x).cos)
			+ (a2 * (4.0.pi * x).cos)
			+ (a3 * (6.0.pi * x).cos)
		}
	}

	blackmanNuttallWindow { :x |
		let a = [0.3635819 0.4891775 0.1365995 0.0106411];
		generalCosineWindow(x, a)
	}

	blackmanWindow { :x |
		let a0 = 0.42;
		let a1 = 0.5;
		let a2 = 0.08;
		(x.abs > 0.5).if {
			0.0
		} {
			a0
			+ (a1 * (2.0.pi * x).cos)
			+ (a2 * (4.0.pi * x).cos)
		}
	}

	bohmanWindow { :x |
		(x.abs > 0.5).if {
			0.0
		} {
			let m = x.sign;
			let a = m * (2.0.pi * x).sin;
			let b = m * 2.0.pi * x * (2.0.pi * x).cos;
			let c = 1.0.pi * (2.0.pi * x).cos;
			(a - b + c) / 1.0.pi
		}
	}

	cosineWindow { :self :alpha |
		(self.abs > 0.5).if {
			0.0
		} {
			self.pi.cos ^ alpha
		}
	}

	cosineWindow { :self |
		self.cosineWindow(1.0)
	}

	dirichletWindow { :self |
		(self.abs > 0.5).if {
			0.0
		} {
			1.0
		}
	}

	flatTopWindow { :x |
		(x.abs > 0.5).if {
			0.0
		} {
			let a0 = 0.21557895;
			let a1 = 0.41663158;
			let a2 = 0.277263158;
			let a3 = 0.083578947;
			let a4 = 0.006947368;
			a0
			+ (a1 * (2.0.pi * x).cos)
			+ (a2 * (4.0.pi * x).cos)
			+ (a3 * (6.0.pi * x).cos)
			+ (a4 * (8.0.pi * x).cos)
		}
	}

	gaussianWindow { :self :sigma |
		(self.abs > 0.5).if {
			0.0
		} {
			(self.square / (2.0 * sigma.square)).negate.exp
		}
	}

	gaussianWindow { :self |
		self.gaussianWindow(3.0 / 10.0)
	}

	generalCosineWindow { :x :a |
		(x.abs > 0.5).if {
			0.0
		} {
			let y = a[1L];
			2L.toDo(a.size) { :k |
				let n = (k - 1.0) * 2.0;
				y := y + (a[k] * (n.pi * x).cos)
			};
			y
		}
	}

	hammingWindow { :self |
		(self.abs > 0.5).if {
			0.0
		} {
			(21.0 / 46.0)
			* (2.0.pi * self).cos
			+ (25.0 / 46.0)
		}
	}

	hannWindow { :self :alpha |
		(self.abs > 0.5).if {
			0.0
		} {
			let c = (2.0.pi * self).cos;
			alpha - (alpha * c) + c
		}
	}

	hannWindow { :self |
		self.hannWindow(0.5)
	}

	kaiserWindow { :x :a |
		(x.abs <= 0.5).if {
			0L.besselI(
				(1.0 - (2.0 * x)).sqrt
				* (1.0 + (2.0 * x)).sqrt
				* a
			) / 0L.besselI(a)
		} {
			0.0
		}
	}

	kaiserWindow { :x |
		x.kaiserWindow(3.0)
	}

	lanczosWindow { :x |
		(x = 0.0).if {
			1.0
		} {
			(x.abs <= 0.5).if {
				let z = 2.0.pi * x;
				z.sin / z
			} {
				0.0
			}
		}
	}

	nuttallWindow { :x |
		let a = [0.355768, 0.487396, 0.144232, 0.012604];
		generalCosineWindow(x, a)
	}

	parzenWindow { :x |
		[
			{ x.abs > 0.5 } -> {
				0.0
			},
			{ x.isBetween(0.25, 0.5) } -> {
				-2.0 * ((2.0 * x) - 1.0).cube
			},
			{ x.isBetween(-0.5, -0.25) } -> {
				2.0 * ((2.0 * x) + 1.0).cube
			},
			{ x.isBetween(-0.25, 0.0) } -> {
				0.0 - (48.0 * x.cube) - (24.0 * x.square) + 1.0
			},
			{ x.isBetween(0.0, 0.25) } -> {
				(48.0 * x.cube) - (24.0 * x.square) + 1.0
			}
		].which
	}

	planckTaperWindow { :x :epsilon |
		let x1 = -0.5;
		let x2 = -0.5 * (1.0 - (2.0 * epsilon));
		let x3 = 0.5 * (1.0 - (2.0 * epsilon));
		let x4 = 0.5;
		[
			{ x <= x1 } -> { 0.0 },
			{ x < x2 } -> {
				let z = ((x2 - x1) / (x - x1)) + ((x2 - x1) / (x - x2));
				1.0 / (z.exp + 1.0)
			},
			{ x <= x3 } -> { 1.0 },
			{ x < x4 } -> {
				let z = ((x3 - x4) / (x - x3)) + ((x3 - x4) / (x - x4));
				1.0 / (z.exp + 1.0)
			},
			{ true } -> { 0.0 }
		].which
	}

	raisedCosinePulse { :alpha |
		{ :x |
			x.sincNormalized * ((alpha.pi * x).cos / (1.0 - ((2.0 * alpha * x) ^ 2.0)))
		}
	}

	sincWindow { :x :a |
		(x.abs <= 0.5).if {
			(x * a * 2.0).sincNormalized
		} {
			0.0
		}
	}

	tukeyWindow { :x :alpha |
		[
			{ x.abs > 0.5 } -> {
				0.0
			},
			{ alpha <= 0.0 } -> {
				1.0
			},
			{ alpha >= 1.0 } -> {
				x.hannWindow
			},
			{
				(alpha - (2.0 * x) - 1.0) > 0.0 & {
					x >= -0.5
				}
			} -> {
				0.5 * (((2.0.pi * (0.0 - (alpha / 2.0) + x + 0.5)) / alpha).cos + 1.0)
			},
			{
				(alpha + (2.0 * x) - 1.0) > 0.0 & {
					x <= 0.5
				}
			} -> {
				0.5 * (((2.0.pi * ((alpha / 2.0) + x - 0.5)) / alpha).cos + 1.0)
			},
			{ true } -> {
				1.0
			}
		].which
	}

	tukeyWindow { :x |
		tukeyWindow(x, 2.0 / 3.0)
	}

	welchWindow { :self :alpha |
		(self.abs > 0.5).if {
			0.0
		} {
			(alpha.square - (4.0 * self.square)) / alpha.square
		}
	}

	welchWindow { :self |
		self.welchWindow(1.0)
	}

}

+@Collection {

	bartlettHannWindow { :self |
		self.collect(bartlettHannWindow/1)
	}

	bartlettWindow { :self |
		self.collect(bartlettWindow/1)
	}

	blackmanHarrisWindow { :self |
		self.collect(blackmanHarrisWindow/1)
	}

	blackmanNuttallWindow { :self |
		self.collect(blackmanNuttallWindow/1)
	}

	blackmanWindow { :self |
		self.collect(blackmanWindow/1)
	}

	bohmanWindow { :self |
		self.collect(bohmanWindow/1)
	}

	cosineWindow { :self :alpha |
		self.collect { :each |
			each.cosineWindow(alpha)
		}
	}

	dirichletWindow { :self |
		self.collect(dirichletWindow/1)
	}

	gaussianWindow { :self :sigma |
		self.collect { :each |
			each.gaussianWindow(sigma)
		}
	}

	gaussianWindow { :self |
		self.collect(gaussianWindow/1)
	}

	hammingWindow { :self |
		self.collect(hammingWindow/1)
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
		self.collect(lanczosWindow/1)
	}

	nuttallWindow { :self |
		self.collect(nuttallWindow/1)
	}

	parzenWindow { :self |
		self.collect(parzenWindow/1)
	}

	planckTaperWindow { :self :epsilon |
		self.collect { :x |
			x.planckTaperWindow(epsilon)
		}
	}

	sincWindow { :self :a |
		self.collect { :each |
			each.sincWindow(a)
		}
	}

	tukeyWindow { :self :alpha |
		self.collect { :each |
			each.tukeyWindow(alpha)
		}
	}

	tukeyWindow { :self |
		self.collect(tukeyWindow/1)
	}

	welchWindow { :self :alpha |
		self.collect { :each |
			each.welchWindow(alpha)
		}
	}

	welchWindow { :self |
		self.collect(welchWindow/1)
	}

}

+[Float, Integer] {

	hammingWindowTable { :n |
		n.windowTable(hammingWindow/1)
	}

	hannWindowTable { :n |
		n.windowTable(hannWindow/1)
	}

	kaiserWindowTable { :n :alpha |
		n.windowTable { :x |
			x.kaiserWindow(alpha)
		}
	}

	welchWindowTable { :n :alpha |
		n.windowTable { :x |
			x.welchWindow(alpha)
		}
	}

	windowTable { :n :f/1 |
		Interval(-0.5, 0.5).discretize(n, f/1)
	}

}
