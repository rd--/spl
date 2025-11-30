DyckWord : [Object, Storeable] { | word tokens |

	binaryExpansion { :self |
		let [a, b] = self.tokens;
		self.word.collect { :each |
			(each = a).boole
		}
	}

	heights { :self |
		let [a, b] = self.tokens;
		let h = 0;
		let answer = [h];
		self.word.do { :each |
			h := (each = a).if { h + 1 } { h - 1 };
			answer.add(h)
		};
		answer
	}

	integer { :self |
		self.binaryExpansion.fromDigits(2)
	}

	lukasiewiczWord { :self |
		let w = [];
		self.tree.do { :t |
			w.add(t.size)
		};
		w
	}

	parenthesization { :self |
		self.binaryExpansion.collect { :each |
			(each = 1).if { '(' } { ')' }
		}.stringJoin
	}

	tree { :self |
		let w = self.binaryExpansion;
		let s = [Tree(nil, [])];
		w.do { :x |
			(x = 1).if {
				let t = Tree(nil, []);
				s[1].subTrees.addLast(t);
				s.addFirst(t)
			} {
				s.removeFirst
			}
		};
		s[1]
	}

	treePlot { :self |
		self.tree.treePlot
	}

}

+List {

	DyckWord { :word :tokens |
		word.isDyckWord(tokens).if {
			newDyckWord().initializeSlots(word, tokens)
		} {
			word.error('DyckWord: invalid word')
		}
	}

}

+List {

	isDyckWord { :self :tokens |
		let n = self.size;
		n.isEven & {
			Set(self) = Set(tokens) & {
				let [a, b] = tokens;
				let k = 0;
				let h = 0;
				{ k < n & { h >= 0 } }.whileTrue {
					k := k + 1;
					h := (self[k] = a).if { h + 1 } { h - 1 }
				};
				k = n & { h = 0 }
			}
		}
	}

	isDyckWord { :self |
		self.isDyckWord([1 0])
	}

}

+@Integer {

	dyckWordsDo { :t :letters :visit:/1 |
		let [one, zero] = letters;
		let n = 2 * t;
		let b = List(t, one) ++ List(t, zero);
		let x = t;
		let y = t;
		visit(b);
		{ x < (n - 1) }.whileTrue {
			b[x] := zero;
			b[y] := one;
			x := x + 1;
			y := y + 1;
			(b[x] = zero).ifTrue {
				(x >= ((2 * y) - 2)).if {
					x := x + 1
				} {
					b[x] := one;
					b[2] := zero;
					x := 3;
					y := 2
				}
			};
			visit(b)
		}
	}

	dyckWords { :t :letters |
		let r = [];
		dyckWordsDo(t, letters) { :b |
			r.add(b.copy)
		};
		r
	}

	dyckWords { :self |
		self.dyckWords([1 0])
	}

	dyckWordsRecursiveAlgorithm { :n :letters |
		let [a, b] = letters;
		let f = { :x :i :n0 :n1 |
			let d0 = { f(x ++ [a], i + 1, n0 + 1, n1) };
			let d1 = { f(x ++ [b], i + 1, n0, n1 + 1) };
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
		f([a], 1, 1, 0)
	}

	isDyckWord { :n |
		valueWithReturn { :return:/1 |
			let l = 0;
			{ n > 0 }.whileTrue {
				l := l + (-1 ^ n);
				(l < 0).ifTrue {
					false.return
				};
				n := n // 2
			};
			(l > 0).not
		}
	}

}
