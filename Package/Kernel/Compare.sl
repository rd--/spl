@Compare {

	[isLess, <] { :self :operand |
		self.typeResponsibility('@Compare>><')
	}

}

+@Compare {

	compare { :self :operand |
		self.strictCompare(operand)
	}

	compareOn { :self :operand :f/1 |
		compare(f(self), f(operand))
	}

	[isGreater, >] { :self :operand |
		isLess(operand, self)
	}

	[isGreaterOrEqual, >=] { :self :operand |
		isLessOrEqual(operand, self)
	}

	isGreaterOn { :self :operand :f/1 |
		isGreater(f(self), f(operand))
	}

	[isLess, <] { :self :operand |
		/* self.compare(operand) = -1 */
		self.typeResponsibility('@Compare>><')
	}

	[isLessOrEqual, <=] { :self :operand |
		self < operand | {
			self = operand
		}
	}

	isLessOn { :self :operand :f/1 |
		isLess(f(self), f(operand))
	}

	maxOn { :self :operand :f/1 |
		minBy(self, operand) { :a :b |
			isGreaterOn(self, operand, f/1)
		}
	}

	[maximum, max] { :self :operand |
		minBy(self, operand, isGreater/2)
	}

	minBy { :self :operand :aBlock/2 |
		aBlock(self, operand).if {
			self
		} {
			operand
		}
	}

	minOn { :self :operand :f/1 |
		minBy(self, operand) { :a :b |
			isLessOn(self, operand, f/1)
		}
	}

	[minimum, min] { :self :operand |
		minBy(self, operand, isLess/2)
	}

	minThenMax { :self :aMin :aMax |
		self.min(aMin).max(aMax)
	}

	[precedes, <|] { :self :anObject |
		self.compare(anObject) = -1
	}

	[precedesOrEqualTo, <=|] { :self :anObject |
		self.compare(anObject) != 1
	}

	[strictCompare, <=>] { :self :operand |
		/* self.typeResponsibility('@Compare>>strictCompare') */
		(self = operand).if {
			0
		} {
			(self < operand).if {
				-1
			} {
				1
			}
		}
	}

	[succeeds, |>] { :self :anObject |
		self.compare(anObject) = 1
	}

	[succeedsOrEqualTo, |>=] { :self :anObject |
		self.compare(anObject) != -1
	}

}

+@Object {

	maxOn { :self :operand :aBlock/1 |
		(self.aBlock > operand.aBlock).if {
			self
		} {
			operand
		}
	}

	minOn { :self :operand :aBlock/1 |
		(self.aBlock < operand.aBlock).if {
			self
		} {
			operand
		}
	}

}
