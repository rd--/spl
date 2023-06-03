@Binary {

	<< { :self :anObject |
		self.subclassResponsibility
	}

	>> { :self :anObject |
		self.subclassResponsibility
	}

	bitAnd { :self :anObject |
		self.subclassResponsibility
	}

	bitNot { :self |
		self.subclassResponsibility
	}

	bitOr { :self :anObject |
		self.subclassResponsibility
	}

	bitXor { :self :anObject |
		self.subclassResponsibility
	}

	bitShiftLeft { :self :anObject |
		self << anObject
	}

	bitShiftRight { :self :anObject |
		self >> anObject
	}

}

@Integral {

	adaptToFractionAndApply { :self :aFraction :aProcedure:/2 |
		aFraction.aProcedure(Fraction(self, 1))
	}

	denominator { :self |
		1
	}

	divisors { :self |
		(1 .. self).select { :each |
			self.remainder(each) = 0
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

	isInteger { :self |
		self.subclassResponsibility
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
		| nPrimes = 6542; |
		(self <= nPrimes).if {
			workspace::primesArray.ifNil {
				| n = 1; |
				workspace::primesArray := Array(nPrimes);
				(1 .. nPrimes).do { :index |
					n := n.nextPrime;
					workspace::primesArray[index] := n
				}
			};
			workspace::primesArray[self]
		} {
			'@Integral>>nthPrime: out of range'.error
		}
	}

	primesUpTo { :self |
		| answer = OrderedCollection(); |
		self.primesUpToDo { :n | answer.add(n) };
		answer.Array
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
		}
	}

}

@Magnitude {

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

	betweenAnd { :self :min :max |
		(min <= self).if {
			self <= max
		} {
			false
		}
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

	abs { :self |
		(self < 0).if {
			self.negated
		} {
			self
		}
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

	do { :self :aProcedure:/1 |
		1.toDo(self, aProcedure:/1)
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

	toDo { :self :end :aProcedure:/1 |
		| index = self; |
		{ index <= end }.whileTrue  {
			aProcedure(index);
			index := index + 1
		}
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
			('Object>>caseOf: case not found, and no otherwise clause: ' ++  case.printString).error
		}
	}

	caseOfOtherwise { :self :aBlockAssociationCollection :otherwise:/1 |
		withReturn {
			aBlockAssociationCollection.associationsDo { :assoc |
				(assoc.key.value = self).ifTrue {
					assoc.value.value.return
				}
			};
			self.otherwise
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
		self.typeOf
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
		<primitive: return sl.typeOf(_self)>
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

	printString { :self |
		self.if { 'true' } { 'false' }
	}

}

Complex : [Object] { | real imaginary |

	* { :self :anObject |
		anObject.isComplex.if {
			|
				a = self.real,
				b = self.imaginary,
				c = anObject.real,
				d = anObject.imaginary;
			|
			Complex((a * c) - (b * d), (a * d) + (b * c))
		} {
			anObject.adaptToComplexAndApply(self, times:/2)
		}
	}


	+ { :self :anObject |
		anObject.isComplex.if {
			|
				a = self.real,
				b = self.imaginary,
				c = anObject.real,
				d = anObject.imaginary;
			|
			Complex(a + c, b + d)
		} {
			anObject.adaptToComplexAndApply(self, plus:/2)
		}
	}

	- { :self :anObject |
		anObject.isComplex.if {
			|
				a = self.real,
				b = self.imaginary,
				c = anObject.real,
				d = anObject.imaginary;
			|
			Complex(a - c, b - d)
		} {
			anObject.adaptToComplexAndApply(self, minus:/2)
		}
	}

	/ { :self :anObject |
		anObject.isComplex.if {
			|
				a = self.real,
				b = self.imaginary,
				c = anObject.real,
				d = anObject.imaginary;
			|
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
		aCollection.collect { :element | aProcedure(element, self) }
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
			self.real.printString ++ ' - ' ++ self.imaginary.abs.printString ++ '.i'
		} {
			self.real.printString ++ ' + ' ++ self.imaginary.printString ++ '.i'
		}
	}

	reciprocal { :self |
		(self = 0).if {
			'ZeroDivide'.error
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
			|
				v = (self.abs - self.real / 2).sqrt,
				u = self.imaginary / 2 / v;
			|
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

	shouldNotImplement { :self |
		(self.typeOf ++ '>>shouldNotImplement: ' ++ self).error
	}

	subclassResponsibility { :self |
		(self.typeOf ++ '>>subclassResponsibility: ' ++ self).error
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
			|
			d1 = self.numerator.gcd(aNumber.denominator),
			d2 = self.denominator.gcd(aNumber.numerator);
			|
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
				|
				d = self.denominator.gcd(aNumber.denominator),
				d1 = aNumber.denominator // d,
				d2 = self.denominator // d,
				n = (self.numerator * d1) + (aNumber.numerator * d2);
				|
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
				aNumber.adaptToFractionAndSend(minus:/2)
			}
		}
	}

	/ { :self :aNumber |
		aNumber.isFraction.if {
			self * aNumber.reciprocal
		} {
			aNumber.adaptToFractionAndSend(dividedBy:/2)
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
			|
				x = self.numerator * self.denominator.sign,
				y = self.denominator.abs,
				d = x.gcd(y);
			|
			self.numerator := x // d;
			self.denominator := y // d;
			self
		}
	}

	printString { :self |
		self.numerator.printString ++ ':' ++ self.denominator.printString
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
			|
				x = self.numerator * self.denominator.sign,
				y = self.denominator.abs,
				d = x.gcd(y);
			|
			self.numerator := x // d;
			self.denominator := y // d;
			(self.denominator = 1).if {
				self.numerator
			} {
				self
			}
		}
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

LargeInteger : [Object, Magnitude, Number, Integral] {

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
		<primitive: return ((_self % BigInt(_anInteger)) + BigInt(_anInteger)) % BigInt(_anInteger);>
	}

	** { :self :anInteger |
		<primitive: return _self ** BigInt(_anInteger);>
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		aProcedure(aNumber.LargeInteger, self)
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
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self < _anObject; }>
		anObject.adaptToNumberAndApply(self, lessThan:/2)
	}

	<= { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self <= _anObject; }>
		anObject.adaptToNumberAndApply(self, lessThanEquals:/2)
	}

	+ { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self + _anObject; }>
		anObject.adaptToNumberAndApply(self, plus:/2)
	}

	- { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self - _anObject; }>
		anObject.adaptToNumberAndApply(self, minus:/2)
	}

	* { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self * _anObject; }>
		anObject.adaptToNumberAndApply(self, times:/2)
	}

	/ { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self / _anObject; }>
		anObject.adaptToNumberAndApply(self, dividedBy:/2)
	}

	% { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return ((_self % _anObject) + _anObject) % _anObject; }>
		anObject.adaptToNumberAndApply(self, modulo:/2)
	}

	** { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return Math.pow(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, timesTimes:/2)
	}

	<< { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self << _anObject; }>
		anObject.adaptToNumberAndApply(self, lessThanLessThan:/2)
	}

	>> { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return sl.shiftRight(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, greaterThanGreaterThan:/2)
	}

	abs { :self |
		<primitive: return Math.abs(_self)>
	}

	acos { :self |
		<primitive: return Math.acos(_self)>
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aCollection.collect { :each |
			aProcedure(each, self)
		}
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

	asin { :self |
		<primitive: return Math.asin(_self)>
	}

	atan { :self |
		<primitive: return Math.atan(_self)>
	}

	atan2 { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return Math.atan2(_self, _anObject); }>
		anObject.adaptToNumberAndApply(self, atan2:/2)
	}

	atRandom { :self |
		self.randomInteger
	}

	bitAnd { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self & _anObject; }>
		anObject.adaptToNumberAndApply(self, bitAnd:/2)
	}

	bitNot { :self |
		<primitive: return ~_self;>
	}

	bitOr { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self | _anObject; }>
		anObject.adaptToNumberAndApply(self, bitOr:/2)
	}

	bitXor { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self ^ _anObject; }>
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

	closeTo { :self :aNumber |
		aNumber.isNumber.not.if {
			{ self = aNumber }.ifError { false }
		} {
			(self = 0).if {
				aNumber.abs < 0.0001
			} {
				(aNumber = 0).if {
					self.abs < 0.0001
				} {
					(self = aNumber.asFloat) | {
						| z = self.abs; |
						(z < 0.0001).if {
							aNumber.abs < 0.0001
						} {
							(self - aNumber).abs / (z.max(aNumber.abs)) < 0.0001
						}
					}
				}
			}
		}
	}

	cos { :self |
		<primitive: return Math.cos(_self)>
	}

	cosh { :self |
		<primitive: return Math.cosh(_self)>
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

	odd { :self |
		<primitive: return Math.abs(_self % 2) === 1;>
	}

	primeFactors { :self |
		| factors = OrderedCollection(), divisor = 2, n = self; |
		{ n >= 2 }.whileTrue {
			(n % divisor = 0).if {
				factors.add(divisor);
				n := n / divisor
			} {
				divisor := divisor + 1
			}
		};
		factors.Array
	}

	primeFactorization { :self |
		self.primeFactors.IdentityBag
	}

	primeLimit { :self |
		self.primeFactors.max
	}

	printString { :self |
		self.printString(10)
	}

	printString { :self :radix |
		<primitive: return _self.toString(_radix);>
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
		1.randomFloat(self).rounded
	}

	randomInteger { :self :aNumber |
		self.randomFloat(aNumber).rounded
	}

	remainder { :self :anObject |
		<primitive: if(sl.isSmallFloat(_anObject)) { return _self % _anObject; }>
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

	tan { :self |
		<primitive: return Math.tan(_self)>
	}

	tanh { :self |
		<primitive: return Math.tanh(_self)>
	}

	truncated { :self |
		<primitive: return Math.trunc(_self)>
	}

	LargeInteger { :self |
		<primitive: return BigInt(_self);>
	}

	Number { :self |
		self
	}

}

+String {

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
		}>
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

	new { :self:/0 |
		self()
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

	exec { :self :aString |
		<primitive: return _self.exec(_aString);>
	}

	flags { :self |
		<primitive: return _self.flags;>
	}

	printString { :self |
		<primitive: return `RegExp('${_self.source}', '${_self.flags}')`;>
	}

	source { :self |
		<primitive: return _self.source;>
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
		aRegExp.test(self)
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

	++? { :self :anObject |
		anObject.isNil.if {
			self
		} {
			self ++ anObject
		}
	}

	appendString { :self :aString |
		<primitive: return _self + _aString;>
	}

	ascii { :self |
		1.toAsCollect(self.size, ByteArray:/1) { :index |
			| codePoint = self.charCodeAt(index); |
			(codePoint > 255).ifTrue {
				'String>>ascii: non-ascii character'.error
			};
			codePoint
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
		<primitive: return _self.at(_index - 1);>
	}

	beginsWith { :self :aString |
		<primitive: return _self.startsWith(_aString);>
	}

	capitalized { :self |
		<primitive: return _self[0].toUpperCase() + _self.slice(1);>
	}

	charCodeAt { :self :index |
		<primitive: return _self.charCodeAt(_index - 1);>
	}

	copyFromTo { :self :start :end |
		<primitive: return _self.substring(_start - 1, _end);>
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

	indices { :self |
		(1 .. self.size)
	}

	indicesOf { :self :aString |
		aString.isString.if {
			| answer = OrderedCollection(), index = 1, end = self.size; |
			{ index > 0 & { index <= end } }.whileTrue {
				index := self.findStringStartingAt(aString, index);
				(index ~= 0).ifTrue {
					answer.add(index);
					index := index + 1
				}
			};
			answer.Array
		} {
			('String>>indicesOf: not a string: ' ++ aString).error
		}
	}

	includesSubstring { :self :aString |
		<primitive: return _self.includes(_aString);>
	}

	isIndexable { :self |
		true
	}

	isEmpty { :self |
		self.size = 0
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

	printString { :self |
		<primitive: return `'${_self}'`;>
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
		<primitive: return _self.length;>
	}

	splitBy { :self :aString |
		 <primitive: return _self.split(_aString);>
	}

	terseGuideSummary { :self |
		self.readTextFile.then { :text |
			| totalTestCount = 0, totalPassCount = 0, areas = text.paragraphs; |
			('Terse Guide Summary: Areas = ' ++ areas.size.printString).postLine;
			areas.do { :area |
				| entries = area.lines.reject(isEmpty:/1), testCount = entries.size - 1, passCount = 0; |
				entries[1].postLine;
				(2 .. testCount + 1).collect { :index |
					| test = entries[index], answer = test.evaluate; |
					answer.if {
						passCount := passCount + 1
					} {
						('	Error: ' ++ test).postLine
					}
				};
				totalTestCount := totalTestCount + testCount;
				totalPassCount := totalPassCount + passCount;
				('	=> ' ++ passCount.printString ++ ' / ' ++ testCount.printString).postLine
			};
			('Total => ' ++ totalPassCount.printString ++ ' / ' ++ totalTestCount.printString).postLine
		}
	}

	toLowerCase { :self |
		  <primitive: return _self.toLowerCase();>
	}

	toUpperCase { :self |
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

UndefinedObject : [Object] {

	= { :self :anObject |
		anObject.isNil
	}

	? { :self :anObject |
		anObject.value
	}

	~? { :self :anObject |
		nil
	}

	ifNil { :self :aProcedure:/0 |
		aProcedure()
	}

	ifNotNil { :self :aProcedure:/0 |
		 nil
	}

	isNil { :self |
		true
	}

	json { :self |
		<primitive: return JSON.stringify(_self);>
	}

	printString { :self |
		'nil'
	}

}

+@Object {

	? { :self :anObject |
		self
	}

	~? { :self :anObject |
		anObject.value
	}

	ifNil { :self :aProcedure:/0 |
		nil
	}

	ifNotNil { :self :aProcedure:/0 |
		aProcedure()
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
