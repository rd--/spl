/* Requires: Comparable List Number Object */

Complex : [Object, Comparable, Number] { | real imaginary |

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	* { :self :anObject |
		anObject.isComplex.if {
			let a = self.real;
			let b = self.imaginary;
			let c = anObject.real;
			let d = anObject.imaginary;
			Complex((a * c) - (b * d), (a * d) + (b * c))
		} {
			anObject.adaptToComplexAndApply(self, *)
		}
	}


	+ { :self :anObject |
		anObject.isComplex.if {
			let a = self.real;
			let b = self.imaginary;
			let c = anObject.real;
			let d = anObject.imaginary;
			Complex(a + c, b + d)
		} {
			anObject.adaptToComplexAndApply(self, +)
		}
	}

	- { :self :anObject |
		anObject.isComplex.if {
			let a = self.real;
			let b = self.imaginary;
			let c = anObject.real;
			let d = anObject.imaginary;
			Complex(a - c, b - d)
		} {
			anObject.adaptToComplexAndApply(self, -)
		}
	}

	/ { :self :anObject |
		anObject.isComplex.if {
			let a = self.real;
			let b = self.imaginary;
			let c = anObject.real;
			let d = anObject.imaginary;
			Complex(
				((a * c) + (b * d)) / ((c * c) + (d * d)),
				((b * c) - (a * d)) / ((c * c) + (d * d))
			)
		} {
			anObject.adaptToComplexAndApply(self, /)
		}
	}

	^ { :self :aNumber |
		aNumber.isCollection.if {
			aNumber.collect { :each |
				self ^ each
			}
		} {
			aNumber.isInteger.if {
				self.raisedToInteger(aNumber)
			} {
				(aNumber = 0).if {
					self.one
				} {
					(aNumber = 1).if {
						self
					} {
						(self = 0).if {
							(aNumber < 0).if {
								self.error('^: zero divide')
							} {
								self
							}
						} {
							(aNumber * self.log).exp
						}
					}
				}
			}
		}
	}

	abs { :self |
		self.absSquare.sqrt
	}

	absArg { :self |
		[self.abs, self.arg]
	}

	absSquare { :self |
		(self.real * self.real) + (self.imaginary * self.imaginary)
	}

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		aFraction.asComplex.aBlock(self)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aNumber.asComplex.aBlock(self)
	}

	arg { :self |
		self.isZero.if {
			self.error('Zero has no argument')
		} {
			self.real.arcTan(self.imaginary)
		}
	}

	asComplex { :self |
		self
	}

	asGaussianInteger { :self |
		self.real.round.j(self.imaginary.round)
	}

	asList { :self |
		[self.real, self.imaginary]
	}

	asMatrix { :self |
		let a = self.real;
		let b = self.imaginary;
		[a b.negate; b a]
	}

	atRandom { :self |
		system.randomComplex([0J0, self], [])
	}

	chop { :self :epsilon |
		let x = self.real;
		let y = self.imaginary;
		(y.abs < 1E-10).if {
			x.chop(epsilon)
		} {
			Complex(
				x.chop(epsilon),
				y
			)
		}
	}

	chop { :self |
		self.chop(1E-10)
	}

	compare { :self :operand |
		operand.isComplex.if {
			self.abs.compare(operand.abs)
		} {
			self.error('compare: not Complex')
		}
	}

	conjugate { :self |
		Complex(self.real, self.imaginary.negate)
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isNumber.if {
			anObject.isComplex.if {
				aBlock(self.real, anObject.real) & {
					aBlock(self.imaginary, anObject.imaginary)
				}
			} {
				anObject.adaptToComplexAndApply(self, aBlock:/2)
			}
		} {
			false
		}
	}

	exp { :self |
		self.real.exp * (self.imaginary.cos + self.imaginary.sin.i)
	}

	fractionalPart { :self |
		Complex(self.real.fractionalPart, self.imaginary.fractionalPart)
	}

	i { :self |
		Complex(self.imaginary.negate, self.real)
	}

	integerPart { :self |
		Complex(self.real.integerPart, self.imaginary.integerPart)
	}

	isCloseToBy { :self :anObject :epsilon |
		anObject.isNumber.if {
			anObject.isComplex.if {
				self.real.isCloseToBy(anObject.real, epsilon) & {
					self.imaginary.isCloseToBy(anObject.imaginary, epsilon)
				}
			} {
				anObject.adaptToComplexAndApply(self) { :p :q |
					p.isCloseToBy(q, epsilon)
				}
			}
		} {
			false
		}
	}

	isCloseTo { :self :anObject |
		self.isCloseToBy(anObject, 0.0001)
	}

	isExact { :self |
		self.real.isExact & {
			self.imaginary.isExact
		}
	}

	isFinite { :self |
		self.arg.isFinite
	}

	isGaussianInteger { :self |
		self.real.isInteger & {
			self.imaginary.isInteger
		}
	}

	isInteger { :self |
		false
	}

	isLiteral { :self |
		true
	}

	isNaN { :self |
		self.real.isNaN | {
			self.imaginary.isNaN
		}
	}

	isNegative { :self |
		false
	}

	isRational { :unused |
		false
	}

	isReal { :self |
		self.imaginary.isZero
	}

	isVeryCloseTo { :self :anObject |
		self.isCloseToBy(anObject, 0.000000000001)
	}

	isZero { :self |
		self.real.isZero & {
			self.imaginary.isZero
		}
	}

	log { :self |
		/* self.abs.log + self.arg.i */
		let x = self.real;
		let y = self.imaginary;
		Complex(
			0.5 * ((x ^ 2) + (y ^ 2)).log,
			self.arg
		)
	}

	log { :self :aNumber |
		self.log / aNumber.log
	}

	max { :self :anObject |
		anObject.isComplex.if {
			self.maxOn(anObject, abs:/1)
		} {
			anObject.adaptToComplexAndApply(self, max:/1)
		}
	}

	min { :self :anObject |
		anObject.isComplex.if {
			self.minOn(anObject, abs:/1)
		} {
			anObject.adaptToComplexAndApply(self, min:/1)
		}
	}

	negate { :self |
		Complex(self.real.negate, self.imaginary.negate)
	}

	norm { :self |
		self.abs
	}

	normalize { :self |
		self.isZero.if {
			0J0
		} {
			self / self.abs
		}
	}

	one { :self |
		1.asComplex
	}

	printString { :self |
		[
			self.real.printString,
			self.imaginary.printString
		].stringIntercalate('J')
	}

	printStringShowingDecimalPlaces { :self :places |
		[
			self.real.printStringShowingDecimalPlaces(places),
			self.imaginary.printStringShowingDecimalPlaces(places)
		].stringIntercalate('J')
	}

	quotient { :self :aNumber |
		self.error('quotient: not implemented')
	}

	realImaginary { :self |
		[self.real, self.imaginary]
	}

	reciprocal { :self |
		(self = 0).if {
			self.error('reciprocal: zero divide')
		} {
			1 / self
		}
	}

	remainder { :self :aNumber |
		self.error('remainder: not implemented')
	}

	sign { :self |
		self / self.abs
	}

	sqrt { :self |
		(self.imaginary = 0 & {
			self.real >= 0
		}).if {
			self.real.sqrt.asComplex
		} {
			let v = (self.abs - self.real / 2).sqrt;
			let u = self.imaginary / 2 / v;
			Complex(u, v)
		}
	}

	square { :self |
		self * self
	}

	squaredNorm { :self |
		(self.real * self.real) + (self.imaginary * self.imaginary)
	}

	truncate { :self |
		self.integerPart
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	zero { :self |
		0.asComplex
	}

}

+@Number {

	adaptToComplexAndApply { :self :aComplexNumber :aBlock:/2 |
		aComplexNumber.aBlock(self.asComplex)
	}

	asComplex { :self |
		Complex(self, self.zero)
	}

	cayleyTransform { :z |
		(z - 0J1) / (z + 0J1)
	}

	Complex { :real :imaginary |
		newComplex().initializeSlots(real, imaginary)
	}

	conjugate { :self |
		self
	}

	i { :self |
		Complex(self.zero, self)
	}

	isGaussianInteger { :self |
		self.isInteger
	}

	isReal { :self |
		true
	}

	j { :real :imaginary |
		Complex(real, imaginary)
	}

}

+@Collection {

	adaptToComplexAndApply { :self :aComplexNumber :aBlock:/2 |
		self.collect { :each |
			aComplexNumber.aBlock(each)
		}
	}

}

+List {

	asComplex { :self |
		let [a, b] = self;
		a.j(b)
	}

}

+String {

	isComplexString { :self |
		let parts = self.splitBy('J');
		parts.size = 2 & {
			parts.allSatisfy(isFloatString:/1) & {
				parts[2].beginsWith('-').not
			}
		}
	}

	parseComplex { :self :elseClause:/0 |
		self.isComplexString.if {
			let [real, imaginary] = self.splitBy('J');
			Complex(
				real.parseNumber(elseClause:/0),
				imaginary.parseNumber(elseClause:/0)
			)
		} {
			elseClause()
		}
	}

	parseComplex { :self |
		self.parseComplex {
			self.error('parseComplex: invalid input')
		}
	}

}
