HypergeometricDistribution : [Object, Equal, ProbabilityDistribution] {

	| n s t |

	[maximum, max] { :self |
		min(self.s, self.n)
	}

	[minimum, min] { :self |
		self.n + self.s - self.t
	}

	pdf { :self |
		let n = self.n;
		let s = self.s;
		let t = self.t;
		{ :x |
			(x > n).if {
				0L
			} {
				binomial(s, x)
				* binomial(t - s, n - x)
				/ binomial(t, n)
			}
		}
	}

	randomVariate { :self :rng :shape |
		{
			let n = self.n;
			let s = self.s;
			let t = self.t;
			let x = 0L;
			{
				let p = s / t;
				let u = rng.nextRandomFloat;
				(u < p).ifTrue {
					x := x + 1L;
					s := s - 1L
				};
				p := p - 1L;
				n := n - 1L
			}.doWhileTrue {
				n > 0L
			};
			x
		} ! shape
	}

}

+[Integer, Symbol] {

	HypergeometricDistribution { :n :s :t |
		newHypergeometricDistribution().initializeSlots(n, s, t)
	}

}
