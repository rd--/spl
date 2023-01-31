@SequenceableCollection {

	= { :self :anObject |
		if(
			anObject.isSequenceable &
			{ self.typeOf == anObject.typeOf } &
			{ self.size == anObject.size }
		) {
			withReturn {
				self.size.do { :index |
					ifFalse(self[index] = anObject[index]) { false.return }
				};
				true
			}
		} {
			false
		}
	}

	++ { :self :otherCollection |
		self.copyReplaceFromToWith(
			self.size + 1,
			self.size,
			otherCollection.asCollection
		)
	}

	allButFirst { :self |
		self.allButFirst(1)
	}

	allButFirst { :self :n |
		self.copyFromTo(n + 1, self.size)
	}

	atWrap { :self :index |
		self.at(index - 1 % self.size + 1)
	}

	atRandom { :self | self[randomInteger(1, self.size)] }

	collect { :self :aProcedure:/1 |
		| newCollection = self.species.ofSize(self.size); |
		1.toDo(self.size) { :index |
			newCollection[index] := aProcedure(self[index])
		};
		newCollection
	}

	concatenation { :self |
		|
			answerSize = self.injectInto(0) { :sum :each | sum + each.size },
			answer = self.species.ofSize(answerSize),
			index = 1;
		|
		self.do { :each |
			each.do { :item |
				answer[index] := item;
				index := index + 1
			}
		};
		answer
	}

	copyFromTo { :self :start :stop |
		1.toAsCollect(stop - start + 1, self.species) { :index |
			self[index + start - 1]
		}
	}

	copyReplaceFromToWith { :self :start :stop :aCollection |
		|
			end = start - 1 + aCollection.size,
			newSize = self.size + end - stop,
			answer = self.species.ofSize(newSize);
		|
		(start > 1).ifTrue {
			answer.replaceFromToWithStartingAt(1, start - 1, self, 1)
		};
		(start <= end).ifTrue {
			answer.replaceFromToWithStartingAt(start, end, aCollection, 1)
		};
		(end < newSize).ifTrue {
			answer.replaceFromToWithStartingAt(end + 1, newSize, self, stop + 1)
		};
		answer
	}

	do { :self :aProcedure:/1 |
		1.toDo(self.size) { :index |
			aProcedure(self[index])
		}
	}

	first { :self |
		self[1]
	}

	first { :self :n |
		self.copyFromTo(1, n)
	}

	fisherYatesShuffle { :self |
		[self.size .. 2].do { :item | self.swapWith(item, randomInteger(1, item)) };
		self
	}

	grownBy { :self :length |
		self.species.ofSize(self.size + length).replaceFromToWithStartingAt(1, self.size, self, 1)
	}

	includes { :self :anObject | self.indexOf(anObject) ~= 0 }

	indexOf { :self :anElement |self.indexOfStartingAt(anElement, 1) }

	indexOfStartingAt { :self :anElement :start |
		withReturn {
			start.toDo(self.size) { :index |
				(self[index] = anElement).ifTrue { return(index) }
			};
			0
		}
	}

	isSequenceable { :self |
		true
	}

	last { :self |
		self[self.size]
	}

	last { :self :n |
		| size = self.size; |
		self.copyFromTo(size - n + 1, size)
	}

	replaceFromToWithStartingAt { :self :start :stop :replacement :replacementStart |
		| replacementOffset = replacementStart - start, index = start; |
		whileTrue { index <= stop } {
			self[index] := replacement[replacementOffset + index];
			index := index + 1;
		};
		self
	}

	reversed { :self |
		| n = self.size, answer = self.species.ofSize(n), src = n + 1; |
		toDo(1, n) { :i | answer[i] := self[src - 1]; src := src - 1 };
		answer
	}

	rotate { :self :anInteger |
		self.rotateRight(anInteger)
	}

	rotateLeft { :self :anInteger |
		(1 + anInteger).toAsCollect(self.size + anInteger, self.species) { :index |
			self.atWrap(index)
		}
	}

	rotateRight { :self :anInteger |
		(1 - anInteger).toAsCollect(self.size - anInteger, self.species) { :index |
			self.atWrap(index)
		}
	}

	second { :self |
		self[2]
	}

	secondLast { :self |
		self[self.size - 1]
	}

	select { :self :aProcedure:/1 |
		| answer = OrderedCollection(); |
		1.toDo(self.size) { :index |
			aProcedure(self[index]).ifTrue {
				answer.add(self[index])
			}
		};
		answer
	}

	shuffled { :self | self.copy.fisherYatesShuffle }

	swapWith { :self :oneIndex :anotherIndex |
		| element = self[oneIndex]; |
		self[oneIndex] := self[anotherIndex];
		self[anotherIndex] := element
	}

	third { :self |
		self[3]
	}

	thirdLast { :self |
		self[self.size - 2]
	}

	transpose { :self |
		1.toAsCollect(self.first.size, self.first.species) { :index |
			self.collect { :row | row[index] }
		}
	}

	validIndex { :self :index |
		index > 0 & { index <= self.size }
	}

	withCollect { :self :aCollection :aProcedure:/2 |
		ifFalse(isSequenceable(aCollection) & { self.size == aCollection.size }) {
			error('withCollect: operand not-sequenceable or of unequal size')
		};
		1.toAsCollect(self.size, self.species) { :index |
			aProcedure(self[index], anArray[index])
		}
	}

	withIndexCollect { :self :elementAndIndexProcedure:/2 |
		| answer = self.species.ofSize(self.size); |
		1.toDo(self.size) { :index |
			answer[index] := elementAndIndexProcedure(self[index], index)
		};
		answer
	}

	withIndexDo { :self :elementAndIndexProcedure:/2 |
		1.toDo(self. size) { :index |
			elementAndIndexProcedure(self[index], index)
		}
	}

}

+ @Object {

	isSequenceable { :self | false }

}

+ Procedure {

	geom { :self:/1 :size :start :grow |
		| answer = self(size), accum = start; |
		1.to(size).collectInto({ :unusedItem |
			| entry = accum; |
			accum := grow * accum;
			entry
		}, answer);
		answer
	}

	series { :self:/1 :size :start :step |
		| answer = self(size); |
		1.to(size).collectInto({ :item |
			(step * (item - 1)) + start
		}, answer);
		answer
	}

}
