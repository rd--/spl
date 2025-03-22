+@Number {

	beta { :self :aNumber |
		aNumber.isCollection.if {
			aNumber.collect { :each |
				self.beta(each)
			}
		} {
			self.logBeta(aNumber).exp
		}
	}

	gammaLanczosFormulaLeadingFactor { :self |
		let z = self + 5.5;
		z.log * (self + 0.5) - z
	}

	gammaLanczosFormulaSeries { :self |
		let term = self;
		let coefficients = [
			76.18009172947146,
			-86.50532032941677,
			24.01409824083091,
			-1.231739572450155,
			0.001208650973866179,
			-0.000005395239384953
		];
		coefficients.injectInto(1.000000000190015) { :sum :each |
			term := term + 1;
			each / term + sum
		}
	}

	gammaLanczosFormula { :self |
		let sqrtTwoPi = 2.pi.sqrt;
		let leadingFactor = self.gammaLanczosFormulaLeadingFactor;
		let series = self.gammaLanczosFormulaSeries;
		(leadingFactor.exp * series) * sqrtTwoPi / self
	}

	gamma { :self |
		(self.isInteger & {
			(self >= 1)
		}).if {
			(self - 1).factorial
		} {
			(self < 0).if {
				1.pi / (self.pi.sin * (1 - self).gamma)
			} {
				(self + 1).gammaLanczosFormula / self
			}
		}
	}

	incompleteGamma { :x :a |
		(a < 0).if {
			'incompleteGamma: a must be real and nonnegative'.error
		} {
			(x = 0 & { a = 0 }).if {
				[0, Infinity, 0]
			} {
				(x = 0).if {
					[0, a.gamma, 0]
				} {
					let xam = (x > 0).if {
						x.- + (a * x.log)
					} {
						'incompleteGamma: negative a'.error
					};
					(xam.abs > 700 | { a.abs > 170 } ).if {
						'incompleteGamma: x or a too large'.error
					} {
						let gin = 0;
						let gim = 0;
						let gip = 0;
						let ga = a.gamma;
						(x = 0).if {
							gim := ga
						} {
							(x <= (1 + a)).if {
								let s = 1 / a;
								let r = s;
								let k = 1;
								{
									r := r * x / (a + k);
									s := s + r;
									k := k + 1
								}.doWhileTrue {
									k <= 60 & {
										let epsilon = 1E-15;
										(r / s).abs > epsilon
									}
								};
								gin := xam.exp * s;
								gip := gin / ga;
								gim := ga - gin
							} {
								let t0 = 0;
								60.downToDo(1) { :k |
									t0 := (k - a) / (1 + (k / (x + t0)))
								};
								gim := xam.exp / (x + t0);
								gin := ga - gim;
								gip := 1 - (gim / ga)
							};
							[gin, gim, gip]
						}
					}
				}
			}
		}
	}

	logBeta { :self :aNumber |
		self.logGamma + aNumber.logGamma - (self + aNumber).logGamma
	}

	logGammaLanczosFormula { :self |
		let sqrtTwoPi = 2.pi.sqrt;
		let leadingFactor = self.gammaLanczosFormulaLeadingFactor;
		let series = self.gammaLanczosFormulaSeries;
		leadingFactor + (series * sqrtTwoPi / self).log
	}

	logGamma { :self |
		(self > 1).if {
			self.logGammaLanczosFormula
		} {
			(self > 0).if {
				(self + 1).logGammaLanczosFormula - self.log
			} {
				'@Number>>logGamma: non-positive'.error
			}
		}
	}

	lowerIncompleteGamma { :x :s |
		incompleteGamma(x, s).last
	}

	lowerIncompleteGamma { :x :s :regularize |
		(x = 0).if {
			0
		} {
			(x < 0 | { s <= 0 }).if {
				NaN
			} {
				(x > 1.1 & { x > s }).if {
					regularize.if {
						1 - upperIncompleteGamma(x, s, regularize)
					} {
						gamma(s) - upperIncompleteGamma(x, s, regularize)
					}
				} {
					let r = s;
					let c = 1;
					let pws = 1;
					let ft = regularize.if {
						(s * x.log) - x - logGamma(s)
					} {
						(s * x.log) - x
					};
					ft := ft.exp;
					{
						r := r + 1;
						c := c * (x / r);
						pws := pws + c
					}.doWhileTrue {
						let epsilon = 1E-12;
						(c / pws) > epsilon
					};
					pws * ft / s
				}
			}
		}
	}

	upperIncompleteGamma { :x :s |
		1 - incompleteGamma(x, s).last
	}

	upperIncompleteGamma { :x :s :regularize |
		(x <= 1.1 | { x <= s }).if {
			regularize.if {
				1 - lowerIncompleteGamma(x, s, regularize)
			} {
				gamma(s) - lowerIncompleteGamma(x, s, regularize)
			}
		} {
			let f = 1 + x - s;
			let c = f;
			let d = 0;
			let i = 1;
			let chg = nil;
			{
				let a = i * (s - i);
				let b = (i << 1) + 1 + x - s;
				d := b + (a * d);
				c := b + (a / c);
				d := 1 / d;
				chg := c * d;
				f := f * chg;
				i := i + 1
			}.doWhileTrue {
				i < 10000 & {
					let epsilon = 1E-12;
					(chg - 1) > epsilon
				}
			};
			regularize.if {
				((s * x.log) - x - logGamma(s) - f.log).exp
			} {
				((s * x.log) - x - f.log).exp
			}
		}
	}
}
