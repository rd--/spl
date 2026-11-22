DyckWord : [Object, Store] {

	| word tokens | <List>

	binaryExpansion { :self |
		let [a, b] = self.tokens;
		self.word.collect { :each |
			(each = a).boole
		}
	}

	chordDiagram { :self |
		ChordDiagram(self.edgeList)
	}

	chordDiagramPlot { :self |
		self.edgeList.chordDiagramPlot
	}

	edgeList { :self |
		let [a, b] = self.tokens;
		let w = self.word;
		let n = w.size;
		let e = [];
		let h = self.heightList;
		1L.toDo(n) { :i |
			(w[i] = a).ifTrue {
				let j = h.indexOfStartingAtBy(h[i], i + 1L, isEqual/2) - 1L;
				e.add!([i, j])
			}
		};
		e
	}

	graph { :self |
		Graph(self.vertexList, self.edgeList)
	}

	graphPlot { :self |
		self.graph.graphPlot
	}

	heightList { :self |
		let [a, b] = self.tokens;
		let h = 0L;
		let answer = [h];
		self.word.do { :each |
			h := (each = a).if { h + 1L } { h - 1L };
			answer.add!(h)
		};
		answer
	}

	integer { :self |
		self.binaryExpansion.fromDigits(2L)
	}

	length { :self |
		self.word.size
	}

	linearGraphPlot { :self |
		self.graph.linearGraphPlot
	}

	lukasiewiczWord { :self |
		let w = [];
		self.tree.do { :t |
			w.add!(t.size)
		};
		w.allButLast
	}

	noncrossingSetPartition { :self |
		let n = self.length;
		let b = self.binaryExpansion;
		let i = 1L;
		let j = true;
		let u = [];
		let r = [[]];
		b.do { :x |
			(x = 1L).if {
				u.add!(i);
				i := i + 1L;
				j.ifFalse {
					r.add!([]);
					j := true
				}
			} {
				r.last.add!(u.removeLast!);
				j := false
			}
		};
		r
	}

	parenthesization { :self |
		self.binaryExpansion.collect { :each |
			(each = 1L).if { '(' } { ')' }
		}.stringJoin
	}

	parenthesizationList { :self |
		self.tree.List.deepCollect { :unused | [] }
	}

	partitionPlot { :self |
		self.setPartition.partitionPlot
	}

	restrictedGrowthString { :self |
		let n = self.length;
		let h = self.heightList;
		let b = self.binaryExpansion;
		let s = [];
		1L.toDo(n - 1L) { :i |
			(b[i] = 1L).ifTrue {
				s.add!(h[i] + 1L)
			}
		};
		s
	}

	setPartition { :self |
		self.restrictedGrowthString.setPartition
	}

	tree { :self |
		let w = self.binaryExpansion;
		let s = [Tree(nil, [])];
		w.do { :x |
			(x = 1L).if {
				let t = Tree(nil, []);
				s[1L].subTrees.addLast!(t);
				s.addFirst!(t)
			} {
				s.removeFirst!
			}
		};
		s[1L]
	}

	treePlot { :self |
		self.tree.treePlot
	}

	vertexList { :self |
		[1L .. self.word.size]
	}

}

+List {

	DyckWord { :word :tokens |
		word.isDyckWord(tokens).if {
			uncheckedDyckWord(word, tokens)
		} {
			word.error('DyckWord: invalid word')
		}
	}

	DyckWord { :self |
		let [b, a] = self.minMax;
		DyckWord(self, [a, b])
	}

	heightList { :self |
		DyckWord(self).heightList
	}

}

+List {

	isDyckWord { :self :tokens |
		let n = self.size;
		n.isEven & {
			Set(self, ==) = Set(tokens, ==) & {
				let [a, b] = tokens;
				let k = 0L;
				let h = 0L;
				{
					k < n & {
						h >= 0L
					}
				}.whileTrue {
					k := k + 1L;
					h := (self[k] = a).if { h + 1L } { h - 1L }
				};
				k = n & {
					h = 0L
				}
			}
		}
	}

	isDyckWord { :self |
		self.isDyckWord([1L 0L])
	}

}

+[Integer, @SmallInteger] {

	dyckWords { :t :letters |
		let r = [];
		dyckWordsDo(t, letters) { :b |
			r.add!(b.copy)
		};
		r
	}

	dyckWords { :self |
		self.dyckWords([1L 0L])
	}

	dyckWordsDo { :t :letters :visit/1 |
		let [one, zero] = letters;
		let n = 2L * t;
		let b = List(t, one) ++ List(t, zero);
		let x = t;
		let y = t;
		visit(b);
		{
			x < (n - 1L)
		}.whileTrue {
			b[x] := zero;
			b[y] := one;
			x := x + 1L;
			y := y + 1L;
			(b[x] = zero).ifTrue {
				(x >= ((2L * y) - 2L)).if {
					x := x + 1L
				} {
					b[x] := one;
					b[2] := zero;
					x := 3L;
					y := 2L
				}
			};
			visit(b)
		}
	}

	dyckWordsRecursiveAlgorithm { :n :letters |
		let [a, b] = letters;
		let f = { :x :i :n0 :n1 |
			let d0 = { f(x ++ [a], i + 1L, n0 + 1L, n1) };
			let d1 = { f(x ++ [b], i + 1L, n0, n1 + 1L) };
			((n0 < n) && (n1 < n) && (n0 > n1)).if {
				d0() ++ d1()
			} {
				(
					((n0 < n) && (n1 < n) && (n0 = n1)) ||
					((n0 < n) && (n1 = n))
				).if {
					d0()
				} {
					((n0 = n) && (n1 < n)).if {
						d1()
					} {
						((n0 = n1) && (n1 = n)).if {
							[x]
						} {
							n.error('Integer>>dyckWords')
						}
					}
				}
			}
		};
		f([a], 1L, 1L, 0L)
	}

	isDyckWord { :n |
		withReturn { :return/1 |
			let l = 0L;
			{
				n > 0L
			}.whileTrue {
				l := l + (-1L ^ n);
				(l < 0L).ifTrue {
					false.return
				};
				n := n // 2L
			};
			(l > 0L).not
		}
	}

}
