Array : [Collection, SequenceableCollection, ArrayedCollection] {

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		self.collect { :each | aProcedure(aNumber, each) }
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
		answerSize.do { :index | answer[index] := aProcedure(index + self - 1) };
		answer
	}

	replicate { :self :anObject |
		1.toAsCollect(self, Array) { :unused | anObject }
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
		anInteger.do { :index | answer[index] := aProcedure(self) };
		answer
	}

	replicate { :self :anInteger | self.replicateApplying(anInteger, identity) }
	dup { :self :anInteger | self.replicateApplying(anInteger, value) }
	dup { :self | self.dup(2) }
	! { :self :anInteger | self.dup(anInteger) }

}

+ Void {

	Array {
		Array(0)
	}

}
