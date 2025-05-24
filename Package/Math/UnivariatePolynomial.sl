UnivariatePolynomial : [Object] { | coefficientList |

	+ { :self :anObject |
		let c1 = self.coefficientList;
		let c2 = anObject.coefficientList;
		let n = c1.size.max(c2.size);
		UnivariatePolynomial(
			c1.padRight([n], 0) + c2.padRight([n], 0)
		)
	}

	at { :self :x |
		self.coefficientList.evaluateUnivariatePolynomial(x)
	}

	atAll { :self :aCollection |
		aCollection.collect { :each |
			self.at(each)
		}
	}

	degree { :self |
		self.coefficientList.size - 1
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	evaluateUnivariatePolynomial { :coefficientList :x |
		let n = coefficientList.size;
		(n = 0).if {
			0
		} {
			let answer = coefficientList[n];
			(n - 1).downToDo(1) { :i |
				answer := x * answer + coefficientList[i]
			};
			answer
		}
	}

	UnivariatePolynomial { :self |
		newUnivariatePolynomial().initializeSlots(self)
	}

}

+SmallFloat {

	cardanosAlgorithm { :a :b :c :d |
		<primitive:
		/* https://www.mosismath.com/Cardano/Cardano.html */
		function xroot(a, x) {
			const i = (a < 0) ? -1 : 1;
			return (i * Math.exp(Math.log(a * i) / x));
		}
		function splComplex(r, i) {
			return _Complex_2(r, i);
		}
		if (_a === 0) {
			throw new Error("cardanosAlgorithm: a=0");
		}
		const a = _b / _a;
		const b = _c / _a;
		const c = _d / _a;
		const p = -(a * a / 3) + b;
		const q = (2 / 27 * a * a * a) - (a * b / 3) + c;
		const pi = Math.PI;
		let d = q * q / 4 + p * p * p / 27;
		if (Math.abs(d) < Math.pow(10, -11)) {
			d = 0;
		}
		if (d > 1e-20) {
			const u = xroot(-q / 2 + Math.sqrt(d), 3);
			const v = xroot(-q / 2 - Math.sqrt(d), 3);
			const x1 = u + v - a / 3;
			const x2r = -(u + v) / 2 - a / 3;
			const x2i = Math.sqrt(3) / 2 * (u - v);
			const x3r = x2r;
			const x3i = -x2i;
			return [x1, splComplex(x2r, x2i), splComplex(x3r, x3i)];
		}
		if (Math.abs(d) <= 1e-20) {
			const u = xroot(-q / 2, 3);
			const v = xroot(-q / 2, 3);
			const x1 = u + v - a / 3;
			const x2 = -(u + v) / 2 - a / 3;
			return [x1, x2];
		}
		if (d < -1e-20) {
			const r = Math.sqrt(-p * p * p / 27);
			let alpha = Math.atan(Math.sqrt(-d) / -q * 2);
			if (q > 0) {
				alpha = pi + alpha;
			}
			const x1 = xroot(r, 3) * (Math.cos((6 * pi - alpha) / 3) + Math.cos(alpha / 3)) - a / 3;
			const x2 = xroot(r, 3) * (Math.cos((2 * pi + alpha) / 3) + Math.cos((4 * pi - alpha) / 3)) - a / 3;
			const x3 = xroot(r, 3) * (Math.cos((4 * pi + alpha) / 3) + Math.cos((2 * pi - alpha) / 3)) - a / 3;
			return [x1, x2, x3];
		}
		>
	}

	chebyshevT { :self |
		let c = self.caseOf([
			0 -> { [1] },
			1 -> { [1 0] },
			2 -> { [2 0 -1] },
			3 -> { [4 0 -3 0] },
			4 -> { [8 0 -8 0 1] },
			5 -> { [16 0 -20 0 5 0] },
			6 -> { [32 0 -48 0 18 0 -1] },
			7 -> { [64 0 -112 0 56 0 -7 0] },
			8 -> { [128 0 -256 0 160 0 -32 0 1] },
			9 -> { [256 0 -576 0 432 0 -120 0 9 0] },
			10 -> { [512 0 -1280 0 1120 0 -400 0 50 0 -1] },
			11 -> { [1024 0 -2816 0 2816 0 -1232 0 220 0 -11 0] },
			12 -> { [2048 0 -6144 0 6912 0 -3584 0 840 0 -72 0 1] }
		]) {
			self.error('chebyshevT: not implemented')
		};
		UnivariatePolynomial(c.reverse)
	}

	chebyshevU { :self |
		let c = self.caseOf([
			0 -> { [1] },
			1 -> { [2 0] },
			2 -> { [4 0 -1] },
			3 -> { [8 0 -4 0] },
			4 -> { [16 0 -12 0 1] },
			5 -> { [32 0 -32 0 6 0] },
			6 -> { [64 0 -80 0 24 0 -1] },
			7 -> { [128 0 -192 0 80 0 -8 0] },
			8 -> { [256 0 -448 0 240 0 -40 0 1] },
			9 -> { [512 0 -1024 0 672 0 -160 0 10 0] },
			10 -> { [1024 0 -2304 0 1792 0 -560 0 60 0 -1] },
			11 -> { [2048 0 -5120 0 4608 0 -1792 0 280 0 -12 0] }
		]) {
			self.error('chebyshevU: not implemented')
		};
		UnivariatePolynomial(c.reverse)
	}
}
