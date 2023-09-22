(* Requires: Array Number Object *)

Complex : [Object] { | real imaginary |

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

	~ { :self :anObject |
		anObject.isNumber.if {
			anObject.isComplex.if {
				(self.real ~ anObject.real) & {
					self.imaginary ~ anObject.imaginary
				}
			} {
				anObject.adaptToComplexAndApply(self, tilde:/2)
			}
		} {
			false
		}
	}

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
			anObject.adaptToComplexAndApply(self, dividedBy:/2)
		}
	}

	^ { :self :aNumber |
		(aNumber = 0).if {
			1.asComplex
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

	abs { :self |
		self.absSquared.sqrt
	}

	absSquared { :self |
		(self.real * self.real) + (self.imaginary * self.imaginary)
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aCollection.collect { :element |
			aProcedure(element, self)
		}
	}

	adaptToFractionAndApply { :self :aFraction :aProcedure:/2 |
		aProcedure(aFraction.asComplex, self)
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

	isGaussianInteger { :self |
		self.real.isInteger & {
			self.imaginary.isInteger
		}
	}

	isNumber { :self |
		true
	}

	isZero { :self |
		self.real.isZero & {
			self.imaginary.isZero
		}
	}

	log { :self |
		self.abs.log + self.arg.i
	}

	log { :self :aNumber |
		self.log / aNumber.log
	}

	negated { :self |
		Complex(self.real.negated, self.imaginary.negated)
	}

	one { :self |
		1.asComplex
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
		(self.imaginary = 0 & {
			self.real >= 0
		}).if {
			self.real.sqrt.asComplex
		} {
			|(
				v = (self.abs - self.real / 2).sqrt,
				u = self.imaginary / 2 / v
			)|
			Complex(u, v)
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

	zero { :self |
		0.asComplex
	}

}

+@Number {

	adaptToComplexAndApply { :self :aComplexNumber :aProcedure:/2 |
		aProcedure(aComplexNumber, self.asComplex)
	}

	asComplex { :self |
		Complex(self, self.zero)
	}

	Complex { :self :imaginary |
		newComplex().initializeSlots(self, imaginary)
	}

	i { :self |
		Complex(self.zero, self)
	}

}

+Array {

	adaptToComplexAndApply { :self :aComplexNumber :aProcedure:/2 |
		self.collect { :each |
			aProcedure(aComplexNumber, each)
		}
	}

}
