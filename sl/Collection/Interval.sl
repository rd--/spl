Interval : [Object, Iterable, Collection, Indexable, Sequenceable] { | start stop step |

	= { :self :anInterval |
		anInterval.isInterval & {
			self.start = anInterval.start & {
				self.stop = anInterval.stop & {
					self.step = anInterval.step
				}
			}
		}
	}

	+ { :self :arg |
		arg.isSmallFloat.if {
			Interval(self.start + arg, self.stop + arg, self.step)
		} {
			arg.adaptToCollectionAndApply(self, plus:/2)
		}
	}

	- { :self :arg |
		arg.isSmallFloat.if {
			Interval(self.start - arg, self.stop - arg, self.step)
		} {
			arg.adaptToCollectionAndApply(self, minus:/2)
		}
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aBlock(aCollection, self.asArray)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		self.collect { :each |
			aBlock(aNumber, each)
		}
	}

	asArray { :self |
		self.collect(identity:/1)
	}

	at { :self :index |
		self.includesIndex(index).if {
			self.step * (index - 1) + self.start
		} {
			self.errorInvalidIndex('at', index)
		}
	}

	basicAt { :self :index |
		self.step * (index - 1) + self.start
	}

	collect { :self :aBlock:/1 |
		| result = Array(self.size), index = 1; |
		self.do { :nextValue |
			result[index] := aBlock(nextValue);
			index +:= 1
		};
		result
	}

	copyFromTo { :self :startIndex :stopIndex |
		(startIndex = 1 & { stopIndex = self.size }).if {
			self
		} {
			self[startIndex].toBy(self[stopIndex], self.step)
		}
	}

	do { :self :aBlock:/1 |
		| nextValue = self.start, endValue = self.stop; |
		(self.step > 0).if {
			{ nextValue <= endValue }.whileTrue {
				aBlock(nextValue);
				nextValue +:= self.step
			}
		} {
			{ nextValue >= endValue }.whileTrue {
				aBlock(nextValue);
				nextValue +:= self.step
			}
		};
		self
	}

	increment { :self |
		self.step
	}

	isEmpty { :self |
		self.size = 0
	}

	last { :self |
		self.ifEmpty {
			'last: empty interval'
		} {
			self.stop - (self.stop - self.start % self.step)
		}
	}

	permutationsDo { :self :aBlock:/1 |
		self.asArray.permutationsDo(aBlock:/1)
	}

	printString { :self |
		(self.step = 1).if {
			'(' ++ self.start ++ ' .. ' ++ self.stop ++ ')'
		} {
			self.storeString
		}
	}

	removeFirst { :self |
		self.isEmpty.if {
			self.error('removeFirst: empty interval')
		} {
			| removed = self.start; |
			self.start +:= self.step;
			removed
		}
	}

	removeLast { :self |
		self.isEmpty.if {
			self.error('removeLast: empty interval')
		} {
			| removed = self.stop; |
			self.stop -:= self.step;
			removed
		}
	}

	reversed { :self |
		self.isEmpty.if {
			Interval(self.stop, self.start, self.step.negated)
		} {
			Interval(self.last, self.start, self.step.negated)
		}
	}

	reverseDo { :self :aBlock:/1 |
		|(
			each = self.last,
			predicate = (self.step < 0).if {
				{ self.start >= each }
			} {
				{ self.start <= each }
			}
		)|
		predicate.whileTrue {
			aBlock(each);
			each -:= self.step
		}
	}

	size { :self |
		| derived = (self.stop - self.start).quotient(self.step) + 1; |
		(self.step < 0).if {
			(self.start < self.stop).if {
				0
			} {
				derived
			}
		} {
			(self.stop < self.start).if {
				0
			} {
				derived
			}
		}
	}

	sorted { :self |
		(self.step < 0).if {
			self.reversed
		} {
			self
		}
	}

	species { :self |
		Array:/1
	}

	storeString { :self |
		[
			'Interval(',
			self.start,
			', ',
			self.stop,
			', ',
			self.step,
			')'
		].join
	}

	sum { :self |
		self.size * ((self.size - 1) * self.step + (self.start * 2)) / 2
	}

}

+@Number {

	-- { :self :stop |
		self.upTo(stop)
	}

	downTo { :self :stop |
		(stop > self).ifTrue {
			self.error('downTo: non descending')
		};
		Interval(self, stop, -1)
	}

	Interval { :start :stop :step |
		newInterval().initializeSlots(start, stop, step)
	}

	thenTo { :self :second :last |
		Interval(self, last, second - self)
	}

	to { :self :stop |
		Interval(self, stop, 1)
	}

	toBy { :self :stop :step |
		Interval(self, stop, step)
	}

	upOrDownTo { :self :stop |
		Interval(
			self,
			stop,
			(self <= stop).if {
				1
			} {
				-1
			}
		)
	}

	upTo { :self :stop |
		(stop < self).ifTrue {
			self.error('upTo: non ascending')
		};
		Interval(self, stop, 1)
	}

}
