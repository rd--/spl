@Compare {

	[less, <] { :self :operand |
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

	[greater, >] { :self :operand |
		less(operand, self)
	}

	[greaterEqual, >=] { :self :operand |
		lessEqual(operand, self)
	}

	greaterOn { :self :operand :f/1 |
		greater(f(self), f(operand))
	}

	[less, <] { :self :operand |
		/* self.compare(operand) = -1 */
		self.typeResponsibility('@Compare>><')
	}

	[lessEqual, <=] { :self :operand |
		self < operand | {
			self = operand
		}
	}

	lessOn { :self :operand :f/1 |
		less(f(self), f(operand))
	}

	maxOn { :self :operand :f/1 |
		minBy(self, operand) { :a :b |
			greaterOn(self, operand, f/1)
		}
	}

	[maximum, max] { :self :operand |
		minBy(self, operand, greater/2)
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
			lessOn(self, operand, f/1)
		}
	}

	[minimum, min] { :self :operand |
		minBy(self, operand, less/2)
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
