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
		let e = { :k | k.to(n).sum { :j | binomial(n, j) } };
		let a = 1 / (1 - (2 ^ (1 - s)));
		let b = 1.to(n).sum { :k | (-1 ^ (k - 1)) / (k ^ s) };
		let c = 1 / (2 ^ n);
		let d = (n + 1).to(2 * n).sum { :k | ((-1 ^ (k - 1)) * e(k - n)) / (k ^ s) };
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

	ellipticKFukushima { :m |
		/* https://observablehq.com/@dan-reznik/jacobi-elliptic-functions */
		<primitive:
		const m = _m;
		const D1 = 1.0 / 16.0, D2 = 1.0 / 32.0, D3 = 21.0 / 1024.0;
		const D4 = 31.0 / 2048.0, D5 = 6257.0 / 524288.0, D6 = 10293.0 / 1048576.0;
		const PIINV = 0.318309886;
		const mc = 1.0 - m;
		if (mc < 1.05e-8) {
			return 1.38629436 - 0.5 * Math.log(mc);
		}
		if (mc < 0.1) {
			const nome = mc * (D1 + mc * (D2 + mc * (D3 + mc * (D4 + mc * (D5 + mc * D6)))))
			const mx = mc - 0.05;
			const kkc = 1.59100345 + mx * (0.41600074 + mx * (0.24579151 + mx * (0.17948148 + mx * 0.14455606)));
			return -kkc * PIINV * Math.log(nome);
		}
		if (m <= 0.1) {
			const mx = m - 0.05;
			return 1.59100345 + mx * (0.41600074 + mx * (0.24579151 + mx * (0.17948148 + mx * 0.14455606)));
		}
		if (m <= 0.2) {
			const mx = m - 0.15;
			return 1.63525673 + mx * (0.47119063 + mx * (0.30972841 + mx * (0.25220831 + mx * 0.22672562)));
		}
		if (m <= 0.3) {
			const mx = m - 0.25;
			return 1.68575035 + mx * (0.54173185 + mx * (0.40152444 + mx * (0.36964247 + mx * 0.37606072)));
		}
		if (m <= 0.4) {
			const mx = m - 0.35;
			return 1.74435060 + mx * (0.63486428 + mx * (0.53984256 + mx * (0.57189271 + mx * (0.67029514 + mx * 0.83258659))));
		}
		if (m <= 0.5) {
			const mx = m - 0.45;
			return 1.81388394 + mx * (0.76316325 + mx * (0.76192861 + mx * (0.95107465 + mx * (1.31518067 + mx * 1.92856069))));
		}
		if (m <= 0.6) {
			const mx = m - 0.55;
			return 1.89892491 + mx * (0.95052179 + mx * (1.15107759 + mx * (1.75023911 + mx * (2.95267681 + mx * 5.28580040))));
		}
		if (m <= 0.7) {
			const mx = m - 0.65;
			return 2.00759840 + mx * (1.24845723 + mx * (1.92623466 + mx * (3.75128964 + mx * (8.11994455 + mx * (18.6657213 + mx * 44.6039248)))));
		}
		if (m <= 0.8) {
			const mx = m - 0.75;
			return 2.15651565 + mx * (1.79180564 + mx * (3.82675129 + mx * (10.3867247 + mx * (31.4033141 + mx * (100.923704 + mx * (337.326828 + mx * 1158.70793))))));
		}
		if (m <= 0.85) {
			const mx = m - 0.825;
			return 2.31812262 + mx * (2.61692015 + mx * (7.89793508 + mx * (30.5023972 + mx * (131.486937 + mx * (602.984764 + mx * 2877.02462)))));
		}
		const mx = m - 0.875;
		return 2.47359617 + mx * (3.72762424 + mx * (15.6073930 + mx * (84.1285084 + mx * (506.981820 + mx * (3252.27706 + mx * (21713.2424 + mx * 149037.045))))));
		>
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

	jacobianEllipticFunctions { :u :m |
		/* https://observablehq.com/@dan-reznik/jacobi-elliptic-functions */
		<primitive:
		const u = _u;
		const m = _m;
		const mc = 1.0 - m, uA = 1.76269 + mc * 1.16357, uT = 9.207e-4 - m * 4.604e-4;
		let u0 = u;
		let broke = false;
		let n;
		for (n = 0; n <= 20; n++) {
			if (u0 < uT) {
				broke = true;
				break;
			}
			u0 = u0 * 0.5;
		}
		if (!broke) {
			console.log("jacobianEllipticFunctions: too large input argument: u=", u)
		};
		const v = u0 * u0;
		let a = 1.0, b = v * 0.5, y, z, my, goto2 = false, j;
		if (u < uA) {
			for (j = 1; j <= n; j++) {
				y = b * (a * 2.0 - b);
				z = a * a;
				my = m * y;
				b = (y * 2.0) * (z - my);
				a = z * z - my * y;
			}
		} else {
			for (j = 1; j <= n; j++) {
				y = b * (a * 2.0 - b);
				z = a * a;
				my = m * y;
				if (z < my * 2.0) {
					goto2 = true;
					break;
				}
				b = (y * 2.0) * (z - my);
				a = z * z - my * y
			}
		}
		if (!goto2) {
			b = b / a; y = b * (2.0 - b);
			return { u: u, m: m, sn: Math.sqrt(y), cn: 1.0 - b, dn: Math.sqrt(1.0 - m * y) };
		}
		let c = a - b, mc2 = mc * 2.0, m2 = m * 2.0;
		for (let i = j; i <= n; i++) {
			let x = c * c;
			z = a * a;
			let w = m * x * x - mc * z * z;
			let xz = x * z;
			c = mc2 * xz + w;
			a = m2 * xz - w;
		}
		c = c / a;
		let x = c * c;
		return { u: u, m: m, sn: Math.sqrt(1.0 - x), cn: c, dn: Math.sqrt(mc + m * x) };
		>
	}

	jacobiCn { :u :m |
		let r = jacobianEllipticFunctions(u, m);
		let cn = r['cn'];
		cn
	}

	jacobiDn { :u :m |
		let r = jacobianEllipticFunctions(u, m);
		let dn = r['dn'];
		dn
	}

	jacobiSn { :u :m |
		let modulo = { :v :d | (v > 0).if { v % d } { d - (-v % d) } };
		let r = jacobianEllipticFunctions(u, m);
		let sn = r['sn'];
		let k = m.ellipticKFukushima;
		(modulo(u / k, 4) >= 2).if {
			sn * -1
		} {
			sn
		}
	}

}

+Fraction {

	fabiusFunction { :x :n |
		let dyadicRationals = { :x :n |
			let m = 2 ^ n;
			0.to(x * m).collect { :k |
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
