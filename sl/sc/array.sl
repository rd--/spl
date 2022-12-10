+ @SequenceableCollection {

	extendTo { :self :size |
		1.toAsCollect(size, self.species) { :index | self.atWrap(index) }
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

}

+ Array {

	extendToBeOfEqualSize { :self |
		| selfLifted = self.collect(asArray), maximumSize = selfLifted.collect(size).detectMax(identity); |
		selfLifted.collect({ :each | each.extendTo(maximumSize) })
	}

	flop { :self | self.extendToBeOfEqualSize.transpose }

	clump { :self :groupSize | <primitive: return sc.clump(_self, _groupSize);> }

}

+ Object {

	dup { :self :anInteger | self.replicateApplying(anInteger, value) }
	dup { :self | self.dup(2) }
	! { :self :anInteger | self.dup(anInteger) }
	!+ { :self :anInteger | self.dup(anInteger).sum }
	!* { :self :anInteger | self.dup(anInteger).product }
	!^ { :self :anInteger | self.dup(anInteger).Splay2 }

}
