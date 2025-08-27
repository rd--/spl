+SmallFloat{

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
