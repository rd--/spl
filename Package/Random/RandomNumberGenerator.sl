@RandomNumberGenerator {

	isRandomNumberGenerator { :self |
		true
	}

	next { :self |
		self.nextRandomFloat
	}

	nextRandomFloat { :self |
		self.error('@RandomNumberGenerator>>nextRandomFloat: type responsibility')
	}

	nextRandomFloat { :self :min :max |
		self.nextRandomFloat * (max - min) + min
	}

	nextRandomSmallInteger { :self :min :max |
		self.nextRandomFloat(min, max + 1).floor
	}

	randomBit { :self :probablity :shape |
		self.randomBoolean(probablity, shape).boole
	}

	randomBoolean { :self :probablity :shape |
		{
			(self.nextRandomFloat < probablity)
		} ! shape
	}

	randomByteArray { :self :n |
		self.randomSmallInteger([0, 255], n).ByteArray
	}

	randomColour { :self :shape |
		{
			RgbColour(
				self.randomReal([0, 1], [3]),
				self.randomReal([0, 1], [])
			)
		} ! shape
	}

	randomComplex { :self :range :shape |
		let [min, max] = range;
		Complex(
			self.randomReal([min.real, max.real], shape),
			self.randomReal([min.imaginary, max.imaginary], shape)
		)
	}

	randomCycle { :self :anInteger |
		anInteger.iota.sattoloShuffle!(self).Permutation
	}

	randomInteger { :self :range :shape |
		let [a, b] = range;
		{
			a + self.randomIntegerUpTo(b - a)
		} ! shape
	}

	randomIntegerUpTo { :self :u |
		let k = u.digitLength;
		let h = u.highBitOfInteger;
		let m = (2L ^ h) - 1;
		let x = nil;
		{
			let bytes = self.randomByteArray(k);
			x := bytes.decodeInteger(true).bitAnd(m);
			x <= 0 || (x > u)
		}.whileTrue;
		x
	}

	randomPermutation { :self :anInteger :shape |
		{
			self.fisherYatesShuffle!(anInteger.iota).Permutation
		} ! shape
	}

	randomPermutation { :self :anInteger |
		self.randomPermutation(anInteger, [])
	}

	randomPermutationList { :self :anInteger :shape |
		self.randomPermutation(anInteger, shape).collect(permutationList/1)
	}

	randomPermutationList { :self :anInteger |
		self.randomPermutation(anInteger, []).permutationList
	}

	randomReal { :self :range :shape |
		let min = range.min;
		let max = range.max;
		{
			self.nextRandomFloat * (max - min) + min
		} ! shape
	}

	randomSample { :self :aCollection :count |
		self.randomSampleLargePool(aCollection, count)
	}

	randomSampleLargePool { :self :aCollection :count |
		let answer = [];
		(count > aCollection.size).ifTrue {
			count := aCollection.size
		};
		{
			count > 0
		}.whileTrue {
			let next = aCollection.randomChoice(self, []);
			answer.includes(next).ifFalse {
				answer.add!(next);
				count := count - 1
			}
		};
		answer
	}

	randomSampleSmallPool { :self :aCollection :count |
		let pool = aCollection.List;
		let answer = [];
		(count > aCollection.size).ifTrue {
			count := aCollection.size
		};
		{
			count > 0
		}.whileTrue {
			let next = pool.randomChoice(self, []);
			answer.add!(next);
			pool.remove!(next);
			count := count - 1
		};
		answer
	}

	randomSmallInteger { :self :range :shape |
		let min = range.min;
		let max = range.max;
		self.randomReal([min, max + 1], shape).floor
	}

	randomSmallIntegerExcluding { :self :range :aBlock/1 :shape |
		let min = range.min;
		let max = range.max;
		{
			let x = nil;
			{
				x := (self.nextRandomFloat * (max + 1 - min) + min).floor
			}.doWhileTrue {
				aBlock(x)
			};
			x
		} ! shape
	}

	randomSmallIntegerExcludingZero { :self :range :shape |
		self.randomSmallIntegerExcluding(range, isZero/1, shape)
	}

	randomSubsequence { :self :aSequence :aNumber |
		let answer = [];
		aSequence.do { :each |
			(self.nextRandomFloat < aNumber).ifTrue {
				answer.add!(each)
			}
		};
		answer
	}

	randomWeightedChoice { :self :e :w :shape |
		let k = w.sum;
		let x = (k = 1).if { w } { w / k };
		let m = AliasMethod(x);
		{
			e[m.nextRandom(self)]
		} ! shape
	}

	randomWeightedIndex { :self :aSequence |
		let r = self.nextRandomFloat;
		let sum = 0;
		let answer = 1;
		withReturn { :return/1 |
			aSequence.do { :each |
				sum := sum + each;
				(sum > r).ifTrue {
					answer.return
				};
				answer := answer + 1
			};
			answer
		}
	}

	reservoirSampleAlgorithmL { :self :s :k |
		let n = s.size;
		let r = s.copyFromTo(1, k);
		let w = (self.nextRandomFloat.log / k).exp;
		let i = k + 1;
		{
			i <= n
		}.whileTrue {
			i := i + (self.nextRandomFloat.log / (1 - w).log).floor + 1;
			(i <= n).ifTrue {
				r[self.nextRandomSmallInteger(1, k)] := s[i];
				w := w * (self.nextRandomFloat.log / k).exp
			}
		};
		r
	}

}

+@Object {

	isRandomNumberGenerator { :self |
		false
	}

}

+Float {

	randomReal { :max :shape |
		system.randomReal([0, max], shape)
	}

	randomReal { :max |
		system.randomReal([0, max], [])
	}

	randomRealBipolar { :max |
		system.randomReal([max.negate, max], [])
	}

	randomSmallIntegerBipolar { :max |
		system.randomSmallInteger([max.negate, max], [])
	}

}
