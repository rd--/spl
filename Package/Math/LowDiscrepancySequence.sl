+SmallFloat {

	sobolSequenceData { :d |
		system.sobolSequenceData.at(d - 1)
	}

	sobolSequence { :n :d |
		let l = n.bitLength;
		let v = List(l);
		let x = List(n, 0);
		(d = 1).if {
			1.toDo(l) { :i |
				v[i] := 1L << (32 - i)
			}
		} {
			let [_, s, a, m] = d.sobolSequenceData;
			(l <= s).if {
				1.toDo(l) { :i |
					v[i] := m[i] << (32L - i)
				}
			} {
				1:s.collect { :i |
					v[i] := m[i] << (32L - i)
				};
				(s + 1).toDo(l) { :i |
					v[i] := v[i - s].bitXor(v[i - s] >> s);
					1.toDo(2 - 1) { :k |
						v[i] := v[i].bitXor((a >> (s - 1 - k)).bitAnd(1) * v[i - k])
					};
					v
				}
			}
		};
		2.toDo(n) { :i |
			let j = (i - 1).rulerFunction;
			x[i] := x[i - 1].bitXor(v[j])
		};
		(x / (2 ^ 32))
	}

}

+List {

	sobolSequence { :shape |
		let [m, n] = shape;
		1:n.collect { :d |
			sobolSequence(m, d)
		}.transpose
	}

}

+System {

	sobolSequenceData { :self |
		self.requireLibraryItem('SobolSequenceData')
	}

}

LibraryItem(
	name: 'SobolSequenceData',
	category: 'Sequence/LowDiscrepancy',
	url: 'https://rohandrape.net/sw/hsc3-data/data/sobol/kuo.json',
	mimeType: 'application/json',
	parser: identity:/1
)
