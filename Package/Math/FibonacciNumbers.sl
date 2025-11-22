+SmallFloat {

	binetsFormula { :n |
		let z = 5.sqrt;
		((1 + z) ^ n) - ((1 - z) ^ n) / ((2 ^ n) * z)
	}

	fibonacci { :n :x |
		let a = (4 + x.square).sqrt;
		let b = x + a;
		let c = 2 ^ (0 - n);
		let d = 2 ^ n;
		let e = b ^ n;
		let f = b ^ (0 - n);
		let g = n.pi.cos;
		let r = ((c * e) - (d * f * g)) / a;
		(n.isInteger & { x.isInteger }).if {
			r.round
		} {
			r
		}
	}

	fibonacci { :n |
		let phi = 1.goldenRatio;
		let r = ((phi ^ n) - (n.pi.cos * (phi ^ n.-))) / 5.sqrt;
		n.isInteger.if {
			r.round
		} {
			r
		}
	}

	fibonacciInteger { :n |
		system
		.cachedFibonacciSequenceExtendedTo(n)
		.at(n)
	}

	fibonacciPolynomial { :n |
		(n = 0 | { n = 1 }).if {
			UnivariatePolynomial([n])
		} {
			let x = UnivariatePolynomial([0 1]);
			let a = fibonacciPolynomial(n - 1);
			let b = fibonacciPolynomial(n - 2);
			(x * a) + b
		}
	}

	fibonacciSequence { :n |
		n.lucasSequence('U', 1, -1)
	}

	fibonacciSequenceUpTo { :self |
		let answer = [1];
		let n = 1;
		let k = 1;
		{
			n <= self
		}.whileTrue {
			answer.add(n);
			n := n + answer[k];
			k := k + 1
		};
		answer
	}

	lucasSequence { :n :p :q :a :b |
		let answer = [];
		let i = 0;
		{ i < n }.whileTrue {
			let c = b;
			answer.add(b);
			b := (p * b) - (q * a);
			a := c;
			i := i + 1
		};
		answer
	}

	lucasSequence { :n :k :p :q |
		k.caseOf(
			[
				'U' -> { lucasSequence(n, p, q, 0, 1) },
				'V' -> { lucasSequence(n, p, q, 2, p) }
			]
		)
	}

	lucasInteger { :self |
		(self = 1).if {
			1
		} {
			let phi = 1.goldenRatio;
			(phi ^ self).round
		}
	}

	lucasNumber { :self |
		let phi = 1.goldenRatio;
		(phi ^ self) + (self.pi.cos * (phi ^ self.negate))
	}

	lucasNumbers { :self |
		[1 1].linearRecurrence([1 3], self)
	}

	pellNumber { :self |
		let n = self;
		let x = 2.sqrt;
		((((1 + x) ^ n) - ((1 - x) ^ n)) / (2 * x)).real
	}

	pellNumbers { :self |
		[2 1].linearRecurrence([0 1], self)
	}

	pellLucasNumbers { :self |
		[2 1].linearRecurrence([2 2], self)
	}

	pisanoPeriod { :n |
		(n <= 1).if {
			1
		} {
			let a = [1 0];
			let a0 = a;
			let k = 0;
			{
				let s = a.sum % n;
				a := a.rotateLeft;
				a[2] := s;
				k := k + 1
			}.doWhileTrue {
				a != a0
			};
			k
		}
	}

}

+System {

	cachedFibonacciSequence { :self |
		self.cached('fibonacciSequence') {
			200.fibonacciSequence
		}
	}

	cachedFibonacciSequenceExtendedTo { :self :anInteger |
		let answer = self.cachedFibonacciSequence;
		(anInteger > answer.size).ifTrue {
			answer := anInteger.fibonacciSequence;
			self.cache.atPut('fibonacciSequence', answer)
		};
		answer
	}

}

