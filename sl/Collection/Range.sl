Range : [Object, Iterable, Collection, Indexable, Sequence] { | start stop step |

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
			Range(self.start + operand, self.stop + operand, self.step)
		} {
			operand.adaptToCollectionAndApply(self, +)
		}
	}

	- { :self :operand |
		operand.isSmallFloat.if {
			Range(self.start - operand, self.stop - operand, self.step)
		} {
			operand.adaptToCollectionAndApply(self, -)
		}
	}

	adaptToCollectionAndApply { :self :aCollection :aBlock:/2 |
		aBlock(aCollection, self.asList)
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		self.collect { :each |
			aBlock(aNumber, each)
		}
	}

	asList { :self |
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
		let result = List(self.size);
		let index = 1;
		self.do { :nextValue |
			result[index] := aBlock(nextValue);
			index := index + 1
		};
		result
	}

	copyFromTo { :self :startIndex :stopIndex |
		(startIndex = 1 & {
			stopIndex = self.size
		}).if {
			self
		} {
			self[startIndex].toBy(self[stopIndex], self.step)
		}
	}

	do { :self :aBlock:/1 |
		let nextValue = self.start;
		let endValue = self.stop;
		(self.step > 0).if {
			{
				nextValue <= endValue
			}.whileTrue {
				aBlock(nextValue);
				nextValue := nextValue + self.step
			}
		} {
			{
				nextValue >= endValue
			}.whileTrue {
				aBlock(nextValue);
				nextValue := nextValue + self.step
			}
		};
		self
	}

	emptyError { :self :methodName |
		self.error('Range>>' ++ methodName ++ ': empty')
	}

	increment { :self |
		self.step
	}

	isEmpty { :self |
		self.size = 0
	}

	last { :self |
		self.ifEmpty {
			self.emptyError('last')
		} {
			self.stop - (self.stop - self.start % self.step)
		}
	}

	permutationsDo { :self :aBlock:/1 |
		self.asList.permutationsDo(aBlock:/1)
	}

	printString { :self |
		(self.step = 1).if {
			self.start.printString ++ ':' ++ self.stop.printString
		} {
			self.storeString
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
			Range(self.stop, self.start, self.step.negated)
		} {
			Range(self.last, self.start, self.step.negated)
		}
	}

	reverseDo { :self :aBlock:/1 |
		let each = self.last;
		let predicate = (self.step < 0).if {
			{ self.start >= each }
		} {
			{ self.start <= each }
		};
		predicate.whileTrue {
			aBlock(each);
			each := each - self.step
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
		[
			'Range(',
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

	downTo { :self :stop |
		(stop > self).ifTrue {
			self.error('downTo: non descending')
		};
		Range(self, stop, -1)
	}

	Range { :start :stop :step |
		step.isZero.if {
			start.error('Number>>Range: step is zero')
		} {
			newRange().initializeSlots(start, stop, step)
		}
	}

	thenTo { :self :second :last |
		Range(self, last, second - self)
	}

	to { :self :stop |
		Range(self, stop, 1)
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

	upTo { :self :stop |
		(stop < self).ifTrue {
			self.error('upTo: non ascending')
		};
		Range(self, stop, 1)
	}

}
