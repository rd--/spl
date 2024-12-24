RunArray : [Object, Indexable] { | runs values cachedIndex cachedRun cachedOffset |

	= { :self :anObject |
		(self == anObject).if {
			true
		} {
			anObject.isRunArray & {
				self.runs.hasEqualElements(anObject.runs) & {
					self.values.hasEqualElements(anObject.values)
				}
			}
		}
	}

	asList { :self |
		let answer = List(self.size);
		self.withIndexDo { :each :index |
			answer[index] := each
		};
		answer
	}

	asBag { :self |
		let answer = Bag();
		self.runsAndValuesDo { :run :value |
			answer.addWithOccurrences(value, run)
		};
		answer
	}

	asSet  { :self |
		self.values.asSet
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
		let limit = self.runs.size;
		let run = nil;
		let offset = nil;
		(self.cachedIndex == nil | {
			index < self.cachedIndex
		}).if {
			run := 1;
			offset := index - 1
		} {
			run := self.cachedRun;
			offset := self.cachedOffset + (index - self.cachedIndex)
		};
		{
			run <= limit & {
				offset >= self.runs[run]
			}
		}.whileTrue {
			offset := offset - self.runs[run];
			run := run + 1
		};
		self.cachedIndex := index;
		self.cachedRun := run;
		self.cachedOffset := offset;
		(run > limit).ifTrue {
			run := run - 1;
			offset := offset + self.runs[run]
		};
		aBlock(run, offset, self.values[run])
	}

	do { :self :aBlock:/1 |
		1.toDo(self.runs.size) { :index |
			let run = self.runs[index];
			let value = self.values[index];
			{
				run := run - 1;
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

	runsAndValuesCollect { :self :aBlock:/2 |
		self.runs.withCollect(self.values, aBlock:/2)
	}

	runsAndValuesDo { :self :aBlock:/2 |
		self.runs.withDo(self.values, aBlock:/2)
	}

	size { :self |
		self.runs.sum
	}

	withIndexDo { :self :aBlock:/2 |
		let index = 0;
		1.toDo(self.runs.size) { :runIndex |
			let run = self.runs[runIndex];
			let value = self.values[runIndex];
			{
				(run := run - 1) >= 0
			}.whileTrue {
				index := index + 1;
				aBlock(value, index)
			}
		}
	}

	withStartStopAndValueDo { :self :aBlock:/3 |
		let start = 1;
		self.runs.withDo(self.values) { :length :value |
			let stop = start + length - 1;
			aBlock(start, stop, value);
			start := stop + 1
		}
	}

}

+@Sequence {

	asRunArray { :self |
		self.asRunArrayWith(identity:/1)
	}

	asRunArrayWith { :self :aBlock:/1 |
		let runs = [];
		let values = [];
		let lastLength = 0;
		let lastValue = nil;
		let lastIndex = nil;
		self.do { :each |
			let value = aBlock(each);
			(lastValue = value).if {
				lastLength := lastLength + 1
			} {
				(lastLength > 0).ifTrue {
					runs.add(lastLength);
					values.add(lastValue)
				};
				lastLength := 1;
				lastValue := value
			}
		};
		(lastLength > 0).ifTrue {
			runs.add(lastLength);
			values.add(lastValue)
		};
		RunArray(runs, values)
	}

	associationListToRunArray { :self |
		RunArray(
			self.collect(key:/1),
			self.collect(value:/1)
		)
	}

	RunArray { :self :values |
		newRunArray().initializeSlots(self, values, nil, nil, nil)
	}

}
