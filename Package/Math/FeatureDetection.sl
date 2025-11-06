+List {

	contourDetect { :self :delta |
		let answer = [];
		1.toDo(self.size) { :i |
			let a = self.atPin(i - 1);
			let b = self.at(i);
			let c = self.atPin(i + 1);
			(
				(b.abs > delta).not | {
					b > 0 & { a < 0 | { c < 0 } }
				}
			).ifTrue {
				answer.add([i] -> 1)
			}
		};
		SparseArray(answer, [self.size], 0)
	}

	contourDetect { :self |
		self.contourDetect(0)
	}

	crossingDetect { :self :delta |
		let answer = [];
		let p = self[1].sign;
		2.toDo(self.size) { :i |
			let q = self[i].sign;
			q.isZero.ifFalse {
				((p + q).abs > delta).ifFalse {
					answer.add([i] -> 1)
				};
				p := q
			}
		};
		SparseArray(answer, [self.size], 0)
	}

	crossingDetect { :self |
		self.crossingDetect(0)
	}

	findPeaks { :self |
		let p = self.peakDetect;
		let z = 0;
		let answer = [];
		1.to(self.size).collect { :i |
			let q = p[i];
			(q = 1 & { z = 0 }).ifTrue {
				answer.add([i, self[i]])
			};
			z := q
		};
		answer
	}

	isLocalMinimaBy { :self :i :delta :aBlock:/2 |
		let n = self.size;
		let y = self[i];
		let y0 = y;
		let y1 = y;
		let j = i - 1;
		let k = i + 1;
		{
			j >= 1 & { (y0 - y).abs <= delta }
		}.whileTrue {
			y0 := self[j];
			j := j - 1
		};
		{
			k <= n & { (y1 - y).abs <= delta }
		}.whileTrue {
			y1 := self[k];
			k := k + 1
		};
		aBlock(y, y0) & { aBlock(y, y1) }
	}

	isLocalMinimaBy { :self :aBlock:/2 |
		SparseArray(
			self.localMinimaByIndices(aBlock:/2).collect { :i |
				[i] -> true
			},
			[self.size],
			false
		).normal
	}

	maxDetect { :self |
		1.to(self.size).collect { :i |
			self.isLocalMinimaBy(i, 0, >=)
		}.boole
	}

	minDetect { :self |
		1.to(self.size).collect { :i |
			self.isLocalMinimaBy(i, 0, <=)
		}.boole
	}

	peakDetect { :self |
		self.maxDetect
	}

	zeroCrossingCount { :self |
		self.zeroCrossingDetect.count(identity:/1)
	}

	zeroCrossingDetect { :self |
		let answer = List(self.size, false);
		let p = self[1].sign;
		2.toDo(self.size) { :i |
			let q = self[i].sign;
			q.isZero.ifFalse {
				(p + q).isZero.ifTrue {
					answer[i] := true
				};
				p := q
			}
		};
		answer
	}

	zeroCrossingRate { :self |
		let n = self.size;
		let m = 1 / (n - 1);
		let b = self.collect { :each |
			(each >= 0).boole
		};
		b.differences.abs.sum * m
	}

}

+[List, ListView] {

	findRepeat { :self :aBlock:/2 |
		let k = self.size;
		valueWithReturn { :return:/1 |
			1.toDo(k - 1) { :i |
				i.to(k).allSatisfy { :j |
					aBlock(self[j], self[j.mod(i, 1)])
				}.ifTrue {
					self.copyFromTo(1, i).return
				}
			};
			self
		}
	}

	findRepeat { :self |
		self.findRepeat(=)
	}

	findTransientRepeat { :self :n :aBlock:/2 |
		let k = self.size;
		valueWithReturn { :return:/1 |
			let m = k - (n * 2) + 1;
			1.toDo(m) { :i |
				let part = self.sliceFromTo(i, k);
				let repeat = part.findRepeat(aBlock:/2);
				(repeat !== part & { (repeat.size * n) <= (k - i + 1) }).ifTrue {
					[self.copyFromTo(1, i - 1), repeat.asList].return
				}
			};
			[self, []]
		}
	}

	findTransientRepeat { :self :n |
		self.findTransientRepeat(n, =)
	}

}

+String {

	findRepeat { :self |
		self.contents.findRepeat.stringJoin
	}

	findTransientRepeat { :self :n |
		self.contents.findTransientRepeat(n).collect(stringJoin:/1)
	}

}
