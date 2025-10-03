Interval : [Object, Copyable, Equatable, Comparable, Magnitude, Number] { | min max |

	< { :self :operand |
		operand.isInterval.if {
			self.min < operand.min & {
				self.max < operand.max
			}
		} {
			operand.adaptToIntervalAndApply(self, <)
		}
	}

	+ { :self :operand |
		operand.isInterval.if {
			Interval(
				self.min + operand.min,
				self.max + operand.max
			)
		} {
			operand.adaptToIntervalAndApply(self, +)
		}
	}

	- { :self :operand |
		operand.isInterval.if {
			Interval(
				self.min - operand.min,
				self.max - operand.max
			)
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
				self.negate
			} {
				Interval(0, self.min.negate.max(self.max))
			}
		}
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		aBlock(aNumber.asInterval, self)
	}

	atRandom { :self |
		system.nextRandomFloat(self.min, self.max)
	}

	between { :self |
		let min = self.min;
		let max = self.max;
		{ :x |
			min <= x & {
				x <= max
			}
		}
	}

	betweenAnd { :self :min :max |
		min <= self.min & {
			self.max <= max
		}
	}

	centre { :self |
		(self.min + self.max) / 2
	}

	discretize { :self :size :aBlock:/1 |
		self.discretize(size).collect(aBlock:/1)
	}

	discretize { :self :size |
		let start = self.min;
		let stop = self.max;
		let step = (stop - start) / (size - 1);
		Range(start, stop, step)
	}

	equalBy { :self :operand :aBlock:/2 |
		operand.isInterval & {
			aBlock(self.min, operand.min) & {
				aBlock(self.max, operand.max)
			}
		}
	}

	findDivisions { :self :dx :n |
		let step = ((self.max - self.min) / (n + 1)).roundUp(dx);
		let next = self.min.roundDown(dx);
		let answer = [next];
		{ next < self.max }.whileTrue {
			next := next + step;
			answer.add(next)
		};
		answer
	}

	findDivisions { :self :n |
		let min = self.min;
		let max = self.max;
		let range = (max - min).niceNumberAbove;
		let step = (range / n).niceNumberNear;
		let start = (min / step).floor * step;
		let end = (max / step).ceiling * step;
		Range(start, end, step)
	}

	includes { :self :operand |
		operand.betweenAnd(self.min, self.max)
	}

	intersection { :self :operand |
		operand.isInterval.if {
			self.isDisjoint(operand).if {
				'Interval>>intersection: disjoint Intervals'.error
			} {
				Interval(
					self.min.max(operand.min),
					self.max.min(operand.max)
				)
			}
		} {
			operand.adaptToIntervalAndApply(self, intersection:/2)
		}
	}

	isCloseToBy { :self :anInterval :epsilon |
		self.min.isCloseToBy(anInterval.min, epsilon) & {
			self.max.isCloseToBy(anInterval.max, epsilon)
		}
	}

	isDegenerate { :self |
		self.min = self.max
	}

	isDisjoint { :self :anInterval |
		self.max < anInterval.min | {
			anInterval.max < self.min
		}
	}

	isIntersecting { :self :anInterval |
		self.max > anInterval.min | {
			anInterval.max > self.min
		}
	}

	minMax { :self |
		[self.min, self.max]
	}

	negate { :self |
		self.zero - self
	}

	one { :self |
		1.asInterval
	}

	printString { :self |
		'(' ++ self.min ++ ' -- ' ++ self.max ++ ')'
	}

	radius { :self |
		(self.max - self.min).abs / 2
	}

	square { :self |
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
		self.storeStringAsInitializeSlots
	}

	union { :self :operand |
		operand.isInterval.if {
			self.isDisjoint(operand).if {
				'Interval>>union: disjoint Intervals'.error
			} {
				Interval(
					self.min.min(operand.min),
					self.max.max(operand.max)
				)
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
			[min, max].error('Interval: min > max')
		} {
			newInterval().initializeSlots(min, max)
		}
	}

}
