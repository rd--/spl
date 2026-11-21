/* Requires: List */

Tuple : [Object, Copy, Store, Equal] {

	| collection | <List>

	[List, tupleToList] { :self |
		self.collection.copy
	}

	assertIsOfSize { :self :anInteger |
		self.collection.assertIsOfSize(anInteger)
	}

	at { :self :index |
		self.collection.at(index)
	}

	concisePrintString { :self |
		self.storeStringLiteral(concisePrintString/1)
	}

	indices { :self |
		self.collection.indices
	}

	isEqualBy { :self :anObject :aFunction/2 |
		anObject.isTuple & {
			aFunction(self.collection, anObject.collection)
		}
	}

	postCopy { :self |
		self.collection := self.collection.copy
	}

	printString { :self |
		self.storeStringLiteral(printString/1)
	}

	size { :self |
		self.collection.size
	}

	storeString { :self |
		self.storeStringLiteral(storeString/1)
	}

	storeStringLiteral { :self :aFunction/1 |
		'(' ++ self.collection.collect(aFunction/1).commaSeparated ++ ')'
	}

}

+List {

	Tuple { :self |
		uncheckedTuple(self.copy)
	}

}

+Tuple {

	unitBox { :self |
		self.collection.collect(unitBox/1).product
	}

	unitStep { :self |
		self.collection.noneSatisfy(isNegative/1).boole
	}

	unitTriangle { :self |
		self.collection.collect(unitTriangle/1).product
	}

}
