+SmallFloat {

	beta { :self :aNumber |
		aNumber.isCollection.if {
			aNumber.collect { :each |
				self.beta(each)
			}
		} {
			self.logBeta(aNumber).exp
		}
	}

	betaRegularized { :x :a :b |
		/* https://codeplea.com/incomplete-beta-function-c */
		let stop = 1E-8;
		let tiny = 1E-30;
		(x < 0 | { x > 1 }).if {
			Infinity
		} {
			(x > ((a + 1) / (a + b + 2))).if {
				1 - betaRegularized(1 - x, b, a)
			} {
				let lbetaAb = logGamma(a) + logGamma(b) - logGamma(a + b);
				let front = ((x.log * a) + ((1 - x).log * b) - lbetaAb).exp / a;
				let f = 1;
				let c = 1;
				let d = 0;
				let cd = c * d;
				let i = 0;
				let converged = false;
				{
					let m = i // 2;
					let numerator = (i = 0).if {
						1
					} {
						(i % 2 = 0).if {
							(m * (b - m) * x) / ((a + (2 * m) - 1) * (a + (2 * m)))
						} {
							((a + m) * (a + b + m) * x).- / ((a + (2 * m)) * (a + (2 * m) + 1))
						}
					};
					d := 1 + (numerator * d);
					(d.abs < tiny).ifTrue {
						d := tiny
					};
					d := 1 / d;
					c := 1 + (numerator / c);
					(c.abs < tiny).ifTrue {
						c := tiny
					};
					cd := c * d;
					f := f * cd;
					converged := (1 - cd).abs < stop;
					i := i + 1
				}.doWhileTrue {
					i <= 200 & {
						converged.not
					}
				};
				converged.if {
					front * (f - 1)
				} {
					Infinity
				}
			}
		}
	}

	digamma { :z |
		/* Jose Bernardo, Algorithm AS 103, Applied Statistics 25/3, 1976 */
		(z <= 0.000001).if {
			let eulerMascheroni = 0.57721566490153286060;
			0 - eulerMascheroni - (1 / z) + (1.6449340668482264365 * z)
		} {
			let answer = 0;
			let r = nil;
			{ z < 8.5 }.whileTrue {
				answer := answer - (1 / z);
				z := z + 1
			};
			r := 1 / z;
			answer := answer + z.log - (0.5 * r);
			r := r * r;
			answer - (r * (1 / 12 - (r * (1 / 120 - (r * (1 / 252 - (r * (1 / 240 - (r * (1 / 132))))))))))
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
		let leadingFactor = self.gammaLanczosFormulaLeadingFactor;
		let series = self.gammaLanczosFormulaSeries;
		(leadingFactor.exp * series) * 2.pi.sqrt / self
	}

	gamma { :self |
		(
			self.isInteger & {
				(self >= 1)
			}
		).if {
			(self - 1).factorial
		} {
			(self < 0).if {
				1.pi / (self.pi.sin * (1 - self).gamma)
			} {
				(self + 1).gammaLanczosFormula / self
			}
		}
	}

	gammaRegularized { :a :z |
		1 - incompleteGamma(z, a).last
	}

	gammaRegularized { :a :b :z |
		(b = 0).if {
			incompleteGamma(z, a).last
		} {
			'gammaRegularized: b non-zero'.error
		}
	}

	hadjicostassFormula { :s |
		gamma(s + 2) * (zeta(s + 2) - (1 / (s + 1)))
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

	lanczosApproximation { :self |
		let g = 7;
		let n = 9;
		let p = [
			0.99999999999980993,
			676.5203681218851,
			-1259.1392167224028,
			771.32342877765313,
			-176.61502916214059,
			12.507343278686905,
			-0.13857109526572012,
			9.9843695780195716E-6,
			1.5056327351493116E-7
		];
		let epsilon = 1E-07;
		let z = self.asComplex;
		(z.real < 0.5).if {
			(1.pi / (sin(1.pi * z) * gamma(1 - z))).chop(epsilon)
		} {
			let x = p[1];
			let t = nil;
			z := z - 1;
			2.toDo(p.size) { :i |
				x := x + (p[i] / (z + i - 1))
			};
			t := z + g + 0.5;
			(2.pi.sqrt * (t ^ (z + 0.5)) * exp(0 - t) * x).chop(epsilon)
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

+Complex {

	gamma { :z |
		(z.imaginary = 0).if {
			z.real.gamma
		} {
			(z.real < 0.5).if {
				1.pi / z.pi.sin / (1 - z).gamma
			} {
				let n = z - 1;
				let gammaG = 4.7421875;
				let gammaP = [
					0.99999999999999709182,
					57.156235665862923517,
					-59.597960355475491248,
					14.136097974741747174,
					-0.49191381609762019978,
					0.33994649984811888699E-4,
					0.46523628927048575665E-4,
					-0.98374475304879564677E-4,
					0.15808870322491248884E-3,
					-0.21026444172410488319E-3,
					0.21743961811521264320E-3,
					-0.16431810653676389022E-3,
					0.84418223983852743293E-4,
					-0.26190838401581408670E-4,
					0.36899182659531622704E-5
				];
				let t = n + gammaG + 0.5;
				let x = Complex(gammaP[1], 0);
				2.toDo(gammaP.size) { :i |
					x := x + (gammaP[i] / (n + (i - 1)))
				};
				2.pi.sqrt * (t ^ (n + 0.5)) * (0 - t).exp * x
			}
		}
	}

}

+[SmallFloat, Complex] {

	pochhammer { :a :n |
		(a.isInteger & { n.isInteger }).if {
			(a + (0 .. n - 1)).product
		} {
			let p = gamma(a + n);
			let q = gamma(a);
			p / q
		}
	}

}

+@Number {

	qPochhammer { :a :q :n |
		(0 .. n - 1).product { :k |
			(1 - (a * (q ^ k)))
		}
	}

}
