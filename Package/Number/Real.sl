/* Requires: Fraction, Float */

+[Fraction, Float] {

	minkowskiQuestionMarkInverse { :x |
		let y = (x / 1.0).floorFloat;
		let bits = x % 1.0;
		let lo = [0.0, 1.0];
		let hi = [1.0, 1.0];
		let iterationCount = 0L;
		{
			iterationCount < 152L & {
				(y + (lo[1] / lo[2])) < (y + (hi[1] / hi[2]))
			}
		}.whileTrue {
			let bit = (2.0 * bits / 1.0).floorFloat;
			bits := 2.0 * bits % 1.0;
			(bit > 0.0).if {
				lo := lo + hi
			} {
				hi := hi + lo
			};
			iterationCount := iterationCount + 1L
		};
		y + (lo[1] / lo[2])
	}

	muLawDecode { :y |
		let mu = 255.0;
		let a = ((1.0 + mu) ^ y.abs) - 1.0;
		y.sign * (a / mu)
	}

	muLawEncode { :x |
		let mu = 255.0;
		let a = (1.0 + (mu * x.abs)).log;
		x.sign * (a / (1.0 + mu).log)
	}

}

+[Fraction, Float, Integer] {

	numberExpand { :self :base |
		let i = self.abs.truncate;
		let f = self.abs.fractionalPart;
		let d = i.integerDigits(base);
		let k = d.size;
		let m = k.toBy(1L, -1L).collect { :each |
			base ^ (each - 1L)
		};
		let l = (d * m);
		(f = 0L).ifFalse {
			l[k] := l[k] + f
		};
		l * self.sign
	}

}
