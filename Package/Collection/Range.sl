Range : [Object, Iterable, Collection, Indexable, Sequenceable, ArithmeticProgression] { | start stop step |

	= { :self :operand |
		operand.isRange & {
			self.start = operand.start & {
				self.stop = operand.stop & {
					self.step = operand.step
				}
			}
		}
	}

	+ { :self :operand |
		operand.isSmallFloat.if {
			Range(
				self.start + operand,
				self.stop + operand,
				self.step
			)
		} {
			operand.adaptToCollectionAndApply(self, +)
		}
	}

	- { :self |
		self.negated
	}

	- { :self :operand |
		operand.isSmallFloat.if {
			Range(
				self.start - operand,
				self.stop - operand,
				self.step
			)
		} {
			operand.adaptToCollectionAndApply(self, -)
		}
	}

	asRange { :self |
		self
	}

	asSpan { :self |
		Span(self.start, self.stop, self.step)
	}

	concisePrintString { :self |
		self.rangeSyntaxString
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

	isMatrix { :unused |
		false
	}

	isRegularlySpaced { :unused |
		true
	}

	isVector { :unused |
		true
	}

	negated { :self |
		Range(
			self.start.negated,
			self.stop.negated,
			self.step.negated
		)
	}

	rangeSyntaxString { :self |
		(
			self.step = 1 & {
				self.isEmpty.not
			}
		).if {
			'%:%'.format([
				self.start,
				self.stop
			])
		} {
			'%:%:%'.format([
				self.start.printString,
				self.step.printString,
				self.stop.printString
			])
		}
	}

	removeFirst { :self |
		self.isEmpty.if {
			self.emptyError('removeFirst')
		} {
			let removed = self.start;
			self.start := self.start + self.step;
			removed
		}
	}

	removeLast { :self |
		self.isEmpty.if {
			self.emptyError('removeLast')
		} {
			let removed = self.stop;
			self.stop := self.stop - self.step;
			removed
		}
	}

	reversed { :self |
		self.isEmpty.if {
			Range(
				self.stop,
				self.start,
				self.step.negated
			)
		} {
			Range(
				self.last,
				self.start,
				self.step.negated
			)
		}
	}

	size { :self |
		let derived = (self.stop - self.start).quotient(self.step) + 1;
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
		List:/1
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+@Number {

	Range { :start :stop :step |
		step.isZero.if {
			start.error('@Number>>Range: step is zero')
		} {
			newRange().initializeSlots(start, stop, step)
		}
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

	toBy { :self :stop :step |
		Range(self, stop, step)
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
		let [start, stop, step] = self;
		Range(start, stop, step)
	}

}

+[List, Range] {

	to { :self :stop |
		stop.adaptToCollectionAndApply(self, to:/2)
	}

	upOrDownTo { :self :stop |
		stop.adaptToCollectionAndApply(self, upOrDownTo:/2)
	}

}
