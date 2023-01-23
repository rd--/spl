@Numeric {

	// { :self :anObject |
		self.quotient(anObject)
	}

	cubed { :self |
		self * self * self
	}

	do { :self :aProcedure |
		toDo(1, self, aProcedure)
	}

	negated { :self |
		0 - self
	}

	pow { :self :anObject |
		self ** anObject
	}

	quotient { :self :anObject |
		(self / anObject).floor
	}

	reciprocal { :self |
		1 / self
	}

	roundTo { :self :quantum |
		(self / quantum).rounded * quantum
	}

	squared { :self |
		self * self
	}

	timesRepeat { :self :aProcedure |
		| remaining = self; |
		whileTrue { remaining > 0 } {
			aProcedure.value;
			remaining := remaining - 1
		}
	}

	toDo { :self :end :aProcedure:/1 |
		| index = self; |
		whileTrue { index <= end } {
			aProcedure(index);
			index := index + 1
		}
	}

	truncateTo { :self :aNumber |
		self.quotient(aNumber) * aNumber
	}

}
