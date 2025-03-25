HiddenMarkovProcess : [Object] { | p0 m e |

	asStream { :self :r |
		let p0 = AliasMethod(self.p0);
		let m = self.m.collect(AliasMethod:/1);
		let e = self.e.collect(AliasMethod:/1);
		let x = p0.nextRandom(r);
		BlockStream {
			let answer = e[x].nextRandom(r);
			x := m[x].nextRandom(r);
			answer
		} {
			x := p0.nextRandom(r)
		}
	}

	randomFunction { :self :r :t :n |
		self.asStream(r).randomFunction(t, n)
	}

	viterbiDecoding { :self :aList |
		let p0 = self.p0;
		let m = self.m;
		let e = self.e;
		let o = aList;
		let t = o.size;
		let s = p0.size;
		let p = zeroMatrix(t, s);
		let z = zeroMatrix(t, s);
		let answer = List(t);
		1.toDo(s) { :i |
			p[1][i] := p0[i] * e[i][o[1]]
		};
		2.toDo(t) { :i |
			1.toDo(s) { :j |
				1.toDo(s) { :k |
					let x = p[i - 1][k] * m[k][j] * e[j][o[i]];
					(x > p[i][j]).ifTrue {
						p[i][j] := x;
						z[i][j] := k
					}
				}
			}
		};
		answer[t] := p[t].indexOf(p[t].max);
		(t - 1).downToDo(1) { :i |
			answer[i] := z[i + 1][answer[i + 1]]
		};
		answer
	}

}

+List {

	HiddenMarkovProcess { :p0 :m :e |
		newHiddenMarkovProcess().initializeSlots(p0, m, e)
	}

}
