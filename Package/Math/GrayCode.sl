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
			(0 .. n - 1).grayEncode.integerDigits(2, self)
		)
	}

}

+List{

	grayCodeFromOneIndexedTransitionSequence { :self |
		let k = self.max;
		let v = 0 # k;
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
		(2 .. n + 1).collect { :i |
			(self.atWrap(i) - self.at(i - 1))
			.detectIndex { :x |
				x != 0
			}
		}
	}

	isBeckettGrayCode { :self |
		self.isCyclicGrayCode & {
			self.first.allSatisfy(isZero:/1) & {
				let [m, n] = self.shape;
				let k = (m - 1) // 2;
				let d = 2:m.collect { :i |
					self[i] - self[i - 1]
				}.sortOn(min:/1).allButLast;
				d.first(k).abs = d.last(k)
			}
		}
	}

	isCyclicGrayCode { :self |
		self.isGrayCode & {
			(self.last - self.first).sum.abs = 1
		}
	}

	isGrayCode { :self |
		let [m, n] = self.shape;
		(m = (2 ^ n)) & {
			self.allSatisfy(isBitVector:/1) & {
				2:m.allSatisfy { :i |
					(self[i] - self[i - 1]).sum.abs = 1
				}
			}
		}
	}

}
