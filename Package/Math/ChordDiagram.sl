ChordDiagram : [Object] { | lengthVector |

	asGraph { :self |
		Graph(
			self.vertexList,
			self.edgeList
		)
	}

	chordDiagramPlot { :self |
		self.asGraph.circularGraphPlot (
			drawCircle: true
		)
	}

	edgeList { :self |
		let m = self.size * 2;
		let l = self.lengthVector;
		0.to(m - 1).collect { :i |
			let j = (i + l[i + 1]) % m;
			[i, j].sort + 1
		}.nub.sort
	}

	size { :self |
		self.lengthVector.size / 2
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	vertexList { :self |
		[1 .. self.size * 2]
	}

}

+List {

	chordDiagramPlot { :self |
		ChordDiagram(self).chordDiagramPlot
	}

	edgeListToChordDiagram { :self |
		let [m, _] = self.shape;
		let v = List(m * 2, 0);
		1.toDo(m) { :each |
			let [i, j] = self[each];
			v[i] := j - i;
			v[j] := (m * 2) - (j - i)
		};
		lengthVectorToChordDiagram(v)
	}

	lengthVectorToChordDiagram { :self |
		newChordDiagram().initializeSlots(self)
	}

	ChordDiagram { :self |
		self.isVector.if {
			self.lengthVectorToChordDiagram
		} {
			self.edgeListToChordDiagram
		}
	}

}

+@Integer {

	chordDiagramCount { :n |
		(n = 0).if {
			1
		} {
			let alpha = { :p :q |
				q.isEven.if {
					0.to(p / 2).sum { :k |
						binomial(p, 2 * k)
						*
						(q ^ k)
						*
						((2 * k) - 1).doubleFactorial
					}
				} {
					(q ^ (p / 2))
					*
					(p - 1).doubleFactorial
				}
			};
			(2 * n).divisors.sum { :p |
				let q = (2 * n) / p;
				alpha(p, q) * eulerPhi(q)
			} / (2 * n)
		}
	}

	chordDiagramsDo { :n :f:/1 |
		let m = 2 * n;
		let l = List(m + 1, 0);
		let a = ListView(l, 1, m + 1, 0);
		let simpleChords = { :t :p |
			(t > m).if {
				(m % p = 0).ifTrue {
					f(ChordDiagram(l.allButFirst))
				}
			} {
				(a[t] = 0 & { (t + a[t - p]) <= m }).if {
					a[t - p].toDo(m - t) { :j |
						(a[t + j] = 0).ifTrue {
							a[t] := j;
							a[t + j] := m - j;
							(a[t] = a[t - p]).if {
								simpleChords(t + 1, p)
							} {
								simpleChords(t + 1, t)
							};
							a[t + j] := 0
						}
					};
					a[t] := 0
				} {
					(a[t] = a[t - p]).if {
						simpleChords(t + 1, p)
					} {
						(a[t] > a[t - p]).ifTrue {
							simpleChords(t + 1, t)
						}
					}
				}
			}
		};
		a[1] := 0;
		simpleChords(1, 1)
	}

	chordDiagrams { :n |
		let answer = [];
		n.chordDiagramsDo { :each |
			answer.add(each)
		};
		answer
	}

}
