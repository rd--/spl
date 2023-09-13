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

	asInteger { :self |
		self.truncated
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
			index -:= 1
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

	pi { :self |
		self * pi
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
					nextValue +:= step
				}
			} {
				{ stop >= nextValue }.whileTrue {
					aBlock(nextValue);
					nextValue +:= step
				}
			}
		};
		self
	}

	toDo { :self :end :aProcedure:/1 |
		| index = self; |
		{ index <= end }.whileTrue {
			aProcedure(index);
			index +:= 1
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

	upOrDownToDo { :self :end :aProcedure:/1 |
		| step = (end < self).if { -1 } { 1 }; |
		self.toByDo(end, step, aProcedure:/1)
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
