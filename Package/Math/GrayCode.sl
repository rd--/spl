GrayCode : [Object, Equatable] { | sequence alphabet |

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
		newGrayCode().initializeSlots(sequence, alphabet)
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

	grayEncode { :n :b |
		let d = n.integerDigits(b);
		let k = d.size;
		let shift = 0;
		let gray = List(k);
		1.toDo(k) { :i |
			gray[i] := (d[i] + shift) % b;
			shift := shift + b - gray[i]
		};
		gray.fromDigits(b)
	}

	grayEncode { :n |
		n.bitXor(n.bitShiftRight(1))
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

	GrayCode { :self |
		let n = 2 ^ self;
		GrayCode(
			0.to(n - 1).grayEncode.integerDigits(2, self)
		)
	}

}

+List {

	grayCodeFromOneIndexedTransitionSequence { :self |
		let k = self.max;
		let v = List(k, 0);
		let c = [v.copy];
		self.allButLastDo { :i |
			v[i] := 1 - v[i];
			c.add(v.copy)
		};
		c
	}

	grayCodeFromTransitionSequence { :self |
		self.min.caseOf(
			[
				0 -> { (self + 1).grayCodeFromTransitionSequence },
				1 -> { self.grayCodeFromOneIndexedTransitionSequence }
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
			self.first.allSatisfy(isZero:/1) & {
				let [m, n] = self.shape;
				let k = (m - 1) // 2;
				let d = 2.to(m).collect { :i |
					self[i] - self[i - 1]
				}.sortOn(min:/1).allButLast;
				d.first(k).abs = d.last(k)
			}
		}
	}

	isBinaryGrayCode { :self |
		let [m, n] = self.shape;
		(m = (2 ^ n)) & {
			self.allSatisfy(isBitVector:/1) & {
				2.to(m).allSatisfy { :i |
					(self[i] - self[i - 1]).sum.abs = 1
				}
			}
		}
	}

	isBinaryCyclicGrayCode { :self |
		self.isBinaryGrayCode & {
			(self.last - self.first).sum.abs = 1
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
				each.count(isNonZero:/1) = 1
			}
		}
	}

}

+@Integer {

	savageWinklerAlgorithmSubpath { :n :j |
		let pi = { :n |
			(n <= 1).if {
				[1]
			} {
				let x = pi(n - 1) ++ [n];
				let y = x.atAll(x);
				let z = y.rotateRight(1);
				z
			}
		};
		let p = { :n :j :reverse |
			(n = 1 & { j = 0 }).if {
				reverse.not.if {
					[0; 1]
				} {
					[1; 0]
				}
			} {
				(j >= 0 & { j < n }).if {
					let r = [];
					let o = pi(n - 1);
					reverse.not.if {
						p(n - 1, j - 1, false).do { :x |
							let t = [1] ++ x.atAll(o);
							r.add(t)
						};
						p(n - 1, j, false).do { :x |
							let t = [0] ++ x;
							r.add(t)
						}
					} {
						p(n - 1, j, true).do { :x |
							let t = [0] ++ x;
							r.add(t)
						};
						p(n - 1, j - 1, true).do { :x |
							let t = [1] ++ x.atAll(o);
							r.add(t)
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

	savageWinklerAlgorithm { :n |
		(n < 0).ifTrue {
			n.error('savageWinklerAlgorithm')
		};
		0.to(n - 1).collect { :j |
			savageWinklerAlgorithmSubpath(n, j)
		}.catenate
	}

}

+@Integer {

	binaryReflectedGrayCode { :n |
		0.to((2 ^ n) - 1).collect { :i |
			i.grayEncode.integerDigits(2, n)
		}
	}

}

+List{

	mixedRadixGrayCodeDo { :bases :receive:/2 |
		/* https://www.socs.uoguelph.ca/~sawada/papers/RSG.pdf */
		let n = bases.size;
		let word = List(n, 0);
		let focus = [1 .. n + 1];
		let start = List(n, 0);
		receive(word, nil);
		{ focus[1] <= n }.whileTrue {
			let index = focus[1];
			focus[1] := 1;
			(word[index] = start[index]).if {
				(bases[index] = 2 & { start[index] = 1 }).if {
					word[index] := 0
				} {
					word[index] := bases[index] - 1
				}
			} {
				(word[index] = 2 & { start[index] = 1}).if {
					word[index] := word[index] - 2
				} {
					word[index] := word[index] - 1
				}
			};
			receive(word, index);
			(word[index] = (1 - start[index])).ifTrue {
				start[index] := word[index];
				focus[index] := focus[index + 1];
				focus[index + 1] := index + 1
			}
		}
	}

	mixedRadixGrayCode { :bases |
		let answer = [];
		bases.mixedRadixGrayCodeDo { :each :unused |
			answer.add(each.copy)
		};
		answer
	}

}
