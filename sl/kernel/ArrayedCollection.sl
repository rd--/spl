@ArrayedCollection {

	fillFromWith { :self :aCollection :aBlock |
		aCollection.withIndexDo { :each :index |
			self[index] := aBlock(each)
		};
		self
	}

	injectInto { :self :anObject :aBlock |
		| result = anObject; |
		1.toDo(self.size) { :index | result := aBlock(result, self[index]) };
		result
	}

	occurrencesOf { :self :anObject |
		| tally = 0; |
		1.toDo(self.size) { :index |
			ifTrue(self[index] = anObject) { tally := tally + 1 }
		};
		tally
	}

}
