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
