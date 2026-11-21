/* Requires: Float Fraction Integer List */

Interval : [Object, Store, Equal, Compare, Number] {

	| min max |

	[absoluteValue, abs] { :self |
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

	[adaptToNumberAndApply, adaptToIntegerAndApply] { :self :operand :aFunction/2 |
		aFunction(Interval(operand, operand), self)
	}

	atRandom { :self |
		system.nextRandomFloat(self.min, self.max)
	}

	between { :self |
		let min = self.min;
		let max = self.max;
		{ :x |
			x.isBetween(min, max)
		}
	}

	[center, midpoint] { :self |
		(self.min + self.max) / 2
	}

	checkInterval { :self |
		(self.min > self.max).ifTrue {
			self.error('checkInterval: min > max')
		};
		self
	}

	concisePrintString { :self |
		self.literalPrintStringUsing(concisePrintString/1)
	}

	discretize { :self :size :aFunction/1 |
		self.discretize(size).collect(aFunction/1)
	}

	discretize { :self :size |
		let start = self.min;
		let stop = self.max;
		let step = (stop - start) / (size - 1L);
		FiniteRange(start, stop, step, size)
	}

	[divide, /] { :self :operand |
		self * operand.reciprocal
	}

	findDivisions { :self :dx :n |
		let step = ((self.max - self.min) / (n + 1L)).roundUp(dx);
		let next = self.min.roundDown(dx);
		let answer = [next];
		{
			next < self.max
		}.whileTrue {
			next := next + step;
			answer.add!(next)
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
		operand.isBetween(self.min, self.max)
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
			operand.adaptToIntervalAndApply(self, intersection/2)
		}
	}

	isBetween { :self :min :max |
		min <= self.min & {
			self.max <= max
		}
	}

	isCloseBy { :self :anInterval :epsilon |
		self.min.isCloseBy(anInterval.min, epsilon) & {
			self.max.isCloseBy(anInterval.max, epsilon)
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

	isEqualBy { :self :operand :aFunction/2 |
		operand.isInterval & {
			aFunction(self.min, operand.min) & {
				aFunction(self.max, operand.max)
			}
		}
	}

	isIntersecting { :self :anInterval |
		self.max > anInterval.min | {
			anInterval.max > self.min
		}
	}

	[isLess, <] { :self :operand |
		operand.isInterval.if {
			isLess(self.max, operand.min)
		} {
			operand.adaptToIntervalAndApply(self, isLess/2)
		}
	}

	literalPrintStringUsing { :self :aFunction/1 |
		'(% -- %)'.format(
			[
				aFunction(self.min),
				aFunction(self.max)
			]
		)
	}

	[lowerBound, infimum] { :self |
		self.min
	}

	[median, mean] { :self |
		(self.min + self.max) / 2
	}

	[minimumMaximum, endPoints, minMax] { :self |
		[self.min, self.max]
	}

	[negate, -] { :self |
		self.zero - self
	}

	one { :self |
		let one = self.min.one;
		Interval(one, one)
	}

	[plus, +] { :self :operand |
		operand.isInterval.if {
			Interval(
				self.min + operand.min,
				self.max + operand.max
			)
		} {
			operand.adaptToIntervalAndApply(self, +)
		}
	}

	printString { :self |
		self.literalPrintStringUsing(printString/1)
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

	[subtract, -] { :self :operand |
		operand.isInterval.if {
			Interval(
				self.min - operand.min,
				self.max - operand.max
			)
		} {
			operand.adaptToIntervalAndApply(self, -)
		}
	}

	[times, *] { :self :operand |
		operand.isInterval.if {
			let products = ([self.min, self.max] *.outer [operand.min, operand.max]).flatten;
			Interval(products.min, products.max)
		} {
			operand.adaptToIntervalAndApply(self, *)
		}
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
			operand.adaptToIntervalAndApply(self, union/2)
		}
	}

	[upperBound, supremum] { :self |
		self.max
	}

	[width, range] { :self |
		self.max - self.min
	}

	zero { :self |
		let zero = self.zero;
		Interval(zero, zero)
	}

}

+Float {

	[Interval, --] { :self :operand |
		operand.isFloat.if {
			uncheckedInterval(self, operand).checkInterval
		} {
			operand.adaptToNumberAndApply(self, Interval/2)
		}
	}

}

+Fraction {

	[Interval, --] { :self :operand |
		operand.isFraction.if {
			uncheckedInterval(self, operand).checkInterval
		} {
			operand.adaptToFractionAndApply(self, Interval/2)
		}
	}

}

+Integer {

	[Interval, --] { :self :operand |
		operand.isInteger.if {
			uncheckedInterval(self, operand).checkInterval
		} {
			operand.adaptToIntegerAndApply(self, Interval/2)
		}
	}

}

+[Float, Fraction, Integer] {

	adaptToIntervalAndApply { :self :operand :aFunction/2 |
		aFunction(operand, Interval(self, self))
	}

	centeredInterval { :center :range |
		Interval(center - range, center + range)
	}

	numberToInterval { :self |
		Interval(self, self)
	}

	uncheckedInterval { :self :operand |
		newInterval().initializeSlots(self, operand)
	}

}

+List {

	Interval { :self :operand |
		operand.adaptToCollectionAndApply(self, Interval/2)
	}

	centeredInterval { :center :range |
		range.adaptToCollectionAndApply(center, centeredInterval/2)
	}

	[intervalOrComplexInterval, --] { :self :operand |
		operand.adaptToCollectionAndApply(self, --)
	}

}
