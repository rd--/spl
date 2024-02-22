{- Requires: List Number Object -}

Complex : [Object, Number] { | real imaginary |

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
		self.absSquared.sqrt
	}

	absArg { :self |
		[self.abs, self.arg]
	}

	absSquared { :self |
		(self.real * self.real) + (self.imaginary * self.imaginary)
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aCollection.collect { :element |
			aBlock(element, self)
		}
	}

	adaptToFractionAndApply { :self :aFraction :aBlock:/2 |
		aBlock(aFraction.asComplex, self)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aBlock(aNumber.asComplex, self)
	}

	arcCos { :self |
		(self.imaginary = 0).if {
			(self.real.abs > 1).if {
				(self.real < 0).if {
					pi
				} {
					0
				}.j(
					self.real.copySignTo(self.real.abs.arcCosh)
				)
			} {
				self.real.arcCos.j(0)
			}
		} {
			let tmp = self.squaredNorm - 1 / 2;
			let delta = tmp.squared + self.imaginary.squared;
			let sh2y = tmp + delta.sqrt;
			let shy = sh2y.sqrt;
			let ch2y = 1 + sh2y;
			let chy = ch2y.sqrt;
			(self.real / chy).arcCos.j(
				self.imaginary.copySignTo(shy.arcSinh.negated)
			)
		}
	}

	arcSin { :self |
		(self.imaginary = 0).if {
			(self.real.abs > 1).if {
				(pi / 2 * self.real.sign).j(
					self.real.copySignTo(self.real.abs.arcCosh).negated
				)
			} {
				self.real.arcSin.j(0)
			}
		} {
			let tmp = self.squaredNorm - 1 / 2;
			let delta = tmp.squared + self.imaginary.squared;
			let sh2y = tmp + delta.sqrt;
			let shy = sh2y.sqrt;
			let ch2y = 1 + sh2y;
			let chy = ch2y.sqrt;
			(self.real / chy).arcSin.j(
				self.imaginary.copySignTo(shy.arcSinh)
			)
		}
	}

	arcTan { :self |
		let r2 = self.squaredNorm;
		Complex(
			(1 - r2).arcTan(self.real * 2) / 2,
			((r2 + (self.imaginary * 2) + 1) / (r2 - (self.imaginary * 2) + 1)).log / 4
		)
	}

	arcTan { :self :aNumber |
		self.isZero.if {
			aNumber.isZero.if {
				Complex(0, 0)
			} {
				Complex(pi / aNumber.real.copySignTo(2), 0)
			}
		} {
			let answer = (aNumber / self).arcTan;
			(self.real < 0).if {
				answer + pi
			} {
				(answer.real > pi).if {
					answer - (pi * 2)
				} {
					answer
				}
			}
		}
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
		self.real.rounded.j(self.imaginary.rounded)
	}

	asTuple { :self |
		(self.real, self.imaginary)
	}

	closeTo { :self :anObject |
		anObject.isNumber.if {
			anObject.isComplex.if {
				self.real.closeTo(anObject.real) & {
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

	fractionPart { :self |
		Complex(self.real.fractionPart, self.imaginary.fractionPart)
	}

	i { :self |
		Complex(self.imaginary.negated, self.real)
	}

	integerPart { :self |
		Complex(self.real.integerPart, self.imaginary.integerPart)
	}

	isComplex { :self |
		true
	}

	isGaussianInteger { :self |
		self.real.isInteger & {
			self.imaginary.isInteger
		}
	}

	isGaussianPrime { :self |
		let a = self.real;
		let b = self.imaginary;
		let f = { :n |
			n.isPrime & {
				(n % 4) = 3
			}
		};
		(a = 0).if {
			b.abs.isPrime & {
				f(b.abs)
			}
		} {
			(b = 0).if {
				a.abs.isPrime & {
					f(a.abs)
				}
			} {
				(a.squared + b.squared).isPrime
			}
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

	norm { :self |
		self.abs
	}

	normalize { :self |
		self.isZero.if {
			0j0
		} {
			self / self.abs
		}
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

	randomComplex { :self |
		0j0.randomComplex(self)
	}

	randomComplex { :min :max |
		Complex(
			min.real.randomFloat(max.real),
			min.imaginary.randomFloat(max.imaginary)
		)
	}

	reciprocal { :self |
		(self = 0).if {
			self.error('reciprocal: zero divide')
		} {
			1 / self
		}
	}

	sign { :self |
		self / self.abs
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
			let v = (self.abs - self.real / 2).sqrt;
			let u = self.imaginary / 2 / v;
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

	adaptToComplexAndApply { :self :aComplexNumber :aBlock:/2 |
		aBlock(aComplexNumber, self.asComplex)
	}

	asComplex { :self |
		Complex(self, self.zero)
	}

	Complex { :real :imaginary |
		newComplex().initializeSlots(real, imaginary)
	}

	conjugated { :self |
		self
	}

	i { :self |
		Complex(self.zero, self)
	}

	j { :real :imaginary |
		Complex(real, imaginary)
	}

}

+List {

	adaptToComplexAndApply { :self :aComplexNumber :aBlock:/2 |
		self.collect { :each |
			aBlock(aComplexNumber, each)
		}
	}

}

+@Sequence {

	asComplex { :self |
		let [a, b] = self;
		a.j(b)
	}

}
