+ @SequenceableCollection {

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
