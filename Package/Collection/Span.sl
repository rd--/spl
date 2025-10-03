Span : [Object, Equatable, Comparable, Iterable, Collection, Indexable, Sequenceable, ArithmeticProgression] { | start stop step |

	asRange { :self |
		self.isRelative.if {
			self.error('asRange: relative span')
		} {
			Range(self.start, self.stop, self.step)
		}
	}

	asRange { :self :extent |
		self.isRelative.if {
			let start = self.start;
			let stop = self.stop;
			(start < 1).ifTrue {
				start := extent - start.abs + 1
			};
			(stop < 1).ifTrue {
				stop := extent - stop.abs + 1
			};
			Range(start, stop, self.step)
		} {
			Range(self.start, self.stop, self.step)
		}
	}

	asSpan { :self |
		self
	}

	equalBy { :self :anObject :aBlock:/2 |
		self.hasEqualSlots(anObject, aBlock:/2)
	}

	isRelative { :self |
		let start = self.start;
		let stop = self.stop;
		let step = self.step;
		let relativeStart = start.isNegative & { stop.isPositive & { step.isNegative } };
		let relativeStop = start.isPositive & { stop.isNegative & { step.isPositive } };
		relativeStart || relativeStop
	}

	partIndex { :self :operand |
		operand.atAll(self.asRange(operand.size))
	}

	size { :self |
		self.isRelative.if {
			self.error('size: relative span')
		} {
			self.asRange.size
		}
	}

	species { :self |
		List:/1
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+SmallFloat {

	basicSpan { :start :stop :step |
		[start, stop, step].allSatisfy(isInteger:/1).if {
			newSpan().initializeSlots(start, stop, step)
		} {
			start.error('SmallFloat>>Span: invalid operand?')
		}
	}

	Span { :start :stop :step |
		let span = basicSpan(start, stop, step);
		span.isRelative.if {
			span
		} {
			span.asRange
		}
	}

}
