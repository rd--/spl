Interval : [Object, Magnitude, Number] { | min max |

	= { :self :operand |
		self.equalBy(operand, =)
	}

	~ { :self :operand |
		self.equalBy(operand, ~)
	}

	< { :self :operand |
		operand.isInterval.if {
			self.min < operand.min & {
				self.max < operand.max
			}
		} {
			operand.adaptToIntervalAndApply(self, +)
		}
	}

	+ { :self :operand |
		operand.isInterval.if {
			Interval(self.min + operand.min, self.max + operand.max)
		} {
			operand.adaptToIntervalAndApply(self, +)
		}
	}

	- { :self :operand |
		operand.isInterval.if {
			Interval(self.min - operand.min, self.max - operand.max)
		} {
			operand.adaptToIntervalAndApply(self, -)
		}
	}

	* { :self :operand |
		operand.isInterval.if {
			let products = ([self.min, self.max] *.outer [operand.min, operand.max]).flatten;
			Interval(products.min, products.max)
		} {
			operand.adaptToIntervalAndApply(self, *)
		}
	}

	abs { :self |
		(self.min >= 0).if {
			self
		} {
			(self.max <= 0).if {
				self.negated
			} {
				Interval(0, self.min.negated.max(self.max))
			}
		}
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aBlock(aNumber.asInterval, self)
	}

	atRandom { :self |
		self.min.randomFloat(self.max)
	}

	discretize { :self :size :aBlock:/1 |
		let step = (self.max - self.min) / (size - 1);
		let value = self.min;
		let answer = List(size);
		1.toDo(size) { :index |
			answer[index] := aBlock(value);
			value := value + step
		};
		answer
	}

	discretize { :self :size |
		self.discretize(size, identity:/1)
	}

	equalBy { :self :operand :aBlock:/2 |
		operand.isInterval & {
			aBlock(self.min, operand.min) & {
				aBlock(self.max, operand.max)
			}
		}
	}

	includes { :self :aNumber |
		aNumber.betweenAnd(self.min, self.max)
	}

	intersection { :self :operand |
		operand.isInterval.if {
			self.isDisjoint(operand).if {
				'Interval>>intersection: disjoint Intervals'.error
			} {
				Interval(self.min.max(operand.min), self.max.min(operand.max))
			}
		} {
			operand.adaptToIntervalAndApply(self, intersection:/2)
		}
	}

	isDisjoint { :self :anInterval |
		self.max < anInterval.min | {
			anInterval.max < self.min
		}
	}

	negated { :self |
		self.zero - self
	}

	one { :self |
		1.asInterval
	}

	squared { :self |
		let answer = self * self;
		(answer.min < 0).ifTrue {
			answer.min := 0
		};
		answer
	}

	subdivide { :self :n |
		self.discretize(n + 1)
	}

	storeString { :self |
		'Interval(' ++ self.min ++ ', ' ++ self.max ++ ')'
	}

	union { :self :operand |
		operand.isInterval.if {
			self.isDisjoint(operand).if {
				'Interval>>union: disjoint Intervals'.error
			} {
				Interval(self.min.min(operand.min), self.max.max(operand.max))
			}
		} {
			operand.adaptToIntervalAndApply(self, union:/2)
		}
	}

	zero { :self |
		0.asInterval
	}

}

+@Number {

	-- { :min :max |
		Interval(min, max)
	}

	adaptToIntervalAndApply { :self :anInterval :aBlock:/2 |
		aBlock(anInterval, self.asInterval)
	}

	asInterval { :self |
		Interval(self, self)
	}

	Interval { :min :max |
		(min > max).if {
			'@Number>>Interval: min > max'.error
		} {
			newInterval().initializeSlots(min, max)
		}
	}

}
