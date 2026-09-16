@Compare {

	[compare, <=>] { :self :operand |
		/* self.typeResponsibility('@Compare>>compare') */
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

	[greater, >] { :self :operand |
		operand < self
	}

	[greaterEqual, >=] { :self :operand |
		operand <= self
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

	max { :self :operand |
		(self > operand).if {
			self
		} {
			operand
		}
	}

	min { :self :operand |
		(self < operand).if {
			self
		} {
			operand
		}
	}

	minMax { :self :aMin :aMax |
		self.min(aMin).max(aMax)
	}

	[precedes, <|] { :self :anObject |
		self.compare(anObject) = -1
	}

	[precedesOrEqualTo, <=|] { :self :anObject |
		self.compare(anObject) != 1
	}

	[succeeds, |>] { :self :anObject |
		self.compare(anObject) = 1
	}

	[succeedsOrEqualTo, |>=] { :self :anObject |
		self.compare(anObject) != -1
	}

}

+@Object {

	maxOn { :self :operand :aBlock:/1 |
		(self.aBlock > operand.aBlock).if {
			self
		} {
			operand
		}
	}

	minOn { :self :operand :aBlock:/1 |
		(self.aBlock < operand.aBlock).if {
			self
		} {
			operand
		}
	}

}
