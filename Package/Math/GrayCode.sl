GrayCode : [Object, Equal] {

	| sequence alphabet | <List>

	isBeckettGrayCode { :self |
		self.sequence.isBeckettGrayCode
	}

	isCyclicGrayCode { :self |
		self.sequence.isCyclicGrayCode
	}

	size { :self |
		self.sequence.size
	}

	transitionSequence { :self |
		self.sequence.grayCodeTransitionSequence
	}

}

+List {

	GrayCode { :sequence :alphabet |
		uncheckedGrayCode(sequence, alphabet)
	}

	GrayCode { :self |
		self.isVector.if {
			GrayCode(self.grayCodeFromTransitionSequence)
		} {
			GrayCode(self, self.anyOne.nub.sort)
		}
	}

}

+@Binary {

	GrayCode { :self |
		let n = 2 ^ self;
		GrayCode(
			0.to(n - 1).grayEncode.integerDigits(2, self)
		)
	}

	grayDecode { :n |
		let answer = n;
		{
			n := n.bitShiftRight(1);
			n != 0
		}.whileTrue {
			answer := answer.bitXor(n)
		};
		answer
	}

	grayEncode { :n :b |
		let d = n.integerDigits(b);
		let k = d.size;
		let shift = 0;
		let gray = List(k, nil);
		1.toDo(k) { :i |
			gray[i] := (d[i] + shift) % b;
			shift := shift + b - gray[i]
		};
		gray.fromDigits(b)
	}

	grayEncode { :n |
		n.bitXor(n.bitShiftRight(1))
	}

}

+List {

	grayCodeFromOneIndexedTransitionSequence { :self |
		let k = self.max;
		let v = List(k, 0);
		let c = [v.copy];
		self.allButLastDo { :i |
			v[i] := 1 - v[i];
			c.add!(v.copy)
		};
		c
	}

	grayCodeFromTransitionSequence { :self |
		self.min.caseOf(
			[
				0L -> { (self + 1L).grayCodeFromTransitionSequence },
				1L -> { self.grayCodeFromOneIndexedTransitionSequence }
			]
		)
	}

	grayCodeTransitionSequence { :self |
		let n = self.size;
		2.to(n + 1).collect { :i |
			(self.atWrap(i) - self.at(i - 1))
			.detectIndex { :x |
				x != 0
			}
		}
	}

	isBeckettGrayCode { :self |
		self.isBinaryCyclicGrayCode & {
			self.first.allSatisfy(isZero/1) & {
				let [m, n] = self.shape;
				let k = (m - 1) // 2;
				let d = 2.to(m).collect { :i |
					self[i] - self[i - 1]
				}.sortOn!(min/1).allButLast;
				d.first(k).abs = d.last(k)
			}
		}
	}

	isBinaryCyclicGrayCode { :self |
		self.isBinaryGrayCode & {
			(self.last - self.first).sum.abs = 1
		}
	}

	isBinaryGrayCode { :self |
		let [m, n] = self.shape;
		(m = (2 ^ n)) & {
			self.allSatisfy(isBitVector/1) & {
				2.to(m).allSatisfy { :i |
					(self[i] - self[i - 1]).sum.abs = 1
				}
			}
		}
	}

	isCyclicGrayCode { :self :kind |
		kind.caseOf(
			[
				'Binary' -> { self.isBinaryCyclicGrayCode }
			]
		)
	}

	isCyclicGrayCode { :self |
		(self ++ [self.first]).isGrayCode
	}

	isGrayCode { :self :kind |
		kind.caseOf(
			[
				'Binary' -> { self.isBinaryGrayCode }
			]
		)
	}

	isGrayCode { :self |
		self.isMatrix & {
			self.differences.allSatisfy { :each |
				each.count(isNonZero/1) = 1
			}
		}
	}

}

+[Integer, @SmallInteger] {

	savageWinklerAlgorithm { :n |
		(n < 0L).ifTrue {
			n.error('savageWinklerAlgorithm')
		};
		0L.to(n - 1L).collect { :j |
			savageWinklerAlgorithmSubpath(n, j)
		}.catenate
	}

	savageWinklerAlgorithmSubpath { :n :j |
		let piFunction = { :n |
			(n <= 1L).if {
				[1L]
			} {
				let x = piFunction(n - 1L) ++ [n];
				let y = x.atAll(x);
				let z = y.rotateRight(1L);
				z
			}
		};
		let p = { :n :j :reverse |
			(
				n = 1L & {
					j = 0L
				}
			).if {
				reverse.not.if {
					[0L; 1L]
				} {
					[1L; 0L]
				}
			} {
				(
					j >= 0L & {
						j < n
					}
				).if {
					let r = [];
					let o = piFunction(n - 1L);
					reverse.not.if {
						p(n - 1L, j - 1L, false).do { :x |
							let t = [1L] ++ x.atAll(o);
							r.add!(t)
						};
						p(n - 1L, j, false).do { :x |
							let t = [0L] ++ x;
							r.add!(t)
						}
					} {
						p(n - 1L, j, true).do { :x |
							let t = [0L] ++ x;
							r.add!(t)
						};
						p(n - 1L, j - 1L, true).do { :x |
							let t = [1L] ++ x.atAll(o);
							r.add!(t)
						}
					};
					r
				} {
					[]
				}
			}
		};
		j.isEven.if {
			p(n, j, false)
		} {
			p(n, j, true)
		}
	}

}

+[Integer, @SmallInteger] {

	binaryReflectedGrayCode { :n |
		0L.to((2L ^ n) - 1L).collect { :i |
			i.grayEncode.integerDigits(2L, n)
		}
	}

}

+List {

	mixedRadixGrayCode { :bases |
		let answer = [];
		bases.mixedRadixGrayCodeDo { :each :unused |
			answer.add!(each.copy)
		};
		answer
	}

	mixedRadixGrayCodeDo { :bases :receive/2 |
		/* https://www.socs.uoguelph.ca/~sawada/papers/RSG.pdf */
		let n = bases.size;
		let word = List(n, 0L);
		let focus = [1L .. n + 1L];
		let start = List(n, 0L);
		receive(word, nil);
		{
			focus[1L] <= n
		}.whileTrue {
			let index = focus[1L];
			focus[1L] := 1L;
			(word[index] = start[index]).if {
				(
					bases[index] = 2L & {
						start[index] = 1L
					}
				).if {
					word[index] := 0L
				} {
					word[index] := bases[index] - 1L
				}
			} {
				(
					word[index] = 2L & {
						start[index] = 1L
					}
				).if {
					word[index] := word[index] - 2L
				} {
					word[index] := word[index] - 1L
				}
			};
			receive(word, index);
			(word[index] = (1L - start[index])).ifTrue {
				start[index] := word[index];
				focus[index] := focus[index + 1L];
				focus[index + 1L] := index + 1L
			}
		}
	}

}
