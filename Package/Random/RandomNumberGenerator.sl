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

	nextRandomInteger { :self :min :max |
		self.nextRandomFloat(min, max + 1).floor
	}

	randomBit { :self :probablity :shape |
		{ (self.nextRandomFloat < probablity).boole } ! shape
	}

	randomByteArray { :self :n |
		self.randomInteger(0, 255, n).asByteArray
	}

	randomChoice { :self :aSequence :shape |
		let k = aSequence.size;
		{
			let i = self.randomInteger(1, k, []);
			aSequence[i]
		} ! shape
	}

	randomColour { :self :shape |
		{
			RgbColour(
				[
					self.randomReal(0, 1, []),
					self.randomReal(0, 1, []),
					self.randomReal(0, 1, [])
				],
				self.randomReal(0, 1, [])
			)
		} ! shape
	}

	randomComplex { :self :min :max :shape |
		Complex(
			self.randomReal(min.real, max.real, shape),
			self.randomReal(min.imaginary, max.imaginary, shape)
		)
	}

	randomCycle { :self :anInteger |
		anInteger.iota.sattoloShuffle(self).asPermutation
	}

	randomInteger { :self :min :max :shape |
		self.randomReal(min, max + 1, shape).floor
	}

	randomIntegerExcluding { :self :min :max :aBlock:/1 :shape |
		{
			var x;
			{
				x := (self.nextRandomFloat * (max + 1 - min) + min).floor
			}.doWhileTrue {
				aBlock(x)
			};
			x
		} ! shape
	}

	randomIntegerExcludingZero { :self :min :max :shape |
		self.randomIntegerExcluding(min, max, isZero:/1, shape)
	}

	randomLargeInteger { :self :max |
		let k = max.digitLength;
		let h = max.highBitOfMagnitude;
		let m = (2n ^ h) - 1;
		let answer = nil;
		{
			let bytes = self.randomByteArray(k);
			answer := bytes.asLargeInteger.bitAnd(m);
			answer <= 0 || (answer > max)
		}.whileTrue;
		answer
	}

	randomLargeInteger { :self :min :max |
		min + self.randomLargeInteger(max - min)
	}

	randomPermutation { :self :anInteger |
		anInteger.iota.fisherYatesShuffle(self).asPermutation
	}

	randomPermutationList { :self :anInteger :shape |
		{
			self.randomPermutation(anInteger)
		} ! shape
	}

	randomReal { :self :min :max :shape |
		{
			self.nextRandomFloat * (max - min) + min
		} ! shape
	}

	randomSampleSmallPool { :self :aCollection :count |
		let pool = aCollection.asList;
		let answer = [];
		(count > aCollection.size).ifTrue {
			count := aCollection.size
		};
		{
			count > 0
		}.whileTrue {
			let next = self.randomChoice(pool, []);
			answer.add(next);
			pool.remove(next);
			count := count - 1
		};
		answer
	}

	randomSampleLargePool { :self :aCollection :count |
		let answer = [];
		(count > aCollection.size).ifTrue {
			count := aCollection.size
		};
		{
			count > 0
		}.whileTrue {
			let next = self.randomChoice(aCollection, []);
			answer.includes(next).ifFalse {
				answer.add(next);
				count := count - 1
			}
		};
		answer
	}

	randomSample { :self :aCollection :count |
		self.randomSampleLargePool(aCollection, count)
	}

	randomSubsequence { :self :aSequence :aNumber |
		let answer = [];
		aSequence.do { :each |
			(self.nextRandomFloat < aNumber).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	randomWeightedChoice { :self :e :w :n |
		let k = w.sum;
		let x = (k = 1).if { w } { w / k };
		let m = AliasMethod(x, self);
		{ e[m.next] } ! n
	}

	randomWeightedIndex { :self :aSequence |
		let r = self.nextRandomFloat;
		let sum = 0;
		let answer = 1;
		valueWithReturn { :return:/1 |
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

}

+@Object {

	isRandomNumberGenerator { :self |
		false
	}

}

+SmallFloat {

	randomIntegerBipolar { :max |
		system.randomInteger(max.negated, max, [])
	}

	randomReal { :max :shape |
		system.randomReal(0, max, shape)
	}

	randomReal { :max |
		system.randomReal(0, max, [])
	}

	randomRealBipolar { :max |
		system.randomReal(max.negated, max, [])
	}

}
