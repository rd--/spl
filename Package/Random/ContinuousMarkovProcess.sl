ContinuousMarkovProcess : [Object] { | p0 q |

	asStream { :self :r :t0 |
		let p0 = AliasMethod(self.p0);
		let m = self.transitionMatrix.collect(AliasMethod:/1);
		let h = self.transitionRateVector;
		let t = t0;
		let x = p0.nextRandom(r);
		BlockStream {
			let z = [t, x];
			x := m[x].nextRandom(r);
			t := t + r.exponentialDistribution(h[x]);
			z
		} {
			t := t0;
			x := p0.nextRandom(r)
		}
	}

	initialProbabilities { :self |
		self.p0
	}

	holdingTimeMean { :self |
		1 / self.transitionRateVector
	}

	randomFunction { :self :r :t :n |
		let [tMin, tMax] = t;
		self.asStream(r, tMin).timeSeriesRandomFunction(t, n)
	}

	transitionMatrix { :self |
		let q = self.q;
		let [m, n] = q.shape;
		let t = zeroMatrix(m, n);
		1:m.do { :i |
			let h = q[i][i].abs;
			let r = (h = 0).if { 0 } { 1 / h };
			1:n.do { :j |
				(i ~= j).ifTrue {
					t[i][j] := q[i][j] * r
				}
			};
			t[i][i] := (1 - t[i].sum).abs
		};
		t
	}

	transitionRateVector { :self |
		self.q.diagonal.abs
	}

}

+List {

	ContinuousMarkovProcess { :p0 :q |
		newContinuousMarkovProcess().initializeSlots(p0, q)
	}

}
