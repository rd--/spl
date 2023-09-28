RunArray : [Object, Indexable] { | runs values cachedIndex cachedRun cachedOffset |

	= { :self :anObject |
		(self == anObject).if {
			true
		} {
			anObject.isRunArray & {
				self.runs.hasEqualElements(anObject.runs)
			} & {
				self.values.hasEqualElements(anObject.values)
			}
		}
	}

	asArray { :self |
		self.Array
	}

	Array { :self |
		| answer = Array(self.size); |
		self.withIndexDo { :each :index |
			answer[index] := each
		};
		answer
	}

	allocatedSize { :self |
		self.runs.size * 2 + 3
	}

	at { :self :index |
		self.atSetRunOffsetAndValue(index) { :run :offset :value |
			(offset < 0).ifTrue {
				self.errorInvalidIndex('at', index)
			};
			(offset >= self.runs[run]).ifTrue{
				self.indexError(index)
			};
			value
		}
	}

	atSetRunOffsetAndValue { :self :index :aBlock:/3 |
		| run limit offset |
		limit := self.runs.size;
		(self.cachedIndex == nil | {
			index < self.cachedIndex
		}).if {
			run := 1;
			offset := index - 1
		} {
			run := self.cachedRun;
			offset := self.cachedOffset + (index - self.cachedIndex)
		};
		{ run <= limit & { offset >= self.runs[run] } }.whileTrue {
			offset -:= self.runs[run];
			run +:= 1
		};
		self.cachedIndex := index;
		self.cachedRun := run;
		self.cachedOffset := offset;
		(run > limit).ifTrue {
			run -:= 1;
			offset +:= self.runs[run]
		};
		aBlock(run, offset, self.values[run])
	}

	Bag { :self |
		| answer = Bag(); |
		self.runsAndValuesDo { :run :value |
			answer.addWithOccurrences(value, run)
		};
		answer
	}

	do { :self :aBlock:/1 |
		1.toDo(self.runs.size) { :index |
			| run = self.runs[index], value = self.values[index]; |
			{
				run -:= 1;
				run >= 0
			}.whileTrue {
				aBlock(value)
			}
		}
	}

	first { :self |
		self.values[1]
	}

	includes { :self :anObject |
		self.values.includes(anObject)
	}

	isSorted { :self |
		self.values.isSorted
	}

	isSortedBy { :self :aBlock:/2 |
		self.values.isSortedBy(aBlock:/2)
	}

	last { :self |
		self.values[self.values.size]
	}

	postCopy { :self |
		self.runs := self.runs.copy;
		self.values := self.values.copy
	}

	reversed { :self |
		RunArray(self.runs.reversed, self.values.reversed)
	}

	runLengthAt { :self :index |
		self.atSetRunOffsetAndValue(index) { :run :offset :value |
			self.runs[run] - offset
		}
	}

	runsAndValuesDo { :self :aBlock:/2 |
		self.runs.withDo(self.values, aBlock:/2)
	}

	Set  { :self |
		self.values.Set
	}

	size { :self |
		self.runs.sum
	}

	withIndexDo { :self :aBlock:/2 |
		| index = 0; |
		1.toDo(self.runs.size) { :runIndex |
			| run = self.runs[runIndex], value = self.values[runIndex]; |
			{ (run := run - 1) >= 0 }.whileTrue {
				index +:= 1;
				aBlock(value, index)
			}
		}
	}

	withStartStopAndValueDo { :self :aBlock:/3 |
		| start = 1; |
		self.runs.withDo(self.values) { :length :value |
			| stop = start + length - 1; |
			aBlock(start, stop, value);
			start := stop + 1
		}
	}

}

+@Sequenceable {

	RunArray { :self |
		RunArray(self.collect(key:/1), self.collect(value:/1))
	}

	RunArray { :self :values |
		newRunArray().initializeSlots(self, values, nil, nil, nil)
	}

}
