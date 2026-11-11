Range : [Object, New, Copy, Store, Equal, Compare, Do, Collection, At, Indices, Sequence, ArithmeticProgression] {

	| start stop step size |

	Range { :self |
		self
	}

	concisePrintString { :self |
		self.literalPrintStringUsing(concisePrintString/1)
	}

	elementType { :self |
		self.start.typeName
	}

	empty { :unused |
		Range(1L, 0L, 1L, 0L)
	}

	isEqualBy { :self :operand :aBlock/2 |
		operand.isRange & {
			aBlock(self.start, operand.start) & {
				aBlock(self.stop, operand.stop) & {
					aBlock(self.step, operand.step)
				}
			}
		}
	}

	isIntegerRange { :self |
		self.start.isIntegerValuedNumber & {
			self.stop.isIntegerValuedNumber & {
				self.step.isIntegerValuedNumber
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

	[negate, -] { :self |
		Range(
			self.start.negate,
			self.stop.negate,
			self.step.negate,
			self.size
		)
	}

	[plus, +] { :self :operand |
		operand.isFloat.if {
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

	literalPrintStringUsing { :self :aBlock/1 |
		(
			self.step.isOne & {
				self.isEmpty.not
			}
		).if {
			'%:%'.format(
				[
					aBlock(self.start),
					aBlock(self.stop)
				]
			)
		} {
			'%:%:%'.format(
				[
					aBlock(self.start),
					aBlock(self.step),
					aBlock(self.stop)
				]
			)
		}
	}

	removeFirst! { :self |
		self.isEmpty.if {
			self.emptyError('removeFirst!')
		} {
			let removed = self.start;
			self.start := self.start + self.step;
			self.size := self.size - 1L;
			removed
		}
	}

	removeLast! { :self |
		self.isEmpty.if {
			self.emptyError('removeLast')
		} {
			let removed = self.stop;
			self.stop := self.stop - self.step;
			self.size := self.size - 1L;
			removed
		}
	}

	reverse { :self |
		self.copy.reverse!
	}

	reverse! { :self |
		let start = self.start;
		self.start := self.last;
		self.stop := start;
		self.step := 0L - self.step;
		self
	}

	sort { :self |
		self.copy.sort!
	}

	sort! { :self |
		(self.step < 0L).ifTrue {
			self.reverse!
		};
		self
	}

	species { :unused |
		nilList/1
	}

	[subtract, -] { :self :operand |
		operand.isFloat.if {
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

}

+@Number {

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
		stop.isSequence.if {
			Range([start], stop, step)
		} {
			let size = inferredRangeSize(start, stop, step);
			Range(start, stop, step, size)
		}
	}

	[Range, to] { :from :to |
		Range(from, to, 1L)
	}

	inferredRangeSize { :start :stop :step |
		let k = (stop - start).quotient(step) + 1L;
		k.isFinite.ifTrue {
			k := Integer(k)
		};
		(step < 0L).if {
			(start < stop).if {
				0L
			} {
				k
			}
		} {
			(stop < start).if {
				0L
			} {
				k
			}
		}
	}

	listRange { :from :to :by |
		to.isSequence.if {
			listRange([from], to, by)
		} {
			List(
				nonEmptyRange(from, to, by)
			)
		}
	}

	listRange { :from :to |
		let by = 1L;
		listRange(from, to, by)
	}

	listThenTo { :from :then :to |
		listRange(from, to, then - from)
	}

	nonEmptyRange { :start :stop :step |
		stop.isSequence.if {
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

	thenTo { :from :then :to |
		Range(from, to, then - from)
	}

	upOrDownTo { :self :stop |
		Range(
			self,
			stop,
			(self <= stop).if {
				1L
			} {
				-1L
			}
		)
	}

}

+[List, Range] {

	[Range, to] { :start :stop :step |
		stop.adaptToCollectionAndApply(start) { :i :j |
			Range(i, j, step)
		}
	}

	[Range, to] { :start :stop |
		Range(start, stop, 1L)
	}

	listRange { :from :to :by |
		to.adaptToCollectionAndApply(from) { :i :j |
			listRange(i, j, by)
		}
	}

	listRange { :from :to |
		let by = 1L;
		listRange(from, to, by)
	}

	listThenTo { :from :then :to |
		listRange(from, to, then - from)
	}

	nonEmptyRange { :start :stop :step |
		stop.adaptToCollectionAndApply(start) { :i :j |
			nonEmptyRange(i, j, step)
		}
	}

	nonEmptyRange { :start :stop |
		nonEmptyRange(start, stop, 1L)
	}

	upOrDownTo { :start :stop |
		stop.adaptToCollectionAndApply(start, upOrDownTo/2)
	}

}

+@Number {

	FiniteRange { :start :stop :step :size |
		(
			start.isFinite & {
				stop.isFinite & {
					step.isZero.not & {
						size.isFinite
					} & {
						let calculatedStop = start + (step * (size - 1L));
						calculatedStop.isVeryClose(stop)
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
