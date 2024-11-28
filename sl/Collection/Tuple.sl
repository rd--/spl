/* Requires: List */

Tuple : [Object, Iterable, Indexable, Collection, Sequence] { | contents |

	asList { :self |
		self.contents.copy
	}

	at { :self :index |
		self.contents[index]
	}

	atPut { :self :index :anObject |
		self.contents[index] := anObject
	}

	concisePrintString { :self |
		'(' ++ self.contents.collect(concisePrintString:/1).join(', ') ++ ')'
	}

	copy { :self |
		self.contents.asTuple
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1)
	}

	indices { :self |
		self.contents.indices
	}

	isVector { :self |
		self.noneSatisfy(isTuple:/1)
	}

	printString { :self |
		'(' ++ self.contents.collect(printString:/1).join(', ') ++ ')'
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		Tuple:/1
	}

	storeString { :self |
		'(' ++ self.contents.collect(storeString:/1).join(', ') ++ ')'
	}

}

+@Integer {

	Tuple { :size |
		List(size).asTuple
	}

	Tuple { :size :anObject |
		List(size, anObject).asTuple
	}

}

+List {

	asTuple { :self |
		newTuple().initializeSlots(self.copy)
	}

}

+@Sequence {

	asTuple { :self |
		self.asList.asTuple
	}

}
