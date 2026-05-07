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
		self.rangeSyntaxString
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

	rangeSyntaxString { :self |
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

	nonemptyRange { :start :stop :step |
		let r = Range(start, stop, step);
		r.isEmpty.ifTrue {
			r.error('nonemptyRange: invalid (empty) range')
		};
		r
	}

	nonemptyThenTo { :start :then :stop |
		nonemptyRange(start, stop, then - start)
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
		let size = inferredRangeSize(start, stop, step);
		Range(start, stop, step, size)
	}

	thenTo { :self :second :last |
		Range(self, last, second - self)
	}

	to { :self :stop |
		stop.isSequenceable.if {
			[self].to(stop)
		} {
			Range(self, stop, 1)
		}
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

+List {

	Range { :self |
		self.size.caseOf(
			[
				3 -> { Range(self[1], self[2], self[3]) },
				4 -> { Range(self[1], self[2], self[3], self[4]) }
			]
		)
	}

}

+[List, Range] {

	nonemptyRange { :start :stop :step |
		stop.adaptToCollectionAndApply(start) { :i :j |
			nonemptyRange(i, j, step)
		}
	}

	to { :start :stop |
		stop.adaptToCollectionAndApply(start, to:/2)
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
