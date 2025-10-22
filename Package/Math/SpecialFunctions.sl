+SmallFloat {

	erfAbramowitzStegun { :x |
		(x >= 0).if {
			let p = 0.47047;
			let t = 1 / (1 + (p * x));
			let a1 = 0.3480242 * t;
			let a2 = -0.0958798 * t * t;
			let a3 = 0.7478556 * t * t * t;
			1 - ((a1 + a2 + a3) * x.square.negate.exp)
		} {
			x.negate.erf.negate
		}
	}

	erf { :x |
		(x >= 0).if {
			let p = 0.3275911;
			let t = 1 / (1 + (p * x));
			let a1 = 0.254829592 * t;
			let a2 = -0.284496736 * t * t;
			let a3 = 1.421413741 * t * t * t;
			let a4 = -1.453152027 * t * t * t * t;
			let a5 = 1.061405429 * t * t * t * t * t;
			1 - ((a1 + a2 + a3 + a4 + a5) * x.square.negate.exp)
		} {
			x.negate.erf.negate
		}
	}

	erfc { :x |
		1 - x.erf
	}

	fresnel { :x :k :n |
		<primitive:
		let x = _x;
		let n = _n;
		let f = (_k === 'C') ? Math.cos : Math.sin;
		const pi = Math.PI;
		const dx = x / n;
		let sum = 0;
		for (let i = 0; i < n; i++) {
			const t = i * dx;
			const u = (i + 1) * dx;
			sum += (f(pi * (t ** 2) / 2) + f(pi * (u ** 2) / 2)) / 2 * dx;
		}
		return sum;
		>
	}

	fresnelC { :z |
		fresnel(z, 'C', 2000)
	}

	fresnelS { :z |
		fresnel(z, 'S', 2000)
	}

	lambertW { :x |
		let z = -1.exp.-;
		(x < z).if {
			x.error('lambertW: undefined')
		} {
			let k = max(4, ceiling(log10(x) / 3));
			let w = 3 * log(x + 1) / 4;
			k.timesRepeat {
				let e = exp(w);
				w := w - (((w * e) - x) / ((e * (w + 1)) - (((w + 2) * ((w * e) - x)) / ((2 * w) + 2))))
			};
			w
		}
	}

}

+@Number {

	riemannXi { :z |
		z.isZero.if {
			0.5
		} {
			(z.isSmallFloat & { z < 0 }).if {
				riemannXi(1 - z)
			} {
				/* ((z - 1) * gamma((0.5 * z) + 1) * zeta(z)) / sqrt(1.pi ^ z) */
				0.5 * z * (z - 1) * (1.pi ^ ((0 - z) * 0.5)) * zeta(z) * gamma(0.5 * z)
			}
		}
	}

	zeta { :s |
		/* http://numbers.computation.free.fr/Constants/Miscellaneous/zetaevaluations.pdf */
		let p = 8;
		let n = ((1.3 * p) + (0.9 * s.imaginary.abs)).round;
		let e = { :k | (k .. n).sum { :j | binomial(n, j) } };
		let a = 1 / (1 - (2 ^ (1 - s)));
		let b = (1 .. n).sum { :k | (-1 ^ (k - 1)) / (k ^ s) };
		let c = 1 / (2 ^ n);
		let d = (n + 1 .. 2 * n).sum { :k | ((-1 ^ (k - 1)) * e(k - n)) / (k ^ s) };
		a * (b + (c * d))
	}
}


+[SmallFloat, Complex] {

	hypergeometric2F1 { :a :b :c :z |
		let tolerance = 1E-10;
		let iterationLimit = 1000;
		let term = a * b * z / c;
		let value = 1 + term;
		let n = 1;
		{
			term.abs > tolerance & {
				n < iterationLimit
			}
		}.whileTrue {
			a := a + 1;
			b := b + 1;
			c := c + 1;
			n := n + 1;
			term := term * (a * b * z / c / n);
			value := value + term
		};
		value
	}

}

+[SmallFloat, Fraction] {

	ellipticE { :m |
		/* https://github.com/duetosymmetry/elliptic-integrals-js */
		(m >= 1).if {
			(m = 1).if {
				1
			} {
				m.error('ellipticE: invalid m')
			}
		} {
			let i = 0;
			let limit = 50;
			let kPrime = (1 - m).sqrt;
			let a0 = m.one;
			let g0 = kPrime;
			let aN = a0;
			let gN = g0;
			let t = 0.25;
			let partialSum = 1 - (0.5 * m);
			{ aN.isVeryCloseTo(gN).not & { i < limit } }.whileTrue {
				let d = aN - gN;
				partialSum := partialSum - (t * d * d);
				t := t * 2;
				a0 := 0.5 * (aN + gN);
				g0 := (aN * gN).sqrt;
				aN := a0;
				gN := g0;
				i := i + 1
			};
			(i = limit).ifTrue {
				m.warning('ellipticE: did not converge')
			};
			0.5.pi * partialSum / aN
		}
	}

	ellipticK { :m |
		1.pi / (2 * arithmeticGeometricMean(1, (1 - m).sqrt))
	}

	ellipticPi { :n :m |
		/* https://github.com/duetosymmetry/elliptic-integrals-js */
		let i = 0;
		let limit = 50;
		let kPrime = sqrt(1 - m);
		let a0 = 1;
		let g0 = kPrime;
		let zeta0 = 0;
		let aN = a0;
		let gN = g0;
		let deltaN = (1 - n) / kPrime;
		let epsilon = n / (1 - n);
		let zetaN = zeta0;
		{ aN.isVeryCloseTo(gN).not | { deltaN.isVeryCloseTo(1).not } & { i < limit } }.whileTrue {
			zeta0 := 0.5 * (epsilon + zetaN);
			epsilon := (deltaN * epsilon + zetaN) / (1 + deltaN);
			zetaN := zeta0;
			a0 := 0.5 * (aN + gN);
			g0 := sqrt(aN *gN);
			aN := a0;
			gN := g0;
			deltaN := 0.25 * gN / aN * (2 + deltaN + (1 / deltaN));
			i := i + 1
		};
		(i = limit).ifTrue {
			[n, m].warning("ellipticPi: did not converge")
		};
		0.5.pi / aN * (1 + zetaN)
	}

}

+Fraction {

	fabiusFunction { :x :n |
		let dyadicRationals = { :x :n |
			let m = 2 ^ n;
			[0 .. x * m].collect { :k |
				k \ m
			}
		};
		(2 ^ (n * (n + 1) / 2))
		/
		n.factorial
		*
		dyadicRationals(x, n).sum { :k |
			(-1 ^ digitSum((k * (2 ^ n)).asLargeInteger, 2)) * ((x - k) ^ n)
		}
	}

}

+SmallFloat {

	fabiusFunction { :x :n |
		x.asFraction.fabiusFunction(n)
	}

}
