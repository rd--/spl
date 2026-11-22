ChordDiagram : [Object, Store] {

	| lengthVector | <List>

	[Graph, chordDiagramToGraph] { :self |
		Graph(
			self.vertexList,
			self.edgeList
		)
	}

	chordDiagramPlot { :self |
		self.Graph.circularGraphPlot(
			(
				drawCircle: true
			)
		)
	}

	edgeList { :self |
		let m = self.size * 2L;
		let l = self.lengthVector;
		0L.to(m - 1L).collect { :i |
			let j = (i + l[i + 1L]) % m;
			[i, j].sort + 1L
		}.nub(=).sort!
	}

	size { :self |
		self.lengthVector.size // 2L
	}

	vertexList { :self |
		[1L .. self.size * 2L]
	}

}

+List {

	ChordDiagram { :self |
		self.isVector.if {
			self.lengthVectorToChordDiagram
		} {
			self.edgeListToChordDiagram
		}
	}

	chordDiagramPlot { :self |
		ChordDiagram(self).chordDiagramPlot
	}

	edgeListToChordDiagram { :self |
		let [m, _] = self.shape;
		let v = List(m * 2L, 0L);
		1L.toDo(m) { :each |
			let [i, j] = self[each];
			v[i] := j - i;
			v[j] := (m * 2L) - (j - i)
		};
		lengthVectorToChordDiagram(v)
	}

	lengthVectorToChordDiagram { :self |
		uncheckedChordDiagram(self)
	}

}

+[Float, Integer] {

	chordDiagramCount { :n |
		(n = 0L).if {
			1L
		} {
			let alpha = { :p :q |
				q.isEven.if {
					0L.to(p // 2).sum { :k |
						binomial(p, 2L * k)
						*
						(q ^ k)
						*
						((2L * k) - 1L).doubleFactorial
					}
				} {
					(q ^ (p // 2L))
					*
					(p - 1L).doubleFactorial
				}
			};
			(2L * n).divisors.sum { :p |
				let q = (2L * n) // p;
				alpha(p, q) * eulerPhi(q)
			} // (2L * n)
		}
	}

	chordDiagrams { :n |
		let answer = [];
		n.chordDiagramsDo { :each |
			answer.add!(each)
		};
		answer
	}

	chordDiagramsDo { :n :f/1 |
		let m = 2L * n;
		let l = List(m + 1L, 0L);
		let a = ListView(l, 1L, m + 1L, 0L);
		let simpleChords = { :t :p |
			(t > m).if {
				(m % p = 0L).ifTrue {
					f(ChordDiagram(l.allButFirst))
				}
			} {
				(
					a[t] = 0L & {
						(t + a[t - p]) <= m
					}
				).if {
					a[t - p].toDo(m - t) { :j |
						(a[t + j] = 0L).ifTrue {
							a[t] := j;
							a[t + j] := m - j;
							(a[t] = a[t - p]).if {
								simpleChords(t + 1L, p)
							} {
								simpleChords(t + 1L, t)
							};
							a[t + j] := 0L
						}
					};
					a[t] := 0L
				} {
					(a[t] = a[t - p]).if {
						simpleChords(t + 1L, p)
					} {
						(a[t] > a[t - p]).ifTrue {
							simpleChords(t + 1L, t)
						}
					}
				}
			}
		};
		a[1L] := 0L;
		simpleChords(1L, 1L)
	}

}
