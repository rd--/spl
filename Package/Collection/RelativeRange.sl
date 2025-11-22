RelativeRange : [Object, Storeable, Equatable, Comparable, Iterable, Collection, Indexable, Sequenceable, ArithmeticProgression] { | start stop step |

	asRange { :self :extent |
		let start = self.start;
		let stop = self.stop;
		(start < 1).ifTrue {
			start := extent - start.abs + 1
		};
		(stop < 1).ifTrue {
			stop := extent - stop.abs + 1
		};
		Range(start, stop, self.step)
	}


	equalBy { :self :anObject :aBlock:/2 |
		self.hasEqualSlots(anObject, aBlock:/2)
	}

	isSorted { :self |
		self.stop < 1
	}

	partIndex { :self :operand |
		operand.atAll(self.asRange(operand.size))
	}

	size { :self |
		self.error('size')
	}

	species { :self |
		List:/1
	}

}

+@Integer {

	isIntegerRange { :start :stop :step |
		[start stop step].allSatisfy(isInteger:/1)
	}

	isRelativeRange { :start :stop :step |
		let relativeStart = start.isNegative & {
			stop.isPositive & {
				step.isNegative
			}
		};
		let relativeStop = start.isPositive & {
			stop.isNegative & {
				step.isPositive
			}
		};
		relativeStart || relativeStop
	}

	rangeOrRelativeRange { :start :stop :step |
		isRelativeRange(start, stop, step).if {
			RelativeRange(start, stop, step)
		} {
			Range(start, stop, step)
		}
	}

	RelativeRange { :start :stop :step |
		(
			isRelativeRange(start, stop, step) & {
				isIntegerRange(start, stop, step)
			}
		).if {
			newRelativeRange().initializeSlots(start, stop, step)
		} {
			[start, stop, step].error('RelativeRange')
		}
	}

}

+List {

	RelativeRange { :self |
		let [start, stop, step] = self;
		RelativeRange(start, stop, step)
	}

}
