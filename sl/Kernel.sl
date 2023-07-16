@Binary {

	<< { :self :anObject |
		self.subclassResponsibility('Binary>><<')
	}

	>> { :self :anObject |
		self.subclassResponsibility('Binary>>>>')
	}

	bitAnd { :self :anObject |
		self.subclassResponsibility('Binary>>bitAnd')
	}

	bitNot { :self |
		self.subclassResponsibility('Binary>>bitNot')
	}

	bitOr { :self :anObject |
		self.subclassResponsibility('Binary>>bitOr')
	}

	bitXor { :self :anObject |
		self.subclassResponsibility('Binary>>bitXor')
	}

	bitShiftLeft { :self :anObject |
		self << anObject
	}

	bitShiftRight { :self :anObject |
		self >> anObject
	}

	highBitOfByte { :self |
		[
			0, 1, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
			6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
			7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
			7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
			8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
			8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
			8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
			8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
		].at(self + 1)
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

}

@Integral {

	adaptToFractionAndApply { :self :aFraction :aProcedure:/2 |
		aFraction.aProcedure(Fraction(self, 1))
	}

	asLargerPowerOfTwo { :self |
		self.isPowerOfTwo.if {
			self
		} {
			self.positive.if {
				1.bitShiftLeft(self.highBitOfPositiveReceiver)
			} {
				'Integral>>asLargerPowerOfTwo: non-positive'.error
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
				'Integral>>asSmallerPowerOfTwo: non-positive'.error
			}
		}
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
			| flags = Array(size).atAllPut(true); |
			count := 0;
			size.do { :index |
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

	divisors { :self |
		1.upTo(self).select { :each |
			self.remainder(each) = 0
		}
	}

	doubleFactorial { :self |
		self.negative.if {
			'Integral>>doubleFactorial: not valid for negative integers'.error
		} {
			(self <= 3).if {
				self.max(1)
			} {
				self * (self - 2).doubleFactorial
			}
		}
	}

	factorial { :self |
		(self = 0).if {
			1
		} {
			(self > 0).if {
				self * (self - 1).factorial
			} {
				'Integral>>factorial: not valid for negative integers'.error
			}
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
		self.subclassResponsibility('Integral>>isInteger')
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
				withReturn {
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
			primesArray = workspace.atIfAbsentPut('primesArray') {
				23.primesArray
			}
		)|
		(self > primesArray.size).if {
			self.primesArrayExtend(primesArray)
		} {
			primesArray[self]
		}
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

	numerator { :self |
		self
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

@Magnitude {

	< { :self :aMagnitude |
		self.subclassResponsibility('Magnitude>><')
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

	cubed { :self |
		self * self * self
	}

	degreesToRadians { :self |
		self * 0.01745329251994329547 (* pi / 180 *)
	}

	do { :self :aProcedure:/1 |
		1.upToDo(self, aProcedure:/1);
		self
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
			'Number>>quotient: divideByZero'.error
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

	squared { :self |
		self * self
	}

	strictlyPositive { :self |
		self > 0
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
		}
	}

	zero { :self |
		0
	}

}

@Object {

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

	at { :self :index |
		(*
			This may be faster than the provided accessor functions, if they are not inlined.
			This should not be used in the ordinary case.
		*)
		<primitive: return _self[_index];>
	}

	caseOf { :self :aBlockAssociationCollection |
		self.caseOfOtherwise(aBlockAssociationCollection) { :case |
			('Object>>caseOf: case not found: ' ++ case).error
		}
	}

	caseOfOtherwise { :self :aBlockAssociationCollection :otherwise:/1 |
		withReturn {
			aBlockAssociationCollection.associationsDo { :assoc |
				(assoc.key.value = self).ifTrue {
					assoc.value.value.return
				}
			};
			otherwise:/1.cull(self)
		}
	}

	identity { :self |
		self
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

	isIndexable { :self |
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

	printString { :self |
		self.storeString
	}

	printStringConcise { :self :count |
		| answer = self.printString; |
		(answer.size > count).if {
			'<' ++ self.typeOf ++ '>'
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

	return { :self |
		<primitive: throw _self;>
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
		'<' ++ self.typeOf ++ '>'
	}

	then { :self :aProcedure:/1 |
		self.aProcedure
	}

	throw { :self |
		<primitive: throw _self;>
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

	yourself { :self |
		self
	}

}

Boolean : [Object] {

	= { :self :anObject |
		<primitive: return _self === _anObject;>
	}

	& { :self :aProcedure |
		<primitive: return _self && _aProcedure();>
	}

	| { :self :aProcedure |
		<primitive: return _self || _aProcedure();>
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

	asFloat { :self |
		self.if { 1 } { 0 }
	}

	asInteger { :self |
		self.if { 1 } { 0 }
	}

	asNumber { :self |
		self.asInteger
	}

	if { :self :whenTrue :whenFalse |
		<primitive: return _self ? _whenTrue() : _whenFalse();>
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

	json { :self |
		<primitive: return JSON.stringify(_self);>
	}

	not { :self |
		<primitive: return _self ? false : true;>
	}

	storeString { :self |
		self.if {
			'true'
		} {
			'false'
		}
	}

}

Character : [Object] { | string |

	= { :self :anObject |
		anObject.isCharacter & {
			self.string = anObject.string
		}
	}

	asInteger { :self |
		self.codePoint
	}

	codePoint { :self |
		self.string.codePointAt(1)
	}

	printString { :self |
		'$' ++ self.string
	}

	storeString { :self |
		'Character(' ++ self.codePoint ++ ')'
	}

}

+SmallFloat {

	Character { :self |
		<primitive: return _Character_1(String.fromCodePoint(_self));>
	}

}

+String {

	Character { :self |
		self.isSingleCharacter.if {
			workspace.atIfAbsentPut('characterDictionary') {
				()
			}.atIfAbsentPut(self) {
				newCharacter().initializeSlots(self)
			}
		} {
			'String>>Character: not character'.error
		}
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
			'Zero has no argument'.error
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
			'Complex>>reciprocal: zero divide'.error
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

	log { :self |
		system.transcript.error(self.message)
	}

	message { :self |
		<primitive: return _self.message;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	signal { :self |
		<primitive: throw(_self);>
	}

}

+@Object {

	shouldNotImplement { :self :signature |
		(signature ++ ': shouldNotImplement: <' ++ self.typeOf ++ '> ' ++ self).error
	}

	subclassResponsibility { :self :signature |
		(signature ++ ': subclassResponsibility: <' ++ self.typeOf ++ '> ' ++ self).error
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
		aNumber.isFraction.if {
			self * aNumber.reciprocal
		} {
			aNumber.adaptToFractionAndApply(self, dividedBy:/2)
		}
	}

	** { :self :anInteger |
		anInteger.isInteger.if {
			self.raisedToInteger(anInteger)
		} {
			'Fraction>>** not an integer'.error
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

	adaptToIntegerAndApply { :self :anInteger :aProcedure:/2 |
		Fraction(anInteger, 1).aProcedure(self)
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aNumber.isInteger.if {
			Fraction(aNumber, 1).aProcedure(self)
		} {
			aNumber.aProcedure(self.asFloat)
		}
	}

	asFloat { :self |
		self.numerator / self.denominator
	}

	copy { :self |
		Fraction(self.numerator, self.denominator)
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

	limitDenominatorIter { :self :maxDenominator |
		(maxDenominator < 1).if {
			'Fraction>>limitDenominator illegal maxDenominator'.error
		} {
			(self.denominator <= maxDenominator).if {
				self
			} {
				|(
					iter = { :p0 :q0 :p1 :q1 :n :d |
						|(
							a = n // d,
							q2 = q0 + (a * q1)
						)|
						(q2 > maxDenominator).if {
							[p0, q0, p1, q1, n, d]
						} {
							iter(p1, q1, p0 + (a * p1), q2, d, n - (a * d))
						}
					},
					[p0, q0, p1, q1, n, d] = iter(0, 1, 1, 0, self.numerator, self.denominator),
					k = nil, bound1 = nil, bound2 = nil
				)|
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

	limitDenominator { :self :maxDenominator |
		(maxDenominator < 1).if {
			'Fraction>>limitDenominator illegal maxDenominator'.error
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
			'Fraction>>normalized: zeroDenominatorError'.error
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
			'Fraction>>reduced: zeroDenominatorError'.error
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
		unicodeFractions().keyAtValue(self)
	}

}

+@Integral {

	Fraction { :self :denominator |
		(denominator = 0).if {
			'Integral>>Fraction: zeroDenominatorError'.error
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
		| k = 10 ** (maxDenominator.log10.ceiling + 1); |
		Fraction((self * k).rounded, k).reduced.limitDenominator(maxDenominator)
	}

}

+String {

	parseFraction { :self :separator |
		self.includesSubstring(separator).if {
			| parts = self.splitBy(separator); |
			(parts.size = 2).if {
				Fraction(parts[1].parseInteger(10), parts[2].parseInteger(10))
			} {
				'String>>parseFraction: parse failed'.error
			}
		} {
			Fraction(self.parseInteger(10), 1)
		}
	}

	parseFraction { :self |
		self.parseFraction(':')
	}

}

+Void {

	unicodeFractions {
		(
			'⅒': 1:10, (* 0.1 *)
			'⅑': 1:9, (* 1.111 *)
			'⅛': 1:8, (* 0.125 *)
			'⅐': 1:7, (* 0.142 *)
			'⅙': 1:6, (* 0.166 *)
			'⅕': 1:5, (* 0.2 *)
			'¼': 1:4, (* 0.25 *)
			'⅓': 1:3, (* 0.333 *)
			'⅜': 3:8, (* 0.375 *)
			'⅖': 2:5, (* 0.4 *)
			'½': 1:2, (* 0.5 *)
			'⅗': 3:5, (* 0.6 *)
			'⅝': 5:8, (* 0.625 *)
			'⅔': 2:3, (* 0.666*)
			'¾': 3:4, (* 0.75 *)
			'⅘': 4:5, (* 0.8 *)
			'⅚': 5:6, (* 0.833 *)
			'⅞': 7:8 (* 0.875 *)
		)
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
		Fraction(self, anInteger.LargeInteger).normalized
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

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber.LargeInteger, self)
	}

	bitAnd { :self :anObject |
		<primitive:
		if(sl.isLargeInteger(_anObject)) {
			return _self & _anObject;
		} else if(sl.isLargeInteger(_anObject)) {
			return _self & BigInt(_anObject);
		}
		>
		'LargeInteger>>bitAnd: operand not a LargeInteger or SmallFloat'.error
	}

	isInteger { :self |
		true
	}

	LargeInteger { :self |
		self
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

SmallFloat : [Object, Magnitude, Number, Integral, Binary] {

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
		if(sl.isSmallFloat(_anObject)) {
			return _self << _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, lessThanLessThan:/2)
	}

	>> { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
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
		aFraction.asFloat.aProcedure(self)
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

	asFloat { :self |
		self
	}

	asInteger { :self |
		self.truncated
	}

	asNumber { :self |
		self
	}

	atan2 { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return Math.atan2(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, atan2:/2)
	}

	atRandom { :self |
		self.randomInteger
	}

	bitAnd { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
			return _self & _anObject;
		}
		>
		anObject.adaptToNumberAndApply(self, bitAnd:/2)
	}

	bitNot { :self |
		<primitive: return ~_self;>
	}

	bitOr { :self :anObject |
		<primitive:
		if(sl.isSmallFloat(_anObject)) {
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
		if(sl.isSmallFloat(_anObject)) {
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
			'Number>>byteHexString: not a byte'.error
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
					(self = aNumber.asFloat) | {
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

	json { :self |
		<primitive: return JSON.stringify(_self);>
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
		<primitive: if(sl.isSmallFloat(_anObject)) { return Math.max(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, max:/2)
	}

	Number { :self |
		self
	}

	odd { :self |
		<primitive: return Math.abs(_self % 2) === 1;>
	}

	primeFactors { :self |
		| factors = [], divisor = 2, n = self; |
		{ n >= 2 }.whileTrue {
			(n % divisor = 0).if {
				factors.add(divisor);
				n := n / divisor
			} {
				divisor := divisor + 1
			}
		};
		factors
	}

	primeFactorization { :self |
		self.primeFactors.Bag
	}

	primeLimit { :self |
		self.primeFactors.max
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
		error('Number>>remainder')
	}

	rounded { :self |
		<primitive: return Math.round(_self)>
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
		self.parseNumber
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
		error('Procedure>>apply: argument is not array or array is not of required size')
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

	ifError { :self :errorHandler |
		<primitive: try { return _self(); } catch (exc) { return _errorHandler(exc) }>
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

	new { :self:/1 :aNumber |
		self(aNumber)
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
		self.numArgsIfAbsent { nil }
	}

	numArgs { :self |
		self.numArgsIfAbsent { 'numArgs: applied to arity-dispatch procedure'.error }
	}

	name { :self |
		<primitive: return _self.name;>
	}

	withReturn { :self |
		<primitive:
		try {
			return _self();
		} catch (ret) {
			if(ret instanceof Error) {
				throw(ret);
			} {
				return ret;
			}
		}
		>
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

	whileFalse { :self :aProcedure |
		<primitive: while(!_self()) { _aProcedure(); }; return null;>
	}

	whileTrue { :self :aProcedure |
		<primitive: while(_self()) { _aProcedure(); }; return null;>
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

	then { :self :aProcedure |
		<primitive: return _self.then(_aProcedure);>
	}

	thenElse { :self :onResolve :onReject |
		<primitive: return _self.then(_onResolve, _onReject);>
	}

}

+Procedure {

	Promise { :self |
		<primitive: return new Promise(_self);>
	}

}

+Void {

	Promise { 'Promise()'.error }

}

+Array {

	Promise { :self |
		<primitive: return Promise.all(_self);>
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

String : [Object] {

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

	ascii { :self |
		| answer = self.utf8; |
		answer.allSatisfy(isAsciiCodePoint:/1).if {
			answer
		} {
			'String>>ascii: non-ascii character'.error
		}
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
		codePoint.isUtf16SurrogateCode.if {
			'String>>at: code point is lone surrogate'.error
		} {
			codePoint.Character
		}
	}

	beginsWith { :self :aString |
		<primitive:
		if(typeof _aString == 'string') {
			return _self.startsWith(_aString);
		}
		>
		'String>>beginsWith: non string operand'.error
	}

	capitalized { :self |
		<primitive: return _self[0].toUpperCase() + _self.slice(1);>
	}

	characterArray { :self |
		| answer = []; |
		self.do { :each |
			answer.add(each)
		};
		answer
	}

	codePointAt { :self :index |
		<primitive: return _self.codePointAt(_index - 1);>
	}

	codePointArray { :self |
		| answer = []; |
		self.do { :each |
			answer.add(each.codePoint)
		};
		answer
	}

	copyFromTo { :self :start :end |
		<primitive: return _self.substring(_start - 1, _end);>
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
		<primitive:
		for (const each of _self) {
			_aProcedure_1(_Character_1(each));
		};
		return _self;
		>
	}

	endsWith { :self :aString |
		<primitive:
		if(typeof _aString == 'string') {
			return _self.endsWith(_aString);
		}
		>
		'String>>endsWith: non string operand'.error
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
			('String>>indicesOf: not a string: ' ++ aString).error
		}
	}

	includesSubstring { :self :aString |
		<primitive: return _self.includes(_aString);>
	}

	isAscii { :self |
		self.utf8.allSatisfy(isAsciiCodePoint:/1)
	}

	isInBasicMultilingualPlane { :self |
		self.countUtf16CodeUnits = self.countCharacters
	}

	isIndexable { :self |
		true
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

	json { :self |
		<primitive: return JSON.stringify(_self);>
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
			('String>>occurrencesOf: not a string: ' ++ aString).error
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

	pseudoSlotNameArray { :self |
		['size']
	}

	replace { :self :stringToFind :stringToReplaceWith |
		<primitive: return _self.replace(_stringToFind, _stringToReplaceWith);>
	}

	replaceAll { :self :stringToFind :stringToReplaceWith |
		<primitive: return _self.replaceAll(_stringToFind, _stringToReplaceWith);>
	}

	replaceRegExp { :self :regExpToFind :stringToReplaceWith |
		<primitive: return _self.replace(_regExpToFind, _stringToReplaceWith);>
	}

	size { :self |
		self.countUtf16CodeUnits
	}

	split { :self |
		| answer = []; |
		self.do { :each |
			answer.add(each.string)
		};
		answer
	}

	splitBy { :self :aString |
		<primitive: return _self.split(_aString);>
	}

	storeString { :self |
		<primitive: return `'${_self}'`;>
	}

	terseGuideSummary { :self |
		self.terseGuideSummary (verbose: false)
	}

	terseGuideSummary { :self :options |
		self.readTextFile.then { :text |
			| totalTestCount = 0, totalPassCount = 0, areas = text.paragraphs; |
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
					test.evaluate.if {
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

	utf8 { :self |
		<primitive: return new TextEncoder().encode(_self.normalize('NFC'));>
	}

	utf16 { :self |
		| answer = []; |
		self.countUtf16CodeUnits.do { :index |
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

Transcript : [Object] {

	clear { :self |
		<primitive: return _self.clear();>
	}

	entries { :self |
		<primitive: return _self.entries;>
	}

	error { :self :message |
		<primitive: return _self.error(_message);>
	}

	log { :self :message |
		<primitive: return _self.log(_message);>
	}

	pseudoSlotNameArray { :self |
		['entries']
	}

	String { :self |
		self.entries.collect { :each |
			each.first ++ ': ' ++ each.second
		}.unlines
	}

}

Nil : [Object] {

	= { :self :anObject |
		anObject.isNil
	}

	ifNil { :self :aProcedure:/0 |
		aProcedure()
	}

	ifNil { :self :whenNil:/0 :whenNotNil:/0 |
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

	json { :self |
		<primitive: return JSON.stringify(_self);>
	}

	storeString { :self |
		'nil'
	}

}

+@Object {

	ifNil { :self :aProcedure:/0 |
		self
	}

	ifNil { :self :whenNil:/0 :whenNotNil:/0 |
		whenNotNil()
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

pi = 3.1415926535897932384626433
e = 2.71828182845904523536028747135266249775724709369995
epsilon = 0.000000000000001
