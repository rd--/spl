DirichletDistribution : [Object] { | alpha |

	betaDistributions { :self |
		let alpha = self.alpha;
		let k = alpha.size - 1;
		let r = List(k, alpha.last);
		(k - 1).downToDo(1) { :i |
			r[i] := r[i + 1] + alpha[i + 1]
		};
		(1 .. k).collect { :i |
			BetaDistribution(alpha[i], r[i])
		}
	}

	randomVariate { :self :r :shape |
		let b = self.betaDistributions;
		let k = b.size;
		{
			let s = List(k, 0);
			let z = 1;
			1.toDo(k) { :i |
				let x = b[i].randomVariate(r, []);
				s[i] := z * x;
				z := z * (1 - x)
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
