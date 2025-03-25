ContinuousMarkovProcess : [Object] { | p0 q |

	initialProbabilities { :self |
		self.p0
	}

	holdingTimeMean { :self |
		1 / self.transitionRateVector
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
