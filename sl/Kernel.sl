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
		1.upTo(self).select { :each |
			self.remainder(each) = 0
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
		1.upToDo(self) { :index |
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

	pow { :self :anObject |
		self ** anObject
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
		self.upToDo(end, aProcedure:/1)
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
		| index = self; |
		{ index <= end }.whileTrue {
			aProcedure(index);
			index := index + 1
		};
		self
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

	asString { :self |
		self.printString
	}

	caseOf { :self :aBlockAssociationCollection |
		self.caseOfOtherwise(aBlockAssociationCollection) { :case |
			('@Object>>caseOf: case not found: ' ++ case).error
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
		system.transcript.warn(messageText)
	}

	yourself { :self |
		self
	}

}

Boolean : [Object, Json] {

	= { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	& { :self :aProcedure:/0 |
		<primitive: return _self && _aProcedure_0();>
	}

	| { :self :aProcedure:/0 |
		<primitive: return _self || _aProcedure_0();>
	}

	&& { :self :anObject |
		self & { anObject.value }
	}

	|| { :self :anObject |
		self | { anObject.value }
	}

	always { :self :aProcedure:/0 |
		aProcedure()
	}

	asBit { :self |
		self.if { 1 } { 0 }
	}

	asInteger { :self |
		self.asBit
	}

	asNumber { :self |
		self.asBit
	}

	if { :self :whenTrue:/0 :whenFalse:/0 |
		<primitive: return _self ? _whenTrue_0() : _whenFalse_0();>
	}

	ifFalse { :self :whenFalse:/0 |
		self.not.ifTrue(whenFalse:/0)
	}

	ifTrue { :self :whenTrue:/0 |
		self.if(
			whenTrue:/0
		) {
			nil
		}
	}

	not { :self |
		<primitive: return _self ? false : true;>
	}

	shallowCopy { :self |
		self
	}

	storeString { :self |
		self.if {
			'true'
		} {
			'false'
		}
	}

	xor { :self :aBoolean |
		aBoolean.value.if { self = false } { self = true }
	}

}

Character : [Object, Magnitude] { | string codePoint |

	= { :self :anObject |
		anObject.isCharacter & {
			self.string = anObject.string
		}
	}

	< { :self :anObject |
		anObject.isCharacter & {
			self.codePoint < anObject.codePoint
		}
	}

	asciiValue { :self |
		(self.codePoint > 127).if {
			self.error('asciiValue: not ascii')
		} {
			self.codePoint
		}
	}

	asInteger { :self |
		self.codePoint
	}

	asLowercase { :self |
		self.string.asLowercase.Character
	}

	asUppercase { :self |
		self.string.asUppercase.Character
	}

	asString { :self |
		self.string
	}

	Character { :self |
		self
	}

	digitValue { :self |
		|(
			integerValue = self.asInteger,
			digitValues = system.cache.atIfAbsentPut('digitValues') {
				| answer = Array(256, -1); |
				0.toDo(9) { :i |
					answer[48 + i + 1] := i
				};
				10.toDo(35) { :i |
					answer[55 + i + 1] := i;
					answer[87 + i + 1] := i
				};
				answer
			}
		)|
		digitValues[integerValue + 1]
	}

	isAscii { :self |
		self.codePoint < 128
	}

	printString { :self |
		'$' ++ self.string
	}

	sameAs { :self :aCharacter |
		(self == aCharacter).if {
			true
		} {
			self.asLowercase == aCharacter.asLowercase
		}
	}

	storeString { :self |
		'Character(' ++ self.codePoint ++ ')'
	}

}

+SmallFloat {

	Character { :self |
		<primitive: return _Character_2(String.fromCodePoint(_self), _self);>
	}

	digitValue { :self |
		self.betweenAnd(0, 35).if {
			Character(self + (self < 10).if { 48 } { 55 })
		} {
			self.error('digitValue')
		}
	}

}

+String {

	Character { :self |
		self.Character(self.codePoint)
	}


	Character { :self :codePoint |
		self.isSingleCharacter.if {
			system.cache.atIfAbsentPut('characterDictionary') {
				()
			}.atIfAbsentPut(self) {
				newCharacter().initializeSlots(self, codePoint)
			}
		} {
			self.error('Character: not character')
		}
	}

	Array { :self |
		self.characterArray
	}

}

Complex : [Object] { | real imaginary |

	* { :self :anObject |
		anObject.isComplex.if {
			|(
				a = self.real,
				b = self.imaginary,
				c = anObject.real,
				d = anObject.imaginary
			)|
			Complex((a * c) - (b * d), (a * d) + (b * c))
		} {
			anObject.adaptToComplexAndApply(self, times:/2)
		}
	}


	+ { :self :anObject |
		anObject.isComplex.if {
			|(
				a = self.real,
				b = self.imaginary,
				c = anObject.real,
				d = anObject.imaginary
			)|
			Complex(a + c, b + d)
		} {
			anObject.adaptToComplexAndApply(self, plus:/2)
		}
	}

	- { :self :anObject |
		anObject.isComplex.if {
			|(
				a = self.real,
				b = self.imaginary,
				c = anObject.real,
				d = anObject.imaginary
			)|
			Complex(a - c, b - d)
		} {
			anObject.adaptToComplexAndApply(self, minus:/2)
		}
	}

	/ { :self :anObject |
		anObject.isComplex.if {
			|(
				a = self.real,
				b = self.imaginary,
				c = anObject.real,
				d = anObject.imaginary
			)|
			Complex(
				((a * c) + (b * d)) / ((c * c) + (d * d)),
				((b * c) - (a * d)) / ((c * c) + (d * d))
			)
		} {
			anObject.adaptToComplexAndApply(self, diviedBy:/2)
		}
	}

	= { :self :anObject |
		anObject.isNumber.if {
			anObject.isComplex.if {
				(self.real = anObject.real) & {
					self.imaginary = anObject.imaginary
				}
			} {
				anObject.adaptToComplexAndApply(self, equals:/2)
			}
		} {
			false
		}
	}

	abs { :self |
		((self.real * self.real) + (self.imaginary * self.imaginary)).sqrt
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aCollection.collect { :element |
			aProcedure(element, self)
		}
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber.asComplex, self)
	}

	arg { :self |
		self.isZero.if {
			self.error('Zero has no argument')
		} {
			self.imaginary.arcTan(self.real)
		}
	}

	asComplex { :self |
		self
	}

	closeTo { :self :anObject |
		anObject.isNumber.if {
			anObject.isComplex.if {
				(self.real.closeTo(anObject.real)) & {
					self.imaginary.closeTo(anObject.imaginary)
				}
			} {
				anObject.adaptToComplexAndApply(self, closeTo:/2)
			}
		} {
			false
		}
	}

	conjugated { :self |
		Complex(self.real, self.imaginary.negated)
	}

	cos { :self |
		self.i.cosh
	}

	cosh { :self |
		Complex(
			self.real.cosh * self.imaginary.cos,
			self.real.sinh * self.imaginary.sin
		)
	}

	exp { :self |
		self.real.exp * (self.imaginary.cos + self.imaginary.sin.i)
	}

	i { :self |
		Complex(self.imaginary.negated, self.real)
	}

	isComplex { :self |
		true
	}

	isNumber { :self |
		true
	}

	isZero { :self |
		self.real.isZero & {
			self.imaginary.isZero
		}
	}

	ln { :self |
		self.abs.ln + self.arg.i
	}

	log { :self :aNumber |
		self.ln / aNumber.ln
	}

	negated { :self |
		Complex(self.real.negated, self.imaginary.negated)
	}

	printString { :self |
		(self.imaginary < 0).if {
			[self.real, ' - ', self.imaginary.abs, '.i'].join
		} {
			[self.real, ' + ', self.imaginary, '.i'].join
		}
	}

	reciprocal { :self |
		(self = 0).if {
			self.error('reciprocal: zero divide')
		} {
			1 / self
		}
	}

	sin { :self |
		self.i.sinh.i.negated
	}

	sinh { :self |
		Complex(
			self.real.sinh * self.imaginary.cos,
			self.real.cosh * self.imaginary.sin
		)
	}

	sqrt { :self |
		(imaginary = 0 & {
			real >= 0
		}).if {
			Complex(self.real.sqrt, 0)
		} {
			|(
				v = (self.abs - self.real / 2).sqrt,
				u = self.imaginary / 2 / v
			)|
			Compex(u, v)
		}
	}

	squared { :self |
		self * self
	}

	squaredNorm { :self |
		(self.real * self.real) + (self.imaginary * self.imaginary)
	}

	tan { :self |
		self.sin / self.cos
	}

	tanh { :self |
		self.i.tan.i.negated
	}

	storeString { :self |
		[
			'Complex(',
			self.real.storeString,
			', ',
			self.imaginary.storeString,
			')'
		].join
	}
}

+SmallFloat {

	adaptToComplexAndApply { :self :aComplexNumber :aProcedure:/2 |
		aProcedure(aComplexNumber, self.asComplex)
	}

	asComplex { :self |
		Complex(self, 0)
	}

	Complex { :self :imaginary |
		newComplex().initializeSlots(self, imaginary)
	}

	i { :self |
		Complex(0, self)
	}

}

+Array {

	adaptToComplexAndApply { :self :aComplexNumber :aProcedure:/2 |
		self.collect { :each |
			aProcedure(aComplexNumber, each)
		}
	}

}

Error : [Object] {

	description { :self |
		self.name ++ ': ' ++ self.messageText
	}

	log { :self |
		system.transcript.error(self.messageText)
	}

	messageText { :self |
		<primitive: return _self.message;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	shallowCopy { :self |
		self.error('copy: cannot copy')
	}

	signal { :self |
		<primitive: throw(_self);>
	}

	storeString { :self |
		'Error(\'' ++ self.messageText ++ '\')'
	}

}

+@Object {

	shouldNotImplement { :self :signature |
		self.error(signature ++ ': should not implement')
	}

	typeResponsibility { :self :signature |
		self.error(signature ++ ': type responsibility')
	}

}

+String {

	Error { :self |
		<primitive: return Error(_self);>
	}

	error { :self |
		| err = Error(self); |
		err.log;
		err.signal
	}

}

+Void {

	Error {
		Error('Unknown error')
	}

}

Fraction : [Object, Magnitude, Number] { | numerator denominator |

	* { :self :aNumber |
		aNumber.isFraction.if {
			|(
				d1 = self.numerator.gcd(aNumber.denominator),
				d2 = self.denominator.gcd(aNumber.numerator)
			)|
			(d2 = self.denominator & {
				d1 = aNumber.denominator
			}).if {
				(self.numerator // d1) * (aNumber.numerator // d2)
			} {
				Fraction(
					(self.numerator // d1) * (aNumber.numerator // d2),
					(self.denominator // d2) * (aNumber.denominator // d1)
				).normalized
			}
		} {
			aNumber.adaptToFractionAndApply(self, times:/2)
		}
	}

	+ { :self :aNumber |
		aNumber.isInteger.if {
			Fraction(self.numerator + (self.denominator * aNumber), self.denominator)
		} {
			aNumber.isFraction.if {
				|(
					d = self.denominator.gcd(aNumber.denominator),
					d1 = aNumber.denominator // d,
					d2 = self.denominator // d,
					n = (self.numerator * d1) + (aNumber.numerator * d2)
				)|
				d1 := d1 * d2;
				d2 := n.gcd(d);
				n := n // d2;
				d := d1 * (d // d2);
				(d = 1).if {
					n
				} {
					Fraction(n, d)
				}
			} {
				aNumber.adaptToFractionAndApply(self, plus:/2)
			}
		}
	}

	- { :self :aNumber |
		aNumber.isInteger.if {
			Fraction(self.numerator - (self.denominator * aNumber), self.denominator)
		} {
			aNumber.isFraction.if {
				self + aNumber.negated
			} {
				aNumber.adaptToFractionAndApply(self, minus:/2)
			}
		}
	}

	/ { :self :aNumber |
		aNumber.isInteger.if {
			self * Fraction(1, aNumber)
		} {
			aNumber.isFraction.if {
				self * aNumber.reciprocal
			} {
				aNumber.adaptToFractionAndApply(self, dividedBy:/2)
			}
		}
	}

	** { :self :anInteger |
		anInteger.isInteger.if {
			self.raisedToInteger(anInteger)
		} {
			self.error('** not an integer')
		}
	}

	= { :self :aFraction |
		aFraction.isFraction & {
			self.numerator = aFraction.numerator & {
				self.denominator = aFraction.denominator
			}
		}
	}

	< { :self :aNumber |
		aNumber.isFraction.if {
			(self.numerator * aNumber.denominator) < (aNumber.numerator * self.denominator)
		} {
			aNumber.adaptToFractionAndApply(self, lessThan:/2)
		}
	}

	<= { :self :aNumber |
		aNumber.isFraction.if {
			(self.numerator * aNumber.denominator) <= (aNumber.numerator * self.denominator)
		} {
			aNumber.adaptToFractionAndApply(self, lessThanEquals:/2)
		}
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aCollection.collect { :each |
			aProcedure(each, self)
		}
	}

	adaptToIntegerAndApply { :self :anInteger :aProcedure:/2 |
		Fraction(anInteger, 1).aProcedure(self)
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aNumber.isInteger.if {
			Fraction(aNumber, 1).aProcedure(self)
		} {
			aNumber.aProcedure(self.SmallFloat)
		}
	}

	asFraction { :self |
		self
	}

	gcd { :self :aFraction |
		| d = self.denominator.gcd(aFraction.denominator); |
		Fraction(
			(self.numerator * (aFraction.denominator // d)).gcd(aFraction.numerator * (self.denominator // d)),
			(self.denominator // d * aFraction.denominator)
		)
	}

	lcm { :self :n |
		self // self.gcd(n) * n
	}

	limitDenominator { :self :maxDenominator |
		(maxDenominator < 1).if {
			self.error('limitDenominator: illegal maxDenominator')
		} {
			(self.denominator <= maxDenominator).if {
				self
			} {
				|(
					p0 = 0, q0 = 1, p1 = 1, q1 = 0,
					n = self.numerator, d = self.denominator,
					continue = true,
					k = nil, bound1 = nil, bound2 = nil
				)|
				{ continue }.whileTrue {
					|(
						a = n // d,
						q2 = q0 + (a * q1)
					)|
					(q2 > maxDenominator).if {
						continue := false
					} {
						[p0, q0, p1, q1, n, d] := [p1, q1, p0 + (a * p1), q2, d, n - (a * d)]
					}
				};
				k := (maxDenominator - q0) // q1;
				bound1 := Fraction(p0 + (k * p1), q0 + (k * q1));
				bound2 := Fraction(p1, q1);
				((bound2 - self).abs <= (bound1 - self).abs).if {
					bound2
				} {
					bound1
				}
			}
		}
	}

	negated { :self |
		Fraction(self.numerator.negated, self.denominator)
	}

	negative { :self |
		self.numerator.negative
	}

	normalize { :self |
		self.copy.normalized
	}

	normalized { :self |
		(self.denominator = 0).if {
			self.error('normalized: zeroDenominatorError')
		} {
			|(
				x = self.numerator * self.denominator.sign,
				y = self.denominator.abs,
				d = x.gcd(y)
			)|
			self.numerator := x // d;
			self.denominator := y // d;
			self
		}
	}

	printString { :self |
		[self.numerator, ':', self.denominator].join
	}

	raisedToInteger { :self :anInteger |
		(anInteger = 0).if {
			1
		} {
			(anInteger < 0).if {
				self.reciprocal.raisedToInteger(anInteger.negated)
			} {
				Fraction(
					self.numerator.raisedToInteger(anInteger),
					self.denominator.raisedToInteger(anInteger)
				)
			}
		}
	}

	reciprocal { :self |
		(self.numerator.abs = 1).if {
			self.denominator * self.numerator
		} {
			Fraction(self.denominator, self.numerator).normalized
		}
	}

	reduce { :self |
		self.copy.reduced
	}

	reduced { :self |
		(self.denominator = 0).if {
			self.error('reduced: zeroDenominatorError')
		} {
			|(
				x = self.numerator * self.denominator.sign,
				y = self.denominator.abs,
				d = x.gcd(y)
			)|
			self.numerator := x // d;
			self.denominator := y // d;
			(self.denominator = 1).if {
				self.numerator
			} {
				self
			}
		}
	}

	SmallFloat { :self |
		self.numerator / self.denominator
	}

	storeString { :self |
		[
			'Fraction(',
			self.numerator.storeString,
			', ',
			self.denominator.storeString,
			')'
		].join
	}

	truncated { :self |
		self.numerator.quotient(self.denominator)
	}

	unicode { :self |
		system.unicodeFractionsTable.indexOf(self)
	}

}

+@Integral {

	Fraction { :self :denominator |
		(denominator = 0).if {
			self.error('@Integral>>Fraction: zeroDenominatorError')
		} {
			newFraction().initializeSlots(self, denominator)
		}
	}

}

+SmallFloat {

	asFraction { :self |
		self.asFraction(100)
	}

	asFraction { :self :maxDenominator |
		self.isInteger.if {
			self
		} {
			| k = 10 ** (maxDenominator.log10.ceiling + 1); |
			Fraction((self * k).rounded, k).reduced.limitDenominator(maxDenominator)
		}
	}

}

+String {

	parseFraction { :self :separator |
		self.includesSubstring(separator).if {
			| parts = self.splitBy(separator); |
			(parts.size = 2).if {
				Fraction(parts[1].parseInteger(10), parts[2].parseInteger(10))
			} {
				self.error('parseFraction: parse failed')
			}
		} {
			Fraction(self.parseInteger(10), 1)
		}
	}

	parseFraction { :self |
		self.parseFraction(':')
	}

}

LargeInteger : [Object, Binary, Magnitude, Number, Integral] {

	== { :self :anInteger |
		<primitive: return _self === _anInteger;>
	}

	= { :self :anInteger |
		<primitive: return _self === BigInt(_anInteger);>
	}

	< { :self :anInteger |
		<primitive: return _self < BigInt(_anInteger);>
	}

	<= { :self :anInteger |
		<primitive: return _self <= BigInt(_anInteger);>
	}

	+ { :self :anInteger |
		<primitive: return _self + BigInt(_anInteger);>
	}

	- { :self :anInteger |
		<primitive: return _self - BigInt(_anInteger);>
	}

	* { :self :anInteger |
		<primitive: return _self * BigInt(_anInteger);>
	}

	/ { :self :anInteger |
		Fraction(self, anInteger.LargeInteger).reduced
	}

	// { :self :anInteger |
		<primitive: return _self / BigInt(_anInteger);>
	}

	% { :self :anInteger |
		<primitive:
		var i = BigInt(_anInteger);
		return ((_self % i) + i) % i;
		>
	}

	** { :self :anInteger |
		<primitive: return _self ** BigInt(_anInteger);>
	}

	<< { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self << _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self << BigInt(_anObject);
		}
		>
		self.error('shiftLeft: operand not a LargeInteger or SmallFloat')
	}

	>> { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return sl.shiftRight(_self, _anObject);
		} else if(sl.isSmallFloat(_anObject)) {
			return sl.shiftRight(_self, BigInt(_anObject));
		}
		>
		self.error('shiftRight: operand not a LargeInteger or SmallFloat')
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber.LargeInteger, self)
	}

	bitAnd { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self & _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self & BigInt(_anObject);
		}
		>
		self.error('bitAnd: operand not a LargeInteger or SmallFloat')
	}

	bitOr { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self | _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self | BigInt(_anObject);
		}
		>
		self.error('bitOr: operand not a LargeInteger or SmallFloat')
	}

	bitXor { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self ^ _anObject;
		} else if(sl.isSmallFloat(_anObject)) {
			return _self ^ BigInt(_anObject);
		}
		>
		self.error('bitXor: operand not a LargeInteger or SmallFloat')
	}

	even { :self |
		(self % 2) = 0
	}

	isInteger { :self |
		true
	}

	LargeInteger { :self |
		self
	}

	odd { :self |
		(self % 2) = 1
	}

	printString { :self |
		<primitive: return _self.toString();>
	}

	storeString { :self |
		self.printString ++ 'n'
	}

	remainder { :self :anInteger |
		<primitive: return _self % BigInt(_anInteger);>
	}

	shallowCopy { :self |
		self
	}

	SmallFloat { :self |
		<primitive: return Number(_self);>
	}

	sqrt { :self |
		<primitive: return sl.bigIntSqrt(_self);>
	}

	toNumber { :self :precision |
		<primitive: BigInt.asIntN(_precision, _self);>
	}

	unit { :self |
		1n
	}

	zero { :self |
		0n
	}

}

+String {

	parseLargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

SmallFloat : [Object, Json, Magnitude, Number, Integral, Binary] {

	= { :self :aNumber |
		<primitive: return _self === _aNumber;>
	}

	< { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self < _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, lessThan:/2)
	}

	<= { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self <= _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, lessThanEquals:/2)
	}

	+ { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self + _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, plus:/2)
	}

	- { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self - _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, minus:/2)
	}

	* { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self * _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, times:/2)
	}

	/ { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self / _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, dividedBy:/2)
	}

	% { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return ((_self % _anObject) + _anObject) % _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, modulo:/2)
	}

	** { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.pow(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, timesTimes:/2)
	}

	<< { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self << _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, lessThanLessThan:/2)
	}

	>> { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return sl.shiftRight(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, greaterThanGreaterThan:/2)
	}


	abs { :self |
		<primitive: return Math.abs(_self)>
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aCollection.collect { :each |
			aProcedure(each, self)
		}
	}

	adaptToFractionAndApply { :self :aFraction :aProcedure:/2 |
		aFraction.SmallFloat.aProcedure(self)
	}

	arcCos { :self |
		<primitive: return Math.acos(_self)>
	}

	arcSin { :self |
		<primitive: return Math.asin(_self)>
	}

	arcTan { :self |
		<primitive: return Math.atan(_self)>
	}

	arcTan { :self :anObject |
		self.atan2(anObject)
	}

	assertIsSmallInteger { :self |
		self.assert { self.isSmallInteger }
	}

	asInteger { :self |
		self.truncated
	}

	atan2 { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return Math.atan2(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, atan2:/2)
	}

	bitAnd { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self & _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, bitAnd:/2)
	}

	bitNot { :self |
		<primitive:
		if(sl.isBitwise(_self)) {
			return ~_self;
		}
		>
		anObject.adaptToNumberAndApply(self, bitNot:/1)
	}

	bitOr { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self | _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, bitOr:/2)
	}

	bitTest { :self :anInteger |
		self.bitAnd(1 << (anInteger - 1)) ~= 0
	}

	bitXor { :self :anObject |
		<primitive:
		if(sl.isBitwise(_self) && sl.isBitwise(_anObject)) {
			return _self ^ _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, bitXor:/2)
	}

	byteHexString { :self |
		self.isByte.if {
			| hexString = self.printString(16); |
			(self < 16).if {
				'0' ++ hexString
			} {
				hexString
			}
		} {
			self.error('byteHexString: not a byte')
		}
	}

	closeToBy { :self :aNumber :epsilon |
		aNumber.isNumber.not.if {
			{ self = aNumber }.ifError { false }
		} {
			(self = 0).if {
				aNumber.abs < epsilon
			} {
				(aNumber = 0).if {
					self.abs < epsilon
				} {
					(self = aNumber.SmallFloat) | {
						| z = self.abs; |
						(z < epsilon).if {
							aNumber.abs < epsilon
						} {
							(self - aNumber).abs / (z.max(aNumber.abs)) < epsilon
						}
					}
				}
			}
		}
	}

	closeTo { :self :aNumber |
		self.closeToBy(aNumber, 0.0001)
	}

	cos { :self |
		<primitive: return Math.cos(_self);>
	}

	cosh { :self |
		<primitive: return Math.cosh(_self);>
	}

	cubeRoot { :self |
		<primitive: return Math.cbrt(_self);>
	}

	even { :self |
		<primitive: return _self % 2 === 0;>
	}

	exp { :self |
		<primitive: return Math.exp(_self)>
	}

	floor { :self |
		<primitive: return Math.floor(_self)>
	}

	fractionPart { :self |
		<primitive: return _self % 1;>
	}

	isBinary { :self |
		<primitive: return sl.isBitwise(_self);>
	}

	isFinite { :self |
		<primitive: return Number.isFinite(_self);>
	}

	isFraction { :self |
		self.isInteger
	}

	isInteger { :self |
		<primitive: return Number.isInteger(_self);>
	}

	isNaN { :self |
		<primitive: return Number.isNaN(_self);>
	}

	isSmallInteger { :self |
		<primitive: return Number.isSafeInteger(_self);>
	}

	isZero { :self |
		self = 0
	}

	LargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

	log { :self |
		<primitive: return Math.log(_self)>
	}

	log2 { :self |
		<primitive: return Math.log2(_self)>
	}

	log10 { :self |
		<primitive: return Math.log10(_self)>
	}

	min { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return Math.min(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, min:/2)
	}

	max { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return Math.max(_self, _anObject);
		}
		>
		anObject.adaptToNumberAndApply(self, max:/2)
	}

	Number { :self |
		self
	}

	odd { :self |
		<primitive: return Math.abs(_self % 2) === 1;>
	}

	printString { :self :radix |
		<primitive:
		if(Number.isFinite(_self)) {
			return _self.toString(_radix);
		}
		>
		self.positive.if {
			'inf'
		} {
			'(0 - inf)'
		}
	}

	raisedToInteger { :self :anInteger |
		self ** anInteger
	}

	randomFloat { :self |
		self * system.randomFloat
	}

	randomFloat { :self :aNumber |
		self + (aNumber - self).randomFloat
	}

	randomInteger { :self |
		1.randomFloat(self + 1).floor
	}

	randomInteger { :self :aNumber |
		self.randomFloat(aNumber + 1).floor
	}

	reduce { :self |
		self.closeTo(self.rounded).if {
			self.rounded
		} {
			self
		}
	}

	remainder { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self % _anObject;
		}
		>
		self.error('remainder')
	}

	rounded { :self |
		<primitive: return Math.round(_self)>
	}

	shallowCopy { :self |
		self
	}

	sign { :self |
		<primitive: return Math.sign(_self);>
	}

	sin { :self |
		<primitive: return Math.sin(_self)>
	}

	sinh { :self |
		<primitive: return Math.sinh(_self)>
	}

	SmallFloat { :self |
		self
	}

	sqrt { :self |
		<primitive: return Math.sqrt(_self)>
	}

	storeString { :self |
		self.printString(10)
	}

	tan { :self |
		<primitive: return Math.tan(_self)>
	}

	tanh { :self |
		<primitive: return Math.tanh(_self)>
	}

	truncated { :self |
		<primitive: return Math.trunc(_self)>
	}

	veryCloseTo { :self :aNumber |
		self.closeToBy(aNumber, 0.000000000001)
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

Procedure : [Object] {

	= { :self :anObject |
		self == anObject
	}

	apply { :self :anArray |
		<primitive:
		if(sl.isArray(_anArray) && (_self.length === _anArray.length)) {
			return _self(... _anArray);
		}
		>
		self.error('apply: argument is not array or not of required size')
	}

	assert { :self |
		self.assert(self);
		nil
	}

	cull { :self :firstArg |
		(self.numArgs >= 1).if {
			self.value(firstArg)
		} {
			self.value
		}
	}

	cull { :self :firstArg :secondArg |
		(self.numArgs >= 2).if {
			self.value(firstArg, secondArg)
		} {
			(self.numArgs = 1).if {
				self.value(firstArg)
			} {
				self.value
			}
		}
	}

	ensure { :self :aBlock:/0 |
		<primitive:
		var returnValue;
		try {
			returnValue = _self();
		} finally {
			_aBlock_0();
		};
		return returnValue;
		>
	}

	ifError { :self :errorHandlerBlock |
		<primitive:
		try {
			return _self();
		} catch (caughtValue) {
			if(caughtValue instanceof Error) {
				return _cull_2(_errorHandlerBlock, caughtValue)
			} {
				throw caughtValue;
			}
		}
		>
	}

	methodName { :self |
		<primitive: return _self.name.split(':')[0];>
	}

	millisecondsToRun { :self:/0 |
		system.millisecondsToRun(self:/0)
	}

	new { :self |
		self.cull(0)
	}

	new { :self :aNumber |
		self.cull(aNumber)
	}

	newFrom { :self:/1 :anObject |
		self(anObject)
	}

	numArgsIfAbsent { :self :ifAbsent:/0 |
		(*
			Js doesn't have a proper numArgs mechanism.
			In the simple arity model Spl adds hasRestParameters to the arity dispatch method functions, else it is undefined.
			From within Spl there is no concept of a variadic procedure.
		*)
		<primitive: return _self.hasRestParameters ? _ifAbsent() : _self.length;>
	}

	numArgsOrNil { :self |
		self.numArgsIfAbsent {
			nil
		}
	}

	numArgs { :self |
		self.numArgsIfAbsent {
			self.error('numArgs: applied to arity-dispatch procedure')
		}
	}

	name { :self |
		<primitive: return _self.name;>
	}

	repeat { :self:/0 |
		{
			self();
			true
		}.whileTrue
	}

	value { :self:/0 |
		self()
	}

	value { :self:/1 :p1 |
		self(p1)
	}

	value { :self:/2 :p1 :p2 |
		self(p1, p2)
	}

	value { :self:/3 :p1 :p2 :p3 |
		self(p1, p2, p3)
	}

	value { :self:/4 :p1 :p2 :p3 :p4 |
		self(p1, p2, p3, p4)
	}

	value { :self:/5 :p1 :p2 :p3 :p4 :p5 |
		self(p1, p2, p3, p4, p5)
	}

	valueWithArguments { :self :argumentsArray |
		<primitive: _self.apply(null, _argumentsArray)>
	}

	valueWithReturn { :self:/1 |
		<primitive:
		const returnBlock = function(returnValue) {
			throw returnValue;
		};
		try {
			return _self_1(returnBlock);
		} catch (returnedValue) {
			if(returnedValue instanceof Error) {
				throw returnedValue;
			} {
				return returnedValue;
			}
		}
		>
	}

	whileFalse { :self:/0 |
		{ self() }.whileFalse { }
	}

	whileFalse { :self:/0 :aProcedure:/0 |
		<primitive:
		while(!_self_0()) {
			_aProcedure_0();
		};
		return null;
		>
	}

	whileTrue { :self:/0 |
		{ self() }.whileTrue { }
	}

	whileTrue { :self:/0 :aProcedure:/0 |
		<primitive:
		while(_self_0()) {
			_aProcedure_0();
		};
		return null;
		>
	}

}

+@Object {

	assert { :self :aBlock:/0 |
		aBlock().if {
			self
		} {
			self.error('Assertion failed')
		}
	}

}

+SmallFloat {

	LargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

}

Promise : [Object] {

	catch { :self :aProcedure |
		<primitive: return _self.catch(_aProcedure);>
	}

	finally { :self :aProcedure |
		<primitive: return _self.finally(_aProcedure);>
	}

	resolvedPromise { :self |
		<primitive: return Promise.resolve(_self);>
	}

	then { :self :aProcedure |
		<primitive: return _self.then(_aProcedure);>
	}

	thenElse { :self :onResolve :onReject |
		<primitive: return _self.then(_onResolve, _onReject);>
	}

}

+Procedure {

	Promise { :self:/2 |
		<primitive: return new Promise(_self_2);>
	}

}

+Array {

	allResolved { :self |
		<primitive: return Promise.all(_self);>
	}

	allSettled { :self |
		<primitive: return Promise.allSettled(_self);>
	}

	anyResolved { :self |
		<primitive: return Promise.any(_self);>
	}

	anySettled { :self |
		<primitive: return Promise.race(_self);>
	}

	Promise { :self |
		self.allResolved
	}

}

+Error {

	Promise { :self |
		<primitive: return Promise.reject(_self);>
	}

}

+@Object {

	resolvedPromise { :self |
		<primitive: return Promise.resolve(_self);>
	}

}

RegExp : [Object] {

	asRegExp { :self |
		self
	}

	exec { :self :aString |
		<primitive: return _self.exec(_aString);>
	}

	flags { :self |
		<primitive: return _self.flags;>
	}

	source { :self |
		<primitive: return _self.source;>
	}

	storeString { :self |
		<primitive: return `RegExp('${_self.source}', '${_self.flags}')`;>
	}

	stringLiteral { :self |
		<primitive: return _self.toString();>
	}

	test { :self :aString |
		<primitive: return _self.test(_aString);>
	}

}

+String {

	allRegExpMatches { :self :aRegExp |
		<primitive: return _self.match(_aRegExp);>
	}

	asRegExp { :self |
		RegExp(self)
	}

	matchesRegExp { :self :aRegExp |
		aRegExp.asRegExp.test(self)
	}

	splitRegExp { :self :aRegExp |
		<primitive: return _self.split(_aRegExp);>
	}

	RegExp { :self :flags |
		<primitive: return new RegExp(_self, _flags);>
	}

	RegExp { :self |
		<primitive: return new RegExp(_self);>
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

String : [Object, Json, Iterable] {

	= { :self :anObject |
		self == anObject
	}

	< { :self :anObject |
		<primitive: return _self < _anObject;>
	}

	<= { :self :anObject |
		<primitive: return _self <= _anObject;>
	}

	> { :self :anObject |
		<primitive: return _anObject < _self;>
	}

	>= { :self :anObject |
		<primitive: return _anObject <= _self;>
	}

	++ { :self :anObject |
		self.appendString(anObject.asString)
	}

	appendString { :self :aString |
		<primitive: return _self + _aString;>
	}

	asAscii { :self |
		self.characterArray.select(isAscii:/1).joinCharacters
	}

	asciiByteArray { :self |
		| answer = self.utf8ByteArray; |
		answer.allSatisfy(isAsciiCodePoint:/1).if {
			answer
		} {
			self.error('asciiByteArray: non-ascii character')
		}
	}

	asciiValue { :self |
		(self.size = 1).if {
			self.asciiByteArray.first
		} {
			self.error('asciiValue: not single character')
		}
	}

	asHex { :self |
		self.asciiByteArray.hex
	}

	asLowercase { :self |
		<primitive: return _self.toLowerCase(); >
	}

	asString { :self |
		self
	}

	asUppercase { :self |
		<primitive: return _self.toUpperCase(); >
	}

	at { :self :index |
		(* Note: index is in Utf-16 code units, not characters *)
		| codePoint = self.codePointAt(index); |
		codePoint.ifNil {
			self.error('at: invalid index')
		} {
			codePoint.isUtf16SurrogateCode.if {
				self.error('at: code point is lone surrogate')
			} {
				codePoint.Character
			}
		}
	}

	basicAt { :self :index |
		self.codePointAt(index).Character
	}

	beginsWith { :self :aString |
		<primitive:
		if(typeof _aString == 'string') {
			return _self.startsWith(_aString);
		}
		>
		self.error('beginsWith: non string operand')
	}

	capitalized { :self |
		<primitive: return _self[0].toUpperCase() + _self.slice(1);>
	}

	characterArray { :self |
		self.collectInto(identity:/1, [])
	}

	codePoint { :self |
		self.isSingleCharacter.if {
			self.codePointAt(1)
		} {
			self.error('codePoint: not single character string')
		}
	}

	codePointAt { :self :index |
		<primitive: return _self.codePointAt(_index - 1);>
	}

	codePointArray { :self |
		self.collectInto(codePoint:/1, [])
	}

	collectInto { :self :aBlock:/1 :aCollection |
		self.primitiveCollectInto({ :each |
			aBlock(each.Character)
		}, [])
	}

	contractTo { :self :smallSize |
		(self.size <= smallSize).if {
			self
		} {
			(smallSize < 5).if {
				self.copyFromTo(1, smallSize)
			} {
				| leftSize = smallSize - 2 // 2; |
				self.copyReplaceFromToWith(
					leftSize + 1,
					self.size - (smallSize - leftSize - 3),
					'...'
				)
			}
		}
	}

	copyFromTo { :self :start :end |
		<primitive: return _self.substring(_start - 1, _end);>
	}

	copyReplaceFromToWith { :self :start :stop :replacement |
		[
			self.copyFromTo(1, start - 1),
			replacement,
			self.copyFromTo(stop + 1, self.size)
		].join
	}

	countCharacters { :self |
		| answer = 0; |
		self.do { :each |
			answer := answer + 1
		};
		answer
	}

	countUtf16CodeUnits { :self |
		<primitive: return _self.length;>
	}

	do { :self :aProcedure:/1 |
		self.primitiveDo { :each |
			aProcedure(each.Character)
		}
	}

	endsWith { :self :aString |
		<primitive:
		if(typeof _aString == 'string') {
			return _self.endsWith(_aString);
		}
		>
		self.error('endsWith: non string operand')
	}

	evaluate { :self |
		<primitive: return sl.evaluateString(_self);>
	}

	findStringStartingAt { :self :aString :aNumber |
		<primitive: return _self.indexOf(_aString, _aNumber - 1) + 1;>
	}

	findString { :self :aString |
		<primitive: return _self.indexOf(_aString) + 1;>
	}

	first { :self |
		self[1]
	}

	includes { :self :aCharacter |
		self.characterArray.includes(aCharacter)
	}

	indices { :self |
		1.upTo(self.size)
	}

	indicesOf { :self :aString |
		aString.isString.if {
			| answer = [], index = 1, end = self.size; |
			{ index > 0 & { index <= end } }.whileTrue {
				index := self.findStringStartingAt(aString, index);
				(index ~= 0).ifTrue {
					answer.add(index);
					index := index + 1
				}
			};
			answer
		} {
			self.error('indicesOf: not a string: ' ++ aString)
		}
	}

	includesSubstring { :self :aString |
		<primitive: return _self.includes(_aString);>
	}

	isAsciiString { :self |
		self.allSatisfy(isAscii:/1)
	}

	isAllDigits { :self |
		self.isEmpty | {
			self.matchesRegExp('^[0-9]+$')
		}
	}

	isInBasicMultilingualPlane { :self |
		self.countUtf16CodeUnits = self.countCharacters
	}

	isEmpty { :self |
		self.size = 0
	}

	isLowercase { :self |
		<primitive: return /^[a-z]+$/.test(_self);>
	}

	isSequenceable { :self |
		true
	}

	isSingleCharacter { :self |
		self.size = 1 | {
			self.size = 2 & {
				self.codePointAt(2).isUtf16SurrogateCode
			}
		}
	}

	isUppercase { :self |
		<primitive: return /^[A-Z]+$/.test(_self);>
	}

	isWellFormed { :self |
		<primitive: return _self.isWellFormed();>
	}

	last { :self |
		self[self.size]
	}

	last { :self :count |
		self.copyFromTo(self.size - count + 1, self.size)
	}

	lines { :self |
		<primitive: return _self.split(/\r?\n/);>
	}

	loadFile { :self |
		<primitive: evaluateFile(_self);>
	}

	loadUrl { :self |
		<primitive: evaluateUrl(_self);>
	}

	markdownToHtml { :self |
		<primitive:
		var reader = new commonmark.Parser({smart: true});
		var writer = new commonmark.HtmlRenderer();
		return writer.render(reader.parse(_self));
		>
	}

	notEmpty { :self |
		self.isEmpty.not
	}

	occurrencesOf { :self :aString |
		aString.isString.if {
			| index = 1, end = self.size, tally = 0; |
			{ index > 0 & { index <= end } }.whileTrue {
				index := self.findStringStartingAt(aString, index);
				(index ~= 0).ifTrue {
					tally := tally + 1;
					index := index + 1
				}
			};
			tally
		} {
			self.error('occurrencesOf: not a string: ' ++ aString)
		}
	}

	padLeft { :self :anInteger :aString |
		<primitive: return _self.padStart(_anInteger, _aString);>
	}


	padRight { :self :anInteger :aString |
		<primitive: return _self.padEnd(_anInteger, _aString);>
	}

	paragraphs { :self |
		<primitive: return _self.split('\n\n');>
	}

	parseBacktickQuotedString { :self |
		self
	}

	parseDoubleQuotedString { :self |
		self
	}

	parseJson { :self |
		<primitive: return JSON.parse(_self);>
	}

	postLine { :self |
		system.transcript.log(self)
	}

	primitiveCollectInto { :self :aBlock:/1 :aCollection |
		self.primitiveDo { :each |
			aCollection.add(aBlock(each))
		};
		aCollection
	}

	primitiveDo { :self :aProcedure:/1 |
		<primitive:
		for (const each of _self) {
			_aProcedure_1(each);
		};
		return _self;
		>
	}

	pseudoSlotNameArray { :self |
		['size']
	}

	replaceRegExp { :self :regExpToFind :stringToReplaceWith |
		<primitive: return _self.replace(_regExpToFind, _stringToReplaceWith);>
	}

	replaceString { :self :stringToFind :stringToReplaceWith |
		<primitive: return _self.replace(_stringToFind, _stringToReplaceWith);>
	}

	replaceStringAll { :self :stringToFind :stringToReplaceWith |
		<primitive: return _self.replaceAll(_stringToFind, _stringToReplaceWith);>
	}

	romanNumber { :self |
		| value = 0, v1 = 0, v2 = 0, letters = 'IVXLCDM'.asciiByteArray; |
		self.asciiByteArray.reverseDo { :each |
			v1 := [1, 5, 10, 50, 100, 500, 1000].at(letters.indexOf(each));
			(v1 >= v2).if {
				value := value + v1
			} {
				value := value - v1
			};
			v2 := v1
		};
		value
	}

	sameAs { :self :aString |
		(self = aString).if {
			true
		} {
			self.asLowercase = aString.asLowercase
		}
	}

	shallowCopy { :self |
		self
	}

	size { :self |
		self.countUtf16CodeUnits
	}

	split { :self |
		self.stringArray
	}

	splitBy { :self :aString |
		<primitive: return _self.split(_aString);>
	}

	storeString { :self |
		<primitive: return `'${_self}'`;>
	}

	stringArray { :self |
		self.primitiveCollectInto(identity:/1, [])
	}

	terseGuideSummary { :self |
		self.terseGuideSummary (verbose: false)
	}

	terseGuideSummary { :self :options |
		| totalTestCount = 0, totalPassCount = 0, areas = self.paragraphs; |
		('Terse Guide Summary: Areas = ' ++ areas.size).postLine;
		areas.do { :area |
			|(
				entries = area.lines.reject { :line |
					line.isEmpty | {
						line = '```'
					}
				},
				testCount = entries.size - 1,
				failCount = 0,
				passCount = 0
			)|
			entries[1].postLine;
			2.upTo(testCount + 1).collect { :index |
				| test = entries[index]; |
				options.atIfAbsent('verbose', false).ifTrue {
					test.postLine
				};
				(test.evaluate = true).if {
					passCount := passCount + 1
				} {
					failCount := failCount + 1;
					('	Error: ' ++ test).postLine
				}
			};
			totalTestCount := totalTestCount + testCount;
			totalPassCount := totalPassCount + passCount;
			[
				'	=> ',
				passCount, ' / ', testCount,
				(failCount > 0).if {
					' (' ++ failCount ++ ' Failures)'
				} {
					''
				}
			].join.postLine
		};
		('Total => ' ++ totalPassCount ++ ' / ' ++ totalTestCount).postLine
	}

	toLowercase { :self |
		<primitive: return _self.toLowerCase();>
	}

	toUppercase { :self |
		<primitive: return _self.toUpperCase();>
	}

	truncateTo { :self :smallSize |
		(self.size <= smallSize).if {
			self
		} {
			self.copyFromTo(1, smallSize)
		}
	}

	utf8ByteArray { :self |
		<primitive: return new TextEncoder().encode(_self.normalize('NFC'));>
	}

	utf16Array { :self |
		| answer = []; |
		1.upToDo(self.countUtf16CodeUnits) { :index |
			answer.add(self.utf16CodePointAt(index))
		};
		answer
	}

	utf16CodePointAt { :self :index |
		<primitive: return _self.charCodeAt(_index - 1);>
	}

	withBlanksTrimmed { :self |
		<primitive: return _self.trim();>
	}

	withoutLeadingBlanks { :self |
		<primitive: return _self.trimStart();>
	}

	withoutTrailingBlanks { :self |
		<primitive: return _self.trimEnd();>
	}

	words { :self |
		self.splitBy(' ')
	}

	(* ImmutableSequenceableCollection *)
	allButFirst { :self | self.allButFirst(1) }
	allButFirst { :self :n | self.copyFromTo(n + 1, self.size) }

}

+@Object {

	postLine { :self |
		self.printString.postLine;
		self
	}

}

+@Integral {

	isAsciiCodePoint { :self |
		self >= 0 & {
			self < 128
		}
	}

	isUtf16SurrogateCode { :self |
		(* 0xD800 = 55296, 0xDfFF = 57343 *)
		self >= 55296 & {
			self <= 57343
		}
	}

}

Nil : [Object, Json] {

	= { :self :anObject |
		anObject.isNil
	}

	ifNil { :self :aProcedure:/0 |
		aProcedure()
	}

	ifNil { :self :whenNil:/0 :whenNotNil |
		whenNil()
	}

	ifNotNil { :self :aProcedure:/0 |
		nil
	}

	ifNotNil { :self :whenNotNil:/0 :whenNil:/0 |
		whenNil()
	}

	isNil { :self |
		true
	}

	storeString { :self |
		'nil'
	}

}

+@Object {

	ifNil { :self :aProcedure:/0 |
		self
	}

	ifNil { :self :whenNil:/0 :whenNotNil |
		whenNotNil.cull(self)
	}

	ifNotNil { :self :aProcedure:/0 |
		aProcedure()
	}

	ifNotNil { :self :whenNotNil:/0 :whenNil:/0 |
		whenNotNil()
	}

	isNil { :self |
		false
	}

	notNil { :self |
		self.isNil.not
	}

}

Constant.pi = 3.1415926535897932384626433
Constant.e = 2.71828182845904523536028747135266249775724709369995
Constant.epsilon = 0.000000000000001
