@Numeric {

	// { :self :anObject |
		self.quotient(anObject)
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
