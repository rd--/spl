+@Integer {

	sobolSequence { :n :d |
		let l = n.bitLength;
		let v = List(l, nil);
		let x = List(n, 0L);
		d.isOne.if {
			1L.toDo(l) { :i |
				v[i] := 1L << (32L - i)
			}
		} {
			let [_, s, a, m] = d.sobolSequenceData;
			m := Integer(m);
			(l <= s).if {
				1L.toDo(l) { :i |
					v[i] := m[i] << (32L - i)
				}
			} {
				1L.toCollect(s) { :i |
					v[i] := m[i] << (32L - i)
				};
				(s + 1L).toDo(l) { :i |
					v[i] := v[i - s].bitXor(v[i - s] >> s);
					1L.toDo(2L - 1L) { :k | /* 2 - 1 */
						v[i] := v[i].bitXor(
							(a >> (s - 1L - k)).bitAnd(1L) * v[i - k]
						)
					};
					v
				}
			}
		};
		2L.toDo(n) { :i |
			let j = (i - 1L).rulerFunction;
			x[i] := x[i - 1L].bitXor(v[j])
		};
		(x / (2L ^ 32L))
	}

	sobolSequenceData { :d |
		system.sobolSequenceData.at(d - 1L)
	}

}

+List {

	sobolSequence { :shape |
		let [m, n] = shape;
		1L.toCollect(n) { :d |
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
	parser: identity/1
)
