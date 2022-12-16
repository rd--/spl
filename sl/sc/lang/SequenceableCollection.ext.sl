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

	withExtendingCollect { :self :aCollection :aProcedure |
		| maximumSize = self.size.max(aCollection.size); |
		1.toAsCollect(maximumSize, self.species) { :index | aProcedure(self.atWrap(index), aCollection.atWrap(index)) }
	}

	withExtendingCollectOrAdaptTo { :self :anObject :aProcedure |
		if(isSequenceable(anObject)) {
			withExtendingCollect(self, anObject, aProcedure)
		} {
			anObject.adaptToCollectionAndApply(self, aProcedure)
		}
	}

	+ { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, plus) }
	- { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, minus) }
	* { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, times) }
	/ { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, dividedBy) }
	< { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, lessThan) }
	> { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, greaterThan) }
	** { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, timesTimes) }
	% { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, modulo) }

	bitAnd { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, bitAnd) }
	bitOr { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, bitOr) }
	min { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, min) }
	max { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, max) }
	roundTo { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, roundTo) }
	truncateTo { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, truncateTo) }

}
