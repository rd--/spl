HypergeometricDistribution : [Object, Equatable, ProbabilityDistribution] { | n s t |

	max { :self |
		min(self.s, self.n)
	}

	min { :self |
		self.n + self.s - self.t
	}

	pdf { :self |
		let n = self.n;
		let s = self.s;
		let t = self.t;
		{ :x |
			(x > n).if {
				0
			} {
				s.binomial(x)
				* (t - s).binomial(n - x)
				/ t.binomial(n)
			}
		}
	}

	randomVariate { :self :rng :shape |
		{
			let n = self.n;
			let s = self.s;
			let t = self.t;
			let x = 0;
			{
				let p = s / t;
				let u = rng.nextRandomFloat;
				(u < p).ifTrue {
					x := x + 1;
					s := s - 1
				};
				p := p - 1;
				n := n - 1
			}.doWhileTrue {
				n > 0
			};
			x
		} ! shape
	}

}

+[SmallFloat, Symbol] {

	HypergeometricDistribution { :n :s :t |
		newHypergeometricDistribution().initializeSlots(n, s, t)
	}

}
