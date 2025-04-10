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
		self.randomBoolean(probablity, shape).boole
	}

	randomBoolean { :self :probablity :shape |
		{
			(self.nextRandomFloat < probablity)
		} ! shape
	}

	randomByteArray { :self :n |
		self.randomInteger([0, 255], n).asByteArray
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
		let min = range.min;
		let max = range.max;
		Complex(
			self.randomReal([min.real, max.real], shape),
			self.randomReal([min.imaginary, max.imaginary], shape)
		)
	}

	randomCycle { :self :anInteger |
		anInteger.iota.sattoloShuffle(self).asPermutation
	}

	randomInteger { :self :range :shape |
		let min = range.min;
		let max = range.max;
		self.randomReal([min, max + 1], shape).floor
	}

	randomIntegerExcluding { :self :range :aBlock:/1 :shape |
		let min = range.min;
		let max = range.max;
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

	randomIntegerExcludingZero { :self :range :shape |
		self.randomIntegerExcluding(range, isZero:/1, shape)
	}

	randomLargeInteger { :self :max |
		let k = max.digitLength;
		let h = max.highBitOfMagnitude;
		let m = (2L ^ h) - 1;
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

	randomReal { :self :range :shape |
		let min = range.min;
		let max = range.max;
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
			let next = pool.randomChoice(self, []);
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
			let next = aCollection.randomChoice(self, []);
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
		system.randomInteger([max.negated, max], [])
	}

	randomReal { :max :shape |
		system.randomReal([0, max], shape)
	}

	randomReal { :max |
		system.randomReal([0, max], [])
	}

	randomRealBipolar { :max |
		system.randomReal([max.negated, max], [])
	}

}
