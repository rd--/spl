DirichletDistribution : [Object] {

	| alpha |

	betaDistributions { :self |
		let alpha = self.alpha;
		let k = alpha.size - 1L;
		let r = List(k, alpha.last);
		(k - 1L).downToDo(1L) { :i |
			r[i] := r[i + 1L] + alpha[i + 1L]
		};
		1L.to(k).collect { :i |
			BetaDistribution(alpha[i], r[i])
		}
	}

	pdf { :self |
		let alpha = self.alpha;
		let k = alpha.size;
		let b = alpha.gamma.product / alpha.sum.gamma;
		{ :x |
			(x.sum > 1.0).if {
				0.0
			} {
				1L.to(k - 1L).collect { :i |
					x[i] ^ (alpha[i] - 1.0)
				}.product * ((1.0 - x.sum) ^ (alpha[k] - 1.0)) / b
			}
		}
	}

	randomVariate { :self :r :shape |
		let b = self.betaDistributions;
		let k = b.size;
		{
			let s = List(k, 0);
			let z = 1.0;
			1L.toDo(k) { :i |
				let x = b[i].randomVariate(r, []);
				s[i] := z * x;
				z := z * (1.0 - x)
			};
			s[k] := z;
			s
		} ! shape
	}

}

+List {

	DirichletDistribution { :self |
		newDirichletDistribution().initializeSlots(self)
	}

}
