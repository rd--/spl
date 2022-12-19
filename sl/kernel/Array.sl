Array : [Collection, SequenceableCollection, ArrayedCollection] {

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		self.collect { :each |
			aProcedure.value(aNumber, each)
		}
	}

	asArray { :self |
		self
	}

	copy { :self |
		<primitive: return Array.from(_self);>
	}

	printString { :self |
		'[' ++ self.collect(printString).joinSeparatedBy(', ') ++ ']'
	}

}

+ Number {

	toAsCollect { :self :stop :species :aProcedure |
		| answerSize = stop - self + 1, answer = species.ofSize(answerSize); |
		answerSize.do { :index | answer[index] := aProcedure.value(index + self - 1) };
		answer
	}

	replicate { :self :anObject |
		1.toAsCollect(self, Array:/1) { :unused |
			anObject
		}
	}

	Array { :size |
		<primitive: return Array(_size)>
	}

}

+ Object {

	asArray { :self |
		[self]
	}

	replicateApplying { :self :anInteger :aProcedure |
		| answer = Array(anInteger); |
		anInteger.do { :index |
			answer[index] := aProcedure.value(self)
		};
		answer
	}

	replicate { :self :anInteger |
		self.replicateApplying(anInteger, identity:/1)
	}

}

+ Void {

	Array {
		Array(0)
	}

}

+ @SequenceableCollection {

	Array { :aCollection |
		| newArray = Array(aCollection.size); |
		(1 .. aCollection.size).do { :i | newArray[i] := aCollection[i] };
		newArray
	}

}
