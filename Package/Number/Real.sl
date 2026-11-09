/* Requires: Fraction, Float */

+[Fraction, Float] {

	minkowskiQuestionMarkInverse { :x |
		let y = (x / 1).floor;
		let bits = x % 1;
		let lo = [0 1];
		let hi = [1 1];
		let iterationCount = 0;
		{
			iterationCount < 152 & {
				(y + (lo[1] / lo[2])) < (y + (hi[1] / hi[2]))
			}
		}.whileTrue {
			let bit = (2 * bits / 1).floor;
			bits := 2 * bits % 1;
			(bit > 0).if {
				lo := lo + hi
			} {
				hi := hi + lo
			};
			iterationCount := iterationCount + 1
		};
		y + (lo[1] / lo[2])
	}

	muLawDecode { :y |
		let mu = 255;
		let a = ((1 + mu) ^ y.abs) - 1;
		y.sign * (a / mu)
	}

	muLawEncode { :x |
		let mu = 255;
		let a = (1 + (mu * x.abs)).log;
		x.sign * (a / (1 + mu).log)
	}

	numberExpand { :self :base |
		let i = self.abs.truncate;
		let f = self.abs.fractionalPart;
		let d = i.integerDigits(base);
		let k = d.size;
		let m = k.toBy(1, -1).collect { :each |
			base ^ (each - 1)
		};
		let l = (d * m);
		(f = 0).ifFalse {
			l[k] := l[k] + f
		};
		l * self.sign
	}

}
