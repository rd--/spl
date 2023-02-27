@Numeric {

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
			'Numeric>>quotient: divideByZero'.error
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
			1
		} {
			(self < 0).if {
				-1
			} {
				0
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

}
