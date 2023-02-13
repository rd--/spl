Interval : [Object, Collection, SequenceableCollection] { | start stop step |

	species { :self |
		Array:/1
	}

	printString { :self |
		'Interval(' ++ self.start ++ ', ' ++ self.stop ++ ', ' ++ self.step ++ ')'
	}

	= { :self :anInterval |
		self.start = anInterval.start & {
			self.stop = anInterval.stop & {
				self.step = anInterval.step
			}
		}
	}

	size { :self |
		| derive = (self.stop - self.start).quotient(self.step) + 1; |
		(self.step < 0).if {
			(self.start < self.stop).if {
				0
			} {
				derive
			}
		} {
			(self.stop < self.start).if {
				0
			} {
				derive
			}
		}
	}

	isEmpty { :self |
		self.size = 0
	}

	at { :self :index |
		if ((index < 1) | { index > self.size }, {
			nil
		}, {
			self.step * (index - 1) + self.start
		})
	}

	do { :self :aProcedure:/1 |
		| nextValue = self.start, endValue = self.stop; |
		(self.step > 0).if {
			{ nextValue <= endValue }.whileTrue {
				aProcedure(nextValue);
				nextValue := nextValue + self.step
			}
		} {
			{ nextValue >= endValue }.whileTrue {
				aProcedure(nextValue);
				nextValue := nextValue + self.step
			}
		}
	}

	collect { :self :aProcedure:/1 |
		| result = Array(self.size), index = 1; |
		self.do { :nextValue |
			result[index] := aProcedure(nextValue);
			index := index + 1
		};
		result
	}

	asArray { :self |
		self.collect(identity:/1)
	}

	sum { :self |
		self.size * ((self.size - 1) * self.step + (self.start * 2)) / 2
	}

	first { :self |
		self.start
	}

	second { :self |
		self.start + self.step
	}

	last { :self |
		self.stop - (self.stop - self.start % self.step)
	}

	reversed { :self |
		self.isEmpty.if {
			Interval(self.stop, self.start, self.step.negated)
		} {
			Interval(self.last, self.start, self.step.negated)
		}
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aProcedure(aCollection, self.asArray)
	}

	adaptToNumberAndApply { :self :aNumber :aProcedure:/2 |
		self.collect { :each |
			aProcedure(aNumber, each)
		}
	}

}

+ Number {

	thenTo { :self :second :last |
		Interval(self, last, second - self)
	}

	Interval { :start :stop :step |
		newInterval().initialize(start, stop, step)
	}

	to { :self :stop |
		Interval(self, stop, if(self <= stop) { 1 } { -1 })
	}

	toBy { :self :stop :step |
		Interval(self, stop, step)
	}

}
