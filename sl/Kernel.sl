@SystemCache {

}

+@SystemCache {

	bitCountPerByteTable { :self |
		{
			(0 .. 255).collect { :i |
				| bitCount = 0, n = i; |
				{ n = 0 }.whileFalse {
					bitCount := bitCount + 1;
					n := n.bitAnd(n - 1)
				};
				bitCount
			}.ByteArray
		}.once(self, 'bitCountPerByteTable')
	}

	highBitPerByteTable { :self |
		{
			(1 .. 8).injectInto([0]) { :highBits :rank |
				highBits ++ highBits.collect { :each |
					rank
				}
			}.ByteArray
		}.once(self, 'highBitPerByteTable')
	}

	lowBitPerByteTable { :self |
		{
			(1 .. 8).injectInto([1]) { :lowBits :unusedRank |
				| prefix = lowBits.copy; |
				prefix[1] := lowBits[1] + 1;
				prefix ++ lowBits
			}.allButFirst.ByteArray
		}.once(self, 'lowBitPerByteTable')
	}

}

@Binary {

	<< { :self :anInteger |
		self.typeResponsibility('@Binary>>shiftLeft')
	}

	>> { :self :anInteger |
		self.typeResponsibility('@Binary>>shiftRight')
	}

	bitAnd { :self :anInteger |
		self.typeResponsibility('@Binary>>bitAnd')
	}

	bitAt { :self :anInteger |
		self.bitShift(1 - anInteger).bitAnd(1)
	}

	bitCount { :self |
		(self < 0).if {
			self.error('@Binary>>bitCount: cannot count bits of negative integers')
		} {
			| n = self, bitCount = 0; |
			{ n = 0 }.whileFalse {
				bitCount := bitCount + system.bitCountPerByteTable[n.bitAnd(16rFF) + 1];
				n := n.bitShift(-8)
			};
			bitCount
		}
	}

	bitCountOfByte { :self |
		system.bitCountPerByteTable[self + 1]
	}

	bitNot { :self |
		self.typeResponsibility('@Binary>>bitNot')
	}

	bitOr { :self :anInteger |
		self.typeResponsibility('@Binary>>bitOr')
	}

	bitXor { :self :anInteger |
		self.typeResponsibility('@Binary>>bitXor')
	}

	bitShift { :self :anInteger |
		anInteger.negative.if {
			self >> anInteger.negated
		} {
			self << anInteger
		}
	}

	bitShiftLeft { :self :anInteger |
		self << anInteger
	}

	bitShiftRight { :self :anInteger |
		self >> anInteger
	}

	highBit { :self |
		(self < 0).if {
			self.error('@Binary>>highBit is not defined for negative integers')
		} {
			self.highBitOfPositiveReceiver
		}
	}

	highBitOfByte { :self |
		system.highBitPerByteTable[self + 1]
	}

	highBitOfMagnitude { :self |
		(self < 0).if {
			self.negated.highBit
		} {
			self.highBitOfPositiveReceiver
		}
	}

	highBitOfPositiveReceiver { :self |
		| shifted = self, bitNo = 0; |
		{ shifted < 65536 }.whileFalse {
			shifted := shifted.bitShiftRight(16);
			bitNo := bitNo + 16
		};
		(shifted < 256).ifFalse {
			shifted := shifted.bitShiftRight(8);
			bitNo := bitNo + 8
		};
		bitNo + shifted.highBitOfByte
	}

	isBinary { :self |
		true
	}

	lowBit { :self |
		(self = 0).if {
			0
		} {
			| n = self, result = 0,	lastByte = nil; |
			{
				lastByte := n.bitAnd(16rFF);
				n = 0
			}.whileTrue {
				result := result + 8;
				n := n.bitShift(-8)
			};
			result + system.lowBitPerByteTable[lastByte]
		}
	}

}

@Integral {

	adaptToFractionAndApply { :self :aFraction :aProcedure:/2 |
		aFraction.aProcedure(Fraction(self, 1))
	}

	asHexDigit { :self |
		'0123456789ABCDEF'[self + 1]
	}

	asLargerPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.positive.if {
				1.bitShiftLeft(self.highBitOfPositiveReceiver)
			} {
				self.error('@Integral>>asLargerPowerOfTwo: non-positive')
			}
		}
	}

	asPowerOfTwo { :self |
		self.asSmallerPowerOfTwo
	}

	asSmallerPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.positive.if {
				1.bitShiftLeft(self.highBitOfPositiveReceiver - 1)
			} {
				self.error('@Integral>>asSmallerPowerOfTwo: non-positive')
			}
		}
	}

	asWords { :self |
		|(
			mils = [
				'', ' thousand',
				' million', ' billion', ' trillion', ' quadrillion', ' quintillion',
				' sextillion', ' septillion', ' octillion', ' nonillion', ' decillion',
				' undecillion', ' duodecillion', ' tredecillion', ' quattuordecillion', ' quindecillion',
				' sexdecillion', ' septendecillion', ' octodecillion', ' novemdecillion', ' vigintillion'
			]
		)|
		(self = 0).if {
			'zero'
		} {
			| minus = '', three = nil, num = self, answer = '', milCount = 1; |
			(self < 0).ifTrue {
				minus := 'negative ';
				num := self.negated
			};
			{ num > 0 }.whileTrue {
				three := (num % 1000).threeDigitName;
				num := num // 1000;
				three.isEmpty.ifFalse {
					answer.isEmpty.ifFalse {
						answer := ', ' ++ answer
					};
					answer := three ++ mils[milCount] ++ answer
				};
				milCount := milCount + 1
			};
			minus ++ answer
		}
	}

	atRandomBy { :self :random |
		random.randomInteger(self)
	}

	atRandom { :self |
		system.randomInteger(self)
	}

	benchFib { :self |
		(self < 2).if {
			1
		} {
			(self - 1).benchFib + (self - 2).benchFib + 1
		}
	}

	benchmark { :self |
		| size = 8190, count = nil; |
		self.timesRepeat {
			| flags = Array(size); |
			flags.atAllPut(true);
			count := 0;
			1.upToDo(size) { :index |
				flags[index].ifTrue {
					| prime = index + 1, k = index + prime; |
					{ k <= size }.whileTrue {
						flags[k] := false;
						k := k + prime
					};
					count := count + 1
				}
			}
		};
		count
	}

	denominator { :self |
		1
	}

	digitAt { :self :n |
		(n = 1).if {
			(self < 0).if {
				-256 - self.bitAnd(255)
			} {
				self.bitAnd(255)
			}
		} {
			(self < 0).if {
				(-256 - self.bitShift(-8) + 1).digitAt(n - 1)
			} {
				self.bitShift(8 - n.bitShift(3)).bitAnd(255)
			}
		}
	}

	digitLength { :self |
		| value = self, length = 1; |
		(value < -255).ifTrue {
			length := 2;
			value := (-256 - self.bitShift(-8)) + 1
		};
		{ value > 255 }.whileTrue {
			value := value.bitShift(-8);
			length := length + 1
		};
		length
	}

	divisors { :self |
		1.to(self).select { :each |
			self \\ each = 0
		}
	}

	doubleFactorial { :self |
		self.negative.if {
			self.error('@Integral>>doubleFactorial: not valid for negative integers')
		} {
			(self <= 3).if {
				self.max(1)
			} {
				self * (self - 2).doubleFactorial
			}
		}
	}

	factorial { :self |
		self.negative.ifTrue {
			'@Integral>>factorial: not valid for negative integers'.error
		};
		(self <= 1).if {
			1
		} {
			| next = self, answer = self; |
			{ next > 1 }.whileTrue {
				next := next - 1;
				answer := answer * next
			};
			answer
		}
	}

	gcd { :self :anInteger |
		| a = self.abs, b = anInteger.abs; |
		{ b = 0 }.whileFalse {
			| r = a % b; |
			a := b;
			b := r
		};
		a
	}

	isByte { :self |
		self.isInteger & {
			self >= 0 & {
				self < 256
			}
		}
	}

	isCoprime { :self :anInteger |
		self.gcd(anInteger) = 1
	}

	isInteger { :self |
		self.typeResponsibility('@Integral>>isInteger')
	}

	isPowerOfTwo { :self |
		(self ~= 0) & {
			self.bitAnd(self - 1) = 0
		}
	}

	isPrime { :self |
		(self <= 1).if {
			false
		} {
			(self = 2).if {
				true
			} {
				| selfSqrt = self.sqrt, i = 2; |
				valueWithReturn { :return:/1 |
					{ i <= selfSqrt }.whileTrue {
						(self % i = 0).ifTrue {
							false.return
						};
						i := i + 1
					};
					true.return
				}
			}
		}
	}

	lcm { :self :anInteger |
		| a = self, b = anInteger; |
		(a = 0 | {
			b = 0
		}).if {
			0
		} {
			| ab = a * b; |
			{ b = 0}.whileFalse {
				| t = b; |
				b := a % t;
				a := t
			};
			(ab / a).abs
		}
	}

	nextPrime { :self |
		| maybePrime = self + 1; |
		{ maybePrime.isPrime.not }.whileTrue {
			maybePrime := maybePrime + 1
		};
		maybePrime
	}

	nthPrime { :self |
		|(
			primesArray = system.cache.atIfAbsentPut('primesArray') {
				23.primesArray
			}
		)|
		(self > primesArray.size).if {
			self.primesArrayExtend(primesArray)
		} {
			primesArray[self]
		}
	}

	primeFactors { :self |
		(self <= 1).if {
			[].return
		} {
			valueWithReturn { :return:/1 |
				| index = 1, prime = 2, k = self, answer = []; |
				{
					prime := index.nthPrime;
					{
						k % prime = 0
					}.whileTrue {
						answer.add(prime);
						k := k // prime;
						(k = 1).ifTrue {
							answer.return
						}
					};
					(prime.squared > k).ifTrue {
						answer.add(k);
						answer.return
					};
					index := index + 1
				}.repeat;
				answer
			}
		}
	}

	primeFactorization { :self |
		self.primeFactors.Bag
	}

	primeLimit { :self |
		self.primeFactors.max
	}

	primesArray { :self |
		| answer = Array(self), n = 1; |
		answer.indicesDo { :index |
			n := n.nextPrime;
			answer[index] := n
		};
		answer
	}

	primesArrayExtend { :self :anArray |
		| n = anArray.last; |
		(self - anArray.size).timesRepeat {
			n := n.nextPrime;
			anArray.add(n)
		};
		n
	}

	primesUpTo { :self |
		| answer = []; |
		self.primesUpToDo { :n |
			answer.add(n)
		};
		answer
	}

	primesUpToDo { :self :aProcedure:/1 |
		| n = 2; |
		{ n <= self }.whileTrue {
			aProcedure(n);
			n := n.nextPrime
		}
	}

	printStringHex { :self |
		<primitive: return _self.toString(16).toUpperCase();>
	}

	numerator { :self |
		self
	}

	printStringRoman { :self |
		{ :stream |
			romanDigitsOn(self, stream)
		}.asciiStringStreamContents
	}

	romanDigitsForOn { :self :digits :base :aStream |
		| n = self % (base * 10) // base; |
		(n = 9).if {
			aStream.nextPutAll([digits.last, digits.first])
		} {
			(n = 4).if {
				aStream.nextPutAll([digits.last, digits.second])
			} {
				(n > 4).ifTrue {
					aStream.nextPut(digits.second)
				};
				(n % 5).timesRepeat {
					aStream.nextPut(digits.last)
				}
			}
		}
	}

	romanDigitsOn { :self :aStream |
		|(
			integer = self.negative.if {
				aStream.nextPut('-'.asciiValue);
				self.negated
			} {
				self
			}
		)|
		(integer // 1000).timesRepeat {
			aStream.nextPut('M'.asciiValue)
		};
		integer.romanDigitsForOn('MDC'.asciiByteArray, 100, aStream);
		integer.romanDigitsForOn('CLX'.asciiByteArray, 10, aStream);
		integer.romanDigitsForOn('XVI'.asciiByteArray, 1, aStream)
	}

	take { :self :k |
		(k < 0 | { k > self }).if {
			0
		} {
			| numerator = 1, denominator = 1; |
			self.toByDo(k.max(self - k) + 1, -1) { :factor |
				numerator := numerator * factor
			};
			1.toDo(k.min(self - k)) { :factor |
				denominator := denominator * factor
			};
			numerator // denominator
		}
	}

	threeDigitName { :self |
		|(
			units = [
				'one', 'two', 'three', 'four', 'five',
				'six', 'seven', 'eight', 'nine', 'ten',
				'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
				'sixteen', 'seventeen', 'eighteen', 'nineteen'
			],
			decades = [
				'twenty', 'thirty', 'forty', 'fifty',
				'sixty', 'seventy', 'eighty', 'ninety'
			]
		)|
		valueWithReturn { :return:/1 |
			| answer |
			(self = 0).ifTrue {
				''.return
			};
			(self > 99).ifTrue {
				answer := (units[self // 100]) ++' hundred';
				((self % 100) = 0).ifFalse {
					answer := answer ++ ' ' ++ (self % 100).threeDigitName
				};
				answer.return
			};
			(self < 20).ifTrue {
				units[self].return
			};
			answer := decades[self // 10 - 1];
			((self % 10) = 0).ifFalse {
				answer := answer ++ '-' ++ (units[self % 10])
			};
			answer.return
		}
	}

	timesRepeat { :self :aProcedure:/0 |
		| remaining = self; |
		{ remaining > 0 }.whileTrue {
			aProcedure();
			remaining := remaining - 1
		};
		self
	}

}

+Void {

	tinyBenchmarks {
		| t1 t2 r n1 n2 |
		n1 := 1;
		{
			t1 := system.millisecondsToRun {
				n1.benchmark
			};
			t1 < 1000
		}.whileTrue {
			n1 := n1 * 2
		};
		n2 := 28;
		{
			t2 := system.millisecondsToRun {
				r := n2.benchFib
			};
			t2 < 1000
		}.whileTrue {
			n2 := n2 + 1
		};
		[
			((n1 * 500000 * 1000) // t1.roundTo(100)).asStringWithCommas,
			' bytecodes/sec; ',
			((r * 1000) // t2.roundTo(100)).asStringWithCommas,
			' sends/sec'
		].join
	}

}

@Json {

	json { :self |
		<primitive: return JSON.stringify(_self);>
	}

	json { :self :replacer :space |
		<primitive: return JSON.stringify(_self, _replacer, _space);>
	}

}

@Magnitude {

	< { :self :aMagnitude |
		self.typeResponsibility('@Magnitude>>lessThan')
	}

	<= { :self :aMagnitude |
		self < aMagnitude | {
			self = aMagnitude
		}
	}

	> { :self :aMagnitude |
		aMagnitude < self
	}

	>= { :self :aMagnitude |
		aMagnitude <= self
	}

	<=> { :self :aMagnitude |
		(self = aMagnitude).if {
			0
		} {
			(self < aMagnitude).if {
				-1
			} {
				1
			}
		}
	}

	betweenAnd { :self :min :max |
		(min <= self).if {
			self <= max
		} {
			false
		}
	}

	clamp { :self :lowMagnitude :highMagnitude |
		self.min(highMagnitude).max(lowMagnitude)
	}

	clampLow { :self :lowMagnitude |
		self.max(lowMagnitude)
	}

	clampHigh { :self :highMagnitude |
		self.min(highMagnitude)
	}

	inRangeOfAnd { :self :first :second |
		(first < second).if {
			self.betweenAnd(first, second)
		} {
			self.betweenAnd(second, first)
		}
	}

	max { :self :aMagnitude |
		(self > aMagnitude).if {
			self
		} {
			aMagnitude
		}
	}

	min { :self :aMagnitude |
		(self < aMagnitude).if {
			self
		} {
			aMagnitude
		}
	}

	minMax { :self :aMin :aMax |
		self.min(aMin).max(aMax)
	}

}

@Number {

	// { :self :anObject |
		self.quotient(anObject)
	}

	\\ { :self :anObject |
		self.remainder(anObject)
	}

	% { :self :aNumber |
		self - (self // aNumber * aNumber)
	}

	~ { :self :aNumber |
		self.closeTo(aNumber)
	}

	!~ { :self :aNumber |
		self.closeTo(aNumber).not
	}

	<~ { :self :aNumber |
		(self < aNumber) | {
			self.closeTo(aNumber)
		}
	}

	>~ { :self :aNumber |
		(self > aNumber) | {
			self.closeTo(aNumber)
		}
	}

	abs { :self |
		(self < 0).if {
			self.negated
		} {
			self
		}
	}

	absSquared { :self |
		| abs = self.abs; |
		abs * abs
	}

	asNumber { :self |
		self
	}

	asStringWithCommas { :self |
		<primitive: return _self.toLocaleString('en-US');>
	}

	ceiling { :self |
		| truncation = self.truncated; |
		(self <= 0).if {
			truncation
		} {
			(self = truncation).if {
				truncation
			} {
				truncation + 1
			}
		}
	}


	clamp { :self :low :high |
		low.max(self.min(high))
	}

	copySignTo { :self :aNumber |
		(self.signBit = 0).if {
			aNumber.abs
		} {
			aNumber.abs.negated
		}
	}

	cubed { :self |
		self * self * self
	}

	degreeCos { :self |
		(90 - (180 + self % 360 - 180).abs).degreesToRadians.sin
	}

	degreeSin { :self |
		(90 - self).degreeCos
	}

	degreesToRadians { :self |
		self * 0.01745329251994329547 (* pi / 180 *)
	}

	downToDo { :self :end :aProcedure:/1 |
		| index = self; |
		{ index >= end }.whileTrue {
			aProcedure(index);
			index := index - 1
		}
	}

	floor { :self |
		| truncation = self.truncated; |
		(self >= 0).if {
			truncation
		} {
			(self = truncation).if {
				truncation
			} {
				truncation - 1
			}
		}
	}

	halved { :self |
		self / 2
	}

	isNumber { :self |
		true
	}

	log2 { :self |
		self.SmallFloat.log2
	}

	negated { :self |
		0 - self
	}

	negative { :self |
		self < 0
	}

	positive { :self |
		self >= 0
	}

	quotient { :self :aNumber |
		(aNumber = 0).if {
			'@Number>>quotient: divideByZero'.error
		} {
			(self / aNumber).truncated
		}
	}

	radiansToDegrees { :self |
		self * 57.29577951308232286465 (* 180 / pi *)
	}

	reciprocal { :self |
		1 / self
	}

	remainder { :self :aNumber |
		self - (self.quotient(aNumber) * aNumber)
	}

	roundDownTo { :self :aNumber |
		(self / aNumber).floor * aNumber
	}

	rounded { :self |
		(self + (self.sign / 2)).truncated
	}

	roundTo { :self :quantum |
		(self / quantum).rounded * quantum
	}

	roundUpTo { :self :aNumber |
		(self / aNumber).ceiling * aNumber
	}

	sign { :self |
		(self > 0).if {
			self.unit
		} {
			(self < 0).if {
				self.unit.negated
			} {
				self.zero
			}
		}
	}

	sign { :self :aNumber |
		aNumber.copySignTo(self)
	}

	signBit { :self |
		self.negative.if {
			1
		} {
			0
		}
	}

	squared { :self |
		self * self
	}

	strictlyPositive { :self |
		self > 0
	}

	toByDo { :self :stop :step :aBlock:/1 |
		(step = 0).if {
			'@Number>>toByDo: step must be non-zero'.error
		} {
			| nextValue = self; |
			(step < 0).if{
				{ stop <= nextValue }.whileTrue {
					aBlock(nextValue);
					nextValue := nextValue + step
				}
			} {
				{ stop >= nextValue }.whileTrue {
					aBlock(nextValue);
					nextValue := nextValue + step
				}
			}
		};
		self
	}

	toDo { :self :end :aProcedure:/1 |
		| index = self; |
		{ index <= end }.whileTrue {
			aProcedure(index);
			index := index + 1
		};
		self
	}

	truncateTo { :self :aNumber |
		self.quotient(aNumber) * aNumber
	}

	twice { :self |
		self * 2
	}

	unit { :self |
		1
	}

	upToDo { :self :end :aProcedure:/1 |
		(end < self).ifTrue {
			self.error('upToDo: not ascending')
		};
		self.toDo(end, aProcedure:/1)
	}

	zero { :self |
		0
	}

}

@Object {

	= { :self :anObject |
		self.typeResponsibility('@Object>>=')
	}

	~= { :self :anObject |
		not(self = anObject)
	}

	== { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	~~ { :self :anObject |
		<primitive: return _self !== _anObject;>
	}

	assert { :self :aBlock:/0 |
		aBlock().if {
			self
		} {
			self.error('Assertion failed')
		}
	}

	asString { :self |
		self.printString
	}

	caseError { :self |
		self.error('@Object>>caseError: case not found and no otherwise clause')
	}

	caseOf { :self :aBlockAssociationCollection |
		self.caseOfOtherwise(aBlockAssociationCollection) { :case |
			self.caseError
		}
	}

	caseOfOtherwise { :self :aBlockAssociationCollection :otherwise:/1 |
		valueWithReturn { :return:/1 |
			aBlockAssociationCollection.associationsDo { :assoc |
				(assoc.key.value = self).ifTrue {
					assoc.value.value.return
				}
			};
			otherwise:/1.cull(self)
		}
	}

	copy { :self |
		| answer = self.shallowCopy; |
		answer.postCopy;
		answer
	}

	deepCopy { :self |
		<primitive: return structuredClone(_self);>
	}

	equalSlots { :self :anObject |
		self.typeOf = anObject.typeOf & {
			self.slotArray = anObject.slotArray
		}
	}

	error { :self :message |
		(self.typeOf ++ ': ' ++ message ++ ': (' ++ self.printStringLimitedTo(16) ++ ')').error
	}

	identity { :self |
		self
	}

	in { :self :aBlock:/1 |
		aBlock(self)
	}

	inspectAsArray { :self :maxIndices |
		[
			['Type' -> self.Type],
			self.slotArray,
			self.pseudoSlotArray,
			self.isIndexable.if {
				self.indices.take(maxIndices).collect { :each |
					each.asString -> self[each]
				}
			} {
				[]
			}
		].concatenation
	}

	isByte { :self |
		false
	}

	isInteger { :self |
		false
	}

	isNumber { :self |
		false
	}

	perform { :self :aString |
		system.methodLookupAtType(aString, 1, self.typeOf).procedure . (self)
	}

	perform { :self :aString :aValue |
		system.methodLookupAtType(aString, 2, self.typeOf).procedure . (self, aValue)
	}

	postCopy { :self |
		self
	}

	printString { :self |
		self.storeString
	}

	printStringConcise { :self :count |
		| answer = self.printString; |
		(answer.size > count).if {
			'a ' ++ self.typeOf
		} {
			answer
		}
	}

	printStringLimitedTo { :self :count |
		| answer = self.printString; |
		(answer.size > count).if {
			answer.truncateTo(count - 8) ++ '... &etc'
		} {
			answer
		}
	}

	pseudoSlotArray { :self |
		self.pseudoSlotNameArray.collect { :each |
			each -> self.perform(each)
		}
	}

	pseudoSlotNameArray { :self |
		[]
	}

	shallowCopy { :self |
		<primitive: return Object.assign({}, _self);>
	}

	slotArray { :self |
		self.Type.slotNameArray.collect { :each |
			each -> self.perform(each)
		}
	}

	slotNameArray { :self |
		self.Type.slotNameArray
	}

	storeString { :self |
		'a ' ++ self.typeOf
	}

	then { :self :aProcedure:/1 |
		self.aProcedure
	}

	Type { :self |
		system.typeLookup(self.typeOf)
	}

	typeOf { :self |
		<primitive: return sl.typeOf(_self);>
	}

	value { :self |
		self
	}

	warning { :self :message |
		|(
			messageText = [
				'Warning: ',
				self.typeOf, ': ',
				message,
				': (' ++ self.printStringLimitedTo(16) ++ ')'
			].join
		)|
		system.transcript.addWarning(messageText)
	}

	yourself { :self |
		self
	}

}

+String {

	asInteger { :self |
		self.parseInteger(10)
	}

	asNumber { :self |
		self.includes(':'.Character).if {
			self.parseFraction
		} {
			self.parseNumber
		}
	}

	parseInteger { :self :radix |
		<primitive: return Number.parseInt(_self, _radix);>
	}

	parseNumber { :self |
		<primitive: return Number.parseFloat(_self);>
	}

}

+Void {

	e {
		1.exp
	}

	epsilon {
		<primitive: return Number.EPSILON;>
	}

}

+SmallFloat {

	LargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

@Iterable {

	allSatisfy { :self :aProcedure:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.aProcedure.ifFalse {
					false.return
				}
			};
			true
		}
	}

	anyOne { :self |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.return
			};
			self.error('@Iterable>>anyOne: empty iterable')
		}
	}

	anySatisfy { :self :aProcedure:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.aProcedure.ifTrue {
					true.return
				}
			};
			false
		}
	}

	count { :self :aProcedure:/1 |
		| answer = 0; |
		self.do { :each |
			aProcedure(each).ifTrue {
				answer := answer + 1
			}
		};
		answer
	}

	countAll { :self |
		self.count { :unusedItem |
			true
		}
	}

	detect { :self :aProcedure:/1 |
		self.detectIfNone(aProcedure:/1) {
			self.error('@Iterable>>detect: not found')
		}
	}

	detectIfFound { :self :aProcedure:/1 :foundProcedure:/1 |
		self.detectIfFoundIfNone(aProcedure:/1, foundProcedure:/1) {
			nil
		}
	}

	detectIfFoundIfNone { :self :aProcedure:/1 :foundProcedure:/1 :exceptionProcedure:/0 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				aProcedure(each).ifTrue {
					foundProcedure(each).return
				}
			};
			exceptionProcedure()
		}
	}

	detectIfNone { :self :aProcedure:/1 :whenAbsent:/0 |
		self.detectIfFoundIfNone(aProcedure:/1, identity:/1, whenAbsent:/0)
	}

	detectSum { :self :aBlock:/1 |
		| sum = 0; |
		self.do { :each |
			sum := aBlock(each) + sum
		};
		sum
	}

	detectMax { :self :aProcedure:/1 |
		| maxElement maxValue |
		self.do { :each |
			maxValue.ifNil {
				maxElement := each;
				maxValue := aProcedure(each)
			} {
				| nextValue = aProcedure(each); |
				(nextValue > maxValue).ifTrue {
					maxElement := each;
					maxValue := nextValue
				}
			}
		};
		maxElement
	}

	detectMin { :self :aProcedure:/1 |
		| minElement minValue |
		self.do { :each |
			minValue.ifNil {
				minElement := each;
				minValue := aProcedure(each)
			} {
				| nextValue = aProcedure(each); |
				(nextValue < minValue).ifTrue {
					minElement := each;
					minValue := nextValue
				}
			}
		};
		minElement
	}

	do { :self :aBlock:/1 |
		self.typeResponsibility('@Iterable>>do')
	}

	doSeparatedBy { :self :elementBlock:/1 :separatorBlock:/0 |
		| beforeFirst = true; |
		self.do { :each |
			beforeFirst.if {
				beforeFirst := false
			} {
				separatorBlock()
			};
			elementBlock(each)
		}
	}

	doWithout { :self :aBlock:/1 :anItem |
		self.do { :each |
			(anItem = each).ifFalse {
				aBlock(each)
			}
		}
	}

	includes { :self :anObject |
		self.anySatisfy { :each |
			each = anObject
		}
	}

	includesAnyOf { :self :aCollection |
		valueWithReturn { :return:/1 |
			aCollection.do { :elem |
				self.includes(elem).ifTrue {
					true.return
				}
			};
			false
		}
	}

	includesAllOf { :self :aCollection |
		valueWithReturn { :return:/1 |
			aCollection.do { :elem |
				self.includes(elem).ifFalse {
					false.return
				}
			};
			true
		}
	}

	injectInto { :self :initialValue :aProcedure:/2 |
		| nextValue = initialValue; |
		self.do { :each |
			nextValue := aProcedure(nextValue, each)
		};
		nextValue
	}

	max { :self |
		self.injectInto(self.anyOne) { :answer :each |
			answer.max(each)
		}
	}

	min { :self |
		self.injectInto(self.anyOne) { :answer :each |
			answer.min(each)
		}
	}

	minMax { :self |
		| min = self.anyOne, max = min; |
		self.do { :each |
			min := min.min(each);
			max := max.max(each)
		};
		[min, max]
	}

	noneSatisfy { :self :aProcedure:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.aProcedure.ifTrue {
					false.return
				}
			};
			true
		}
	}

	occurrencesOf { :self :anObject |
		| tally = 0; |
		self.do { :each |
			(anObject = each).ifTrue {
				tally := tally + 1
			}
		};
		tally
	}

	product { :self |
		self.reduce(times:/2)
	}

	range { :self |
		self.max - self.min
	}

	reduce { :self :aProcedure:/2 |
		| first = true, nextValue = nil; |
		self.do { :each |
			first.if {
				nextValue := each;
				first := false
			} {
				nextValue := aProcedure(nextValue, each)
			}
		};
		first.ifTrue {
			self.error('@Iterable>>reduce: empty collection')
		};
		nextValue
	}

	rejectThenDo { :self :rejectBlock:/1 :doBlock:/1 |
		self.do { :each |
			rejectBlock(each).ifFalse {
				doBlock(each)
			}
		}
	}

	selectThenDo { :self :selectBlock:/1 :doBlock:/1 |
		self.do { :each |
			selectBlock(each).ifTrue {
				doBlock(each)
			}
		}
	}

	size { :self |
		| tally = 0; |
		self.do { :each |
			tally := tally + 1
		};
		tally
	}

	sum { :self |
		self.reduce(plus:/2)
	}

}

Constant.pi = 3.1415926535897932384626433
Constant.e = 2.71828182845904523536028747135266249775724709369995
Constant.epsilon = 0.000000000000001
