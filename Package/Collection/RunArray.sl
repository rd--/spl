RunArray : [Object, Equal, Store, At, Indices] {

	| runLengths values cachedIndex cachedRun cachedOffset |

	IdentitySet { :self |
		self.values.IdentitySet
	}

	[List, runArrayToList] { :self |
		let answer = List(self.size, nil);
		self.withIndexDo { :each :index |
			answer[index] := each
		};
		answer
	}

	Multiset { :self :comparator/2 |
		let answer = Multiset([], comparator/2);
		self.runLengthsAndValuesDo { :run :value |
			answer.addWithOccurrences!(value, run)
		};
		answer
	}

	allocatedSize { :self |
		self.runLengths.size * 2 + 3
	}

	associations { :self |
		self.runLengthsAndValuesCollect { :key :value |
			key -> value
		}
	}

	at { :self :index |
		self.atSetRunOffsetAndValue(index) { :run :offset :value |
			(offset < 0).ifTrue {
				self.errorInvalidIndex('at', index)
			};
			(offset >= self.runLengths[run]).ifTrue {
				self.indexError(index)
			};
			value
		}
	}

	atSetRunOffsetAndValue { :self :index :aBlock/3 |
		let limit = self.runLengths.size;
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
				offset >= self.runLengths[run]
			}
		}.whileTrue {
			offset := offset - self.runLengths[run];
			run := run + 1
		};
		self.cachedIndex := index;
		self.cachedRun := run;
		self.cachedOffset := offset;
		(run > limit).ifTrue {
			run := run - 1;
			offset := offset + self.runLengths[run]
		};
		aBlock(run, offset, self.values[run])
	}

	do { :self :aBlock/1 |
		1.toDo(self.runLengths.size) { :index |
			let run = self.runLengths[index];
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

	indices { :self |
		1.to(self.size)
	}

	isEqualBy { :self :anObject :aBlock/2 |
		(self == anObject).if {
			true
		} {
			anObject.isRunArray & {
				self.runLengths.hasEqualElements(anObject.runLengths, aBlock/2) & {
					self.values.hasEqualElements(anObject.values, aBlock/2)
				}
			}
		}
	}

	isSorted { :self |
		self.values.isSorted
	}

	[isSorted, isSortedBy] { :self :aBlock/2 |
		self.values.isSortedBy(aBlock/2)
	}

	last { :self |
		self.values[self.values.size]
	}

	postCopy { :self |
		self.runLengths := self.runLengths.copy;
		self.values := self.values.copy
	}

	reverse { :self |
		RunArray(self.runLengths.reverse, self.values.reverse)
	}

	runLengthAt { :self :index |
		self.atSetRunOffsetAndValue(index) { :run :offset :value |
			self.runLengths[run] - offset
		}
	}

	runLengthsAndValues { :self |
		self.runLengthsAndValuesCollect { :key :value |
			[key, value]
		}
	}

	runLengthsAndValuesCollect { :self :aBlock/2 |
		self.runLengths.withCollect(self.values, aBlock/2)
	}

	runLengthsAndValuesDo { :self :aBlock/2 |
		self.runLengths.withDo(self.values, aBlock/2)
	}

	runLengthsOf { :self :anObject |
		let answer = [];
		self.runLengthsAndValuesDo { :run :value |
			(value = anObject).ifTrue {
				answer.add!(run)
			}
		};
		answer
	}

	size { :self |
		self.runLengths.sum
	}

	storeString { :self |
		'RunArray(%, %)'.format(
			[
				self.runLengths.storeString,
				self.values.storeString
			]
		)
	}

	withIndexDo { :self :aBlock/2 |
		let index = 0;
		1.toDo(self.runLengths.size) { :runIndex |
			let run = self.runLengths[runIndex];
			let value = self.values[runIndex];
			{
				(run := run - 1) >= 0
			}.whileTrue {
				index := index + 1;
				aBlock(value, index)
			}
		}
	}

	withStartStopAndValueDo { :self :aBlock/3 |
		let start = 1;
		self.runLengths.withDo(self.values) { :length :value |
			let stop = start + length - 1;
			aBlock(start, stop, value);
			start := stop + 1
		}
	}

}

+List {

	RunArray { :self |
		self.runArrayWith(identity/1)
	}

	RunArray { :self :values |
		newRunArray().initializeSlots(self, values, nil, nil, nil)
	}

	associationListToRunArray { :self |
		RunArray(
			self.collect(key/1),
			self.collect(value/1)
		)
	}

	runArrayWith { :self :aBlock/1 |
		let runLengths = [];
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
					runLengths.add!(lastLength);
					values.add!(lastValue)
				};
				lastLength := 1;
				lastValue := value
			}
		};
		(lastLength > 0).ifTrue {
			runLengths.add!(lastLength);
			values.add!(lastValue)
		};
		RunArray(runLengths, values)
	}

}

+List {

	runLengths { :self |
		self.RunArray.runLengths
	}

	runLengthsOf { :self :anObject |
		self.RunArray.runLengthsOf(anObject)
	}

}

+String {

	RunArray { :self |
		RunArray(List(self))
	}

}
