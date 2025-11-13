DyckWord : [Object, Storeable] { | word tokens |

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

	dyckWords { :n :letters |
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

	dyckWords { :self |
		self.dyckWords([1 0])
	}

}
