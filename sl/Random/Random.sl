@Random {

	isRandom { :self |
		true
	}

	next { :self |
		self.nextRandomFloat
	}

	nextRandomFloat { :self |
		self.error('@Random>>nextRandomFloat: type responsibility')
	}

	randomByteArray { :self :n |
		self.randomInteger(0, 255, n).asByteArray
	}

	randomChoice { :self :aSequence :shape |
		let k = aSequence.size;
		{
			let i = self.randomInteger(1, k);
			aSequence[i]
		} ! shape
	}

	randomChoice { :self :e :w :n |
		let k = w.sum;
		let x = (k = 1).if { w } { w / k };
		let m = AliasMethod(x, self);
		{ e[m.next] } ! n
	}

	randomComplex { :self :max |
		self.randomComplex(0j0, max)
	}

	randomComplex { :self :min :max |
		Complex(
			self.randomFloat(min.real, max.real),
			self.randomFloat(min.imaginary, max.imaginary)
		)
	}

	randomCycle { :self :anInteger |
		[1 .. anInteger].sattoloShuffle(self).asPermutation
	}

	randomFloat { :self :max |
		self.nextRandomFloat * max
	}

	randomFloat { :self :min :max |
		min + self.randomFloat(max - min)
	}

	randomFloat { :self :min :max :countOrShape |
		countOrShape.isInteger.if {
			{ self.randomFloat(min, max) } ! countOrShape
		} {
			countOrShape.fill { :unusedIndex |
				self.randomFloat(min, max)
			}
		}
	}

	randomInteger { :self :max |
		self.randomFloat(1, max + 1).floor
	}

	randomInteger { :self :min :max |
		self.randomFloat(min, max + 1).floor
	}

	randomInteger { :self :min :max :countOrShape |
		{ self.randomInteger(min, max) } ! countOrShape
	}

	randomIntegerBipolar { :self :max |
		self.randomInteger(max.negated, max)
	}

	randomIntegerExcluding { :self :min :max :excluded |
		let answer = self.randomInteger(min, max);
		(answer = excluded).if {
			max
		} {
			answer
		}
	}

	randomIntegerExcludingZero { :self :min :max |
		self.randomIntegerExcluding(min, max, 0)
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
		[1 .. anInteger].fisherYatesShuffle(self).asPermutation
	}

	randomPermutationList { :self :anInteger :shape |
		{
			self.randomPermutation(anInteger)
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
			let next = pool.atRandom(self);
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
			let next = aCollection.atRandom(self);
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

	isRandom { :self |
		false
	}

}

