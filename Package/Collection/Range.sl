Range : [Object, Storeable, Equatable, Comparable, Iterable, Collection, Indexable, Sequenceable, ArithmeticProgression] { | start stop step size |

	[negate, -] { :self |
		Range(
			self.start.negate,
			self.stop.negate,
			self.step.negate,
			self.size
		)
	}

	[plus, +] { :self :operand |
		operand.isSmallFloat.if {
			Range(
				self.start + operand,
				self.stop + operand,
				self.step,
				self.size
			)
		} {
			operand.adaptToCollectionAndApply(self, +)
		}
	}

	[subtract, -] { :self :operand |
		operand.isSmallFloat.if {
			Range(
				self.start - operand,
				self.stop - operand,
				self.step,
				self.size
			)
		} {
			operand.adaptToCollectionAndApply(self, -)
		}
	}

	asRange { :self |
		self
	}

	concisePrintString { :self |
		self.rangeLiteralSyntaxString
	}

	elementType { :self |
		self.start.typeOf
	}

	empty { :unused |
		Range(1, 0, 1, 0)
	}

	equalBy { :self :operand :aBlock:/2 |
		operand.isRange & {
			aBlock(self.start, operand.start) & {
				aBlock(self.stop, operand.stop) & {
					aBlock(self.step, operand.step)
				}
			}
		}
	}

	isIntegerRange { :self |
		self.start.isInteger & {
			self.stop.isInteger & {
				self.step.isInteger
			}
		}
	}

	isNormal { :self |
		self.isProper & {
			self.start <= self.stop
		}
	}

	isProper { :self |
		self.isEmpty.not & {
			self.stop ~ self.last
		}
	}

	rangeLiteralSyntaxString { :self |
		(
			self.step = 1 & {
				self.isEmpty.not
			}
		).if {
			'%:%'.format(
				[
					self.start,
					self.stop
				]
			)
		} {
			'%:%:%'.format(
				[
					self.start.printString,
					self.step.printString,
					self.stop.printString
				]
			)
		}
	}

	removeFirst { :self |
		self.isEmpty.if {
			self.emptyError('removeFirst')
		} {
			let removed = self.start;
			self.start := self.start + self.step;
			self.size := self.size - 1;
			removed
		}
	}

	removeLast { :self |
		self.isEmpty.if {
			self.emptyError('removeLast')
		} {
			let removed = self.stop;
			self.stop := self.stop - self.step;
			self.size := self.size - 1;
			removed
		}
	}

	reverseInPlace { :self |
		let start = self.start;
		self.start := self.last;
		self.stop := start;
		self.step := 0 - self.step;
		self
	}

	reverse { :self |
		self.copy.reverseInPlace
	}

	sort { :self |
		(self.step < 0).ifTrue {
			self.reverseInPlace
		};
		self
	}

	sorted { :self |
		self.copy.sort
	}

	species { :self |
		List:/1
	}

}

+@Number {

	inferredRangeSize { :start :stop :step |
		let k = (stop - start).quotient(step) + 1;
		k := k.normal;
		(step < 0).if {
			(start < stop).if {
				0
			} {
				k
			}
		} {
			(stop < start).if {
				0
			} {
				k
			}
		}
	}

	listRange { :start :stop :step |
		stop.isSequenceable.if {
			listRange([start], stop, step)
		} {
			nonEmptyRange(start, stop, step).asList
		}
	}

	listRange { :start :stop |
		listRange(start, stop, 1)
	}

	nonEmptyRange { :start :stop :step |
		stop.isSequenceable.if {
			nonEmptyRange([start], stop, step)
		} {
			let r = Range(start, stop, step);
			r.isEmpty.ifTrue {
				r.error('nonEmptyRange: invalid (empty) range')
			};
			r
		}
	}

	nonEmptyThenTo { :start :then :stop |
		nonEmptyRange(start, stop, then - start)
	}

	Range { :start :stop :step :size |
		step.isZero.ifTrue {
			start.error('@Number>>Range: step is zero')
		};
		start.isFinite.ifFalse {
			start.error('@Number>>Range: start is not finite')
		};
		newRange().initializeSlots(start, stop, step, size)
	}

	[Range, to, toBy] { :start :stop :step |
		stop.isSequenceable.if {
			Range([self], stop, step)
		} {
			let size = inferredRangeSize(start, stop, step);
			Range(start, stop, step, size)
		}
	}

	[Range, to] { :self :stop |
		Range(self, stop, 1)
	}

	thenTo { :self :second :last |
		Range(self, last, second - self)
	}

	upOrDownTo { :self :stop |
		Range(
			self,
			stop,
			(self <= stop).if {
				1
			} {
				-1
			}
		)
	}

}

+[List, Range] {

	listRange { :start :stop :step |
		stop.adaptToCollectionAndApply(start) { :i :j |
			listRange(i, j, step)
		}
	}

	listRange { :start :stop |
		listRange(start, stop, 1)
	}

	nonEmptyRange { :start :stop :step |
		stop.adaptToCollectionAndApply(start) { :i :j |
			nonEmptyRange(i, j, step)
		}
	}

	nonEmptyRange { :start :stop |
		nonEmptyRange(start, stop, 1)
	}

	[Range, to] { :start :stop :step |
		stop.adaptToCollectionAndApply(start) { :i :j |
			Range(i, j, step)
		}
	}

	[Range, to] { :start :stop |
		Range(start, stop, 1)
	}

	upOrDownTo { :start :stop |
		stop.adaptToCollectionAndApply(start, upOrDownTo:/2)
	}

}

+@Number {

	FiniteRange { :start :stop :step :size |
		(
			start.isFinite & {
				stop.isFinite & {
					step != 0 & {
						size.isFinite
					} & {
						let calculatedStop = start + (step * (size - 1));
						calculatedStop.isVeryCloseTo(stop)
					}
				}
			}
		).if {
			Range(start, stop, step, size)
		} {
			start.error('FiniteRange')
		}
	}

}

+List {

	FiniteRange { :self |
		let [start, stop, step, size] = self;
		FiniteRange(start, stop, step, size)
	}

}
