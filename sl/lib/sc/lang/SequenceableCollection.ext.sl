+ @SequenceableCollection {

	allTuples { :self |
		(* Answer all of the possible n-tuples of each of my elements (I am an n-element sequence of any sized sequences). *)
		| answerSize = self.collect({ :item | item.size }).product; |
		1.to(answerSize).collect { :i |
			| k = i - 1, nextTuple = self.species.new(self.size); |
			self.size.toBy(1, -1).collect { :j |
				| fromSequence = self[j]; |
				nextTuple[j] := fromSequence[k % fromSequence.size + 1];
				k := k // fromSequence.size
			};
			nextTuple
		}
	}

	crossMultiply { :self :aSequence |
		self.withCrossedCollect(aSequence, times:/2)
	}

	degreeToKey { :self :scale :stepsPerOctave |
		self.collect { :scaleDegree |
			scaleDegree.degreeToKey(scale, stepsPerOctave)
		}
	}

	extendTo { :self :size |
		1.toAsCollect(size, self.species) { :index |
			self.atWrap(index)
		}
	}

	flop { :self |
		self.extendToBeOfEqualSize.transpose
	}

	pyramid { :self :patternType |
		|
			answer = OrderedCollection(),
			lastIndex = self.size;
		|
		(patternType = 1).ifTrue {
			(1 .. lastIndex).do { :index |
				answer.addAll(self.copyFromTo(1, index))
			}
		};
		(patternType = 6).ifTrue {
			(0 .. lastIndex - 1).do  { :index |
				answer.addAll(self.copyFromTo(lastIndex - index, lastIndex))
			}
		};
		self.species.newFrom(answer)
	}

	scramble { :self |
		self.shuffled
	}

	stutter { :self :repeatCount |
		(self.collect { :each | { each }.dup(repeatCount) }).concatenation
	}

	withCrossedCollect { :self :aSequence :aProcedure:/2 |
		(* Apply aProcedure for each of my items with each item of aSequence in turn. *)
		|
			answer = self.species.new(self.size * aSequence.size),
			nextIndex = 1;
		|
		self.do { :leftItem |
			aSequence.do { :rightItem |
				answer[nextIndex] := aProcedure(leftItem, rightItem);
				nextIndex := nextIndex + 1
			}
		};
		answer
	}

	withExtendingCollect { :self :aCollection :aProcedure:/2 |
		| maximumSize = self.size.max(aCollection.size); |
		1.toAsCollect(maximumSize, self.species) { :index |
			aProcedure(self.atWrap(index), aCollection.atWrap(index))
		}
	}

	withExtendingCollectOrAdaptTo { :self :anObject :aBinaryProcedure |
		if(isSequenceable(anObject)) {
			withExtendingCollect(self, anObject, aBinaryProcedure)
		} {
			anObject.adaptToCollectionAndApply(self, aBinaryProcedure)
		}
	}

	+ { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, plus:/2) }
	- { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, minus:/2) }
	* { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, times:/2) }
	/ { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, dividedBy:/2) }
	< { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, lessThan:/2) }
	> { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, greaterThan:/2) }
	** { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, timesTimes:/2) }
	% { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, modulo:/2) }

	bitAnd { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, bitAnd:/2) }
	bitOr { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, bitOr:/2) }
	min { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, min:/2) }
	max { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, max:/2) }
	roundTo { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, roundTo:/2) }
	truncateTo { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, truncateTo:/2) }

}
