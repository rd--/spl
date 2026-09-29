RunArray : [Object, Equal, Store, Indexable] { | runLengths values cachedIndex cachedRun cachedOffset |

	[at, @] { :self :index |
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

	asList { :self |
		let answer = List(self.size);
		self.withIndexDo { :each :index |
			answer[index] := each
		};
		answer
	}

	associations { :self |
		self.runLengthsAndValuesCollect { :key :value |
			key -> value
		}
	}

	asIdentityMultiset { :self |
		let answer = IdentityMultiset();
		self.runLengthsAndValuesDo { :run :value |
			answer.addWithOccurrences(value, run)
		};
		answer
	}

	asIdentitySet { :self |
		self.values.asIdentitySet
	}

	allocatedSize { :self |
		self.runLengths.size * 2 + 3
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

	equalBy { :self :anObject :aBlock/2 |
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

	first { :self |
		self.values[1]
	}

	includes { :self :anObject |
		self.values.includes(anObject)
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

	asRunArray { :self |
		self.asRunArrayWith(identity/1)
	}

	asRunArrayWith { :self :aBlock/1 |
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

	associationListToRunArray { :self |
		RunArray(
			self.collect(key/1),
			self.collect(value/1)
		)
	}

	RunArray { :self :values |
		newRunArray().initializeSlots(self, values, nil, nil, nil)
	}

}

+List {

	runLengths { :self |
		self.asRunArray.runLengths
	}

	runLengthsOf { :self :anObject |
		self.asRunArray.runLengthsOf(anObject)
	}

}
