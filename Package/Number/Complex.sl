/* Requires: Compare List Number Object */

Complex : [Object, Copy, Store, Equal, Compare, Number] {

	| real imaginary |

	[Record, complexToRecord] { :self |
		(real: self.real, imaginary: self.imaginary)
	}

	[absoluteValue, abs] { :self |
		self.absoluteValueSquare.sqrt
	}

	[absoluteValueArgument, absArg] { :self |
		[self.absoluteValue, self.argument]
	}

	[absoluteValueSquare, absSquare] { :self |
		(self.real * self.real) + (self.imaginary * self.imaginary)
	}

	adaptToFractionAndApply { :self :aFraction :aBlock/2 |
		aBlock(
			Complex(SmallFloat(aFraction), 0),
			self
		)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock/2 |
		aNumber.isNaN.if {
			NaN
		} {
			aBlock(
				Complex(aNumber, 0),
				self
			)
		}
	}

	[argument, arg] { :self |
		self.isZero.if {
			self.error('Zero has no argument')
		} {
			self.real.arcTan(self.imaginary)
		}
	}

	atRandom { :self |
		system.randomComplex([0J0, self], [])
	}

	ceiling { :self |
		Complex(
			self.real.ceiling,
			self.imaginary.ceiling
		)
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

	[compare, lexicographicCompare] { :self :operand |
		compareOn(self, operand, realImaginary/1)
	}

	compareMagnitudes { :self :operand |
		compareOn(self, operand, abs/1)
	}

	compareOn { :self :operand :f/1 |
		operand.isComplex.if {
			compare(f(self), f(operand))
		} {
			self.error('compareOn: not Complex', [operand])
		}
	}

	[complexModulus, norm] { :self |
		self.abs
	}

	concisePrintString { :self |
		[
			{ self.isReal } -> { self.real.printString },
			{ self.isPurelyImaginary } -> { self.imaginary.printString ++ 'I' },
			{ true } -> { self.printString }
		].which
	}

	conjugate { :self |
		Complex(
			self.real,
			self.imaginary.negate
		)
	}

	[divide, /] { :self :anObject |
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
			anObject.adaptToComplexAndApply(self, divide/2)
		}
	}

	exp { :self |
		self.real.exp * (self.imaginary.cos + self.imaginary.sin.I)
	}

	[floor, <] { :self |
		Complex(
			self.real.floor,
			self.imaginary.floor
		)
	}

	fractionalPart { :self |
		Complex(
			self.real.fractionalPart,
			self.imaginary.fractionalPart
		)
	}

	i { :self |
		Complex(
			self.imaginary.negate,
			self.real
		)
	}

	integerChop { :self :epsilon |
		let x = self.real.integerChop(epsilon);
		let y = self.imaginary.integerChop(epsilon);
		y.isZero.if {
			x
		} {
			Complex(x, y)
		}
	}

	integerChop { :self |
		self.integerChop(1E-10)
	}

	integerPart { :self |
		Complex(
			self.real.integerPart,
			self.imaginary.integerPart
		)
	}

	isCloseBy { :self :anObject :epsilon |
		anObject.isNumber.if {
			anObject.isComplex.if {
				self.real.isCloseBy(anObject.real, epsilon) & {
					self.imaginary.isCloseBy(anObject.imaginary, epsilon)
				}
			} {
				anObject.adaptToComplexAndApply(self) { :p :q |
					p.isCloseBy(q, epsilon)
				}
			}
		} {
			false
		}
	}

	isEqualBy { :self :anObject :aBlock/2 |
		anObject.isNumber.if {
			anObject.isComplex.if {
				aBlock(self.real, anObject.real) & {
					aBlock(self.imaginary, anObject.imaginary)
				}
			} {
				anObject.adaptToComplexAndApply(self, aBlock/2)
			}
		} {
			false
		}
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

	isGaussianUnit { :self |
		[1J0 -1J0 0J1 0J-1].includes(self)
	}

	isInteger { :unused |
		false
	}

	isInteger { :unusedSelf :unusedEpsilon |
		false
	}

	isLiteral { :unused |
		true
	}

	isNaN { :self |
		self.shouldNotImplement('isNaN')
	}

	isNegative { :self |
		false
	}

	isPurelyImaginary { :self |
		self.real.isZero
	}

	isRational { :unused |
		false
	}

	isReal { :self |
		self.imaginary.isZero
	}

	isVeryClose { :self :anObject |
		self.isCloseBy(anObject, 0.000000000001)
	}

	isZero { :self |
		self.real.isZero & {
			self.imaginary.isZero
		}
	}

	log { :self |
		self.isZero.if {
			-Infinity
		} {
			/* self.abs.log + self.arg.I */
			let x = self.real;
			let y = self.imaginary;
			Complex(
				0.5 * ((x ^ 2) + (y ^ 2)).log,
				self.arg
			)
		}
	}

	log { :self :aNumber |
		self.log / aNumber.log
	}

	matrixForm { :self |
		let a = self.real;
		let b = self.imaginary;
		[a b.negate; b a]
	}

	[negate, -] { :self |
		Complex(
			self.real.negate,
			self.imaginary.negate
		)
	}

	normalize { :self |
		self.isZero.if {
			0J0
		} {
			self / self.abs
		}
	}

	one { :self |
		Complex(1, 0)
	}

	[plus, +] { :self :anObject |
		anObject.isComplex.if {
			let a = self.real;
			let b = self.imaginary;
			let c = anObject.real;
			let d = anObject.imaginary;
			Complex(
				a + c,
				b + d
			)
		} {
			anObject.adaptToComplexAndApply(self, plus/2)
		}
	}

	[power, ^] { :self :aNumber |
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

	[quotient, //] { :self :aNumber |
		self.shouldNotImplement('quotient')
	}

	[realImaginary, components] { :self |
		[self.real, self.imaginary]
	}

	reciprocal { :self |
		(self = 0).if {
			self.error('reciprocal: zero divide')
		} {
			1 / self
		}
	}

	[remainder, \\] { :self :aNumber |
		self.shouldNotImplement('remainder')
	}

	[round, gaussianInteger] { :self |
		Complex(
			self.real.round,
			self.imaginary.round
		)
	}

	sign { :self |
		self / self.abs
	}

	square { :self |
		self * self
	}

	[squareRoot, sqrt] { :self |
		(
			self.imaginary = 0 & {
				self.real >= 0
			}
		).if {
			Complex(
				self.real.sqrt,
				0
			)
		} {
			let v = (self.abs - self.real / 2).sqrt;
			let u = self.imaginary / 2 / v;
			Complex(u, v)
		}
	}

	[subtract, -] { :self :anObject |
		anObject.isComplex.if {
			let a = self.real;
			let b = self.imaginary;
			let c = anObject.real;
			let d = anObject.imaginary;
			Complex(
				a - c,
				b - d
			)
		} {
			anObject.adaptToComplexAndApply(self, subtract/2)
		}
	}

	[times, *] { :self :anObject |
		anObject.isComplex.if {
			let a = self.real;
			let b = self.imaginary;
			let c = anObject.real;
			let d = anObject.imaginary;
			Complex(
				(a * c) - (b * d),
				(a * d) + (b * c)
			)
		} {
			anObject.adaptToComplexAndApply(self, times/2)
		}
	}

	[toComplex, complexToComplex] { :self |
		self
	}

	truncate { :self |
		self.integerPart
	}

	zero { :self |
		Complex(0, 0)
	}

}

+SmallFloat {

	Complex { :real :imaginary |
		real.isNaN.if {
			NaN
		} {
			imaginary.isSmallFloat.if {
				imaginary.isNaN.if {
					NaN
				} {
					uncheckedComplex(real, imaginary)
				}
			} {
				imaginary.adaptToNumberAndApply(real, Complex/2)
			}
		}
	}

	GaussianInteger { :real :imaginary |
		imaginary.isInteger.if {
			uncheckedComplex(
				real.assertIsSmallInteger('GaussianInteger'),
				imaginary
			)
		} {
			imaginary.adaptToNumberAndApply(real, GaussianInteger/2)
		}
	}

	Polar { :rho :phi |
		phi.isSmallFloat.if {
			Complex(rho * phi.cos, rho * phi.sin)
		} {
			phi.adaptToNumberAndApply(rho, Polar/2)
		}
	}

	uncheckedComplex { :real :imaginary |
		newComplex().initializeSlots(real, imaginary)
	}

}

+@Number {

	[Complex, J] { :real :imaginary |
		Complex(
			SmallFloat(real),
			SmallFloat(imaginary)
		)
	}

	I { :self |
		Complex(
			0,
			SmallFloat(self)
		)
	}

	adaptToComplexAndApply { :self :aComplexNumber :aBlock/2 |
		self.isNaN.if {
			NaN
		} {
			aComplexNumber.aBlock(
				self.toComplex
			)
		}
	}

	cayleyTransform { :z |
		(z - 0J1) / (z + 0J1)
	}

	conjugate { :self |
		self
	}

	isGaussianInteger { :self |
		self.isInteger
	}

	isReal { :self |
		true
	}

	[toComplex, realToComplex] { :self |
		Complex(SmallFloat(self), 0)
	}

}

+@Collection {

	adaptToComplexAndApply { :self :aComplexNumber :aBlock/2 |
		self.collect { :each |
			aComplexNumber.aBlock(each)
		}
	}

	realToComplex { :self |
		self.collect(realToComplex/1)
	}

}

+@Sequence {

	[Complex, J] { :self :anObject |
		anObject.adaptToCollectionAndApply(self, Complex/2)
	}

	GaussianInteger { :self :anObject |
		anObject.adaptToCollectionAndApply(self, GaussianInteger/2)
	}

	Polar { :self :anObject |
		anObject.adaptToCollectionAndApply(self, Polar/2)
	}

}

+List {

	[Complex, listToComplex] { :self |
		self.atVectorOrElementwise { :each |
			let [a, b] = each;
			Complex(a, b)
		}
	}

	[GaussianInteger, listToGaussianInteger] { :self |
		self.atVectorOrElementwise { :each |
			let [a, b] = each;
			GaussianInteger(a, b)
		}
	}

}

+String {

	isComplexString { :self |
		let parts = self.splitOn('J');
		parts.size = 2 & {
			parts.allSatisfy(isFloatString/1) & {
				parts[2].beginsWith('-').not
			}
		}
	}

	parseComplex { :self :elseClause/0 |
		self.isComplexString.if {
			let [real, imaginary] = self.splitOn('J');
			Complex(
				real.parseNumber(elseClause/0),
				imaginary.parseNumber(elseClause/0)
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

+Record {

	parseComplex { :self |
		self.keys.caseOf(
			[
				['real' 'imaginary'] -> { Complex(self['real'], self['imaginary']) }
			]
		)
	}

}

+@Integer {

	polyominoes { :n |
		let rot = { :p |
			1I * p
		};
		let ref = { :p |
			p.collect { :x |
				x - (2 * x.real)
			}
		};
		let cyclic = { :p |
			let i = p;
			let a = [p];
			{
				i := rot(i);
				i != p
			}.whileTrue {
				a.add!(i)
			};
			a
		};
		let dihedral = { :p |
			p.cyclic.collect { :x |
				[x, ref(x)]
			}.catenate
		};
		let canonical = { :p |
			let a = p.real.min;
			let b = p.imaginary.min;
			p.collect { :x |
				x - (a + (b * 1I))
			}.unique(=)
		};
		let allPieces = { :p |
			p.dihedral.collect(canonical/1).unique(=)
		};
		(n = 1).if {
			[[0]]
		} {
			let a = [];
			let fig = (n - 1).polyominoes.collect { :f |
				f.collect { :x |
					[f, x + 1, f, x + 1I, f, x - 1, f, x - 1I]
				}
			}.flatten.partition(n);
			let f = fig.collect(canonical/1).unique(=).select { :x |
				x.size = n
			};
			{
				f != []
			}.whileTrue {
				let g = f[1];
				a := [a, g];
				f := complement(f, allPieces(g))
			};
			a.flatten.partition(n)
		}
	}

}

