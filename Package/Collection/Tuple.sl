/* Requires: List */

Tuple : [Object, Copy, Store, Equal] {

	| collection |

	[at, @] { :self :index |
		self.collection.at(index)
	}

	assertIsOfSize { :self :anInteger |
		self.collection.assertIsOfSize(anInteger)
	}

	concisePrintString { :self |
		self.storeStringLiteral(concisePrintString/1)
	}

	equalBy { :self :anObject :aBlock/2 |
		anObject.isTuple & {
			aBlock(self.collection, anObject.collection)
		}
	}

	indices { :self |
		self.collection.indices
	}

	List { :self |
		self.collection.copy
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

	storeStringLiteral { :self :aBlock/1 |
		'(' ++ self.collection.collect(aBlock/1).commaSeparated ++ ')'
	}

	storeString { :self |
		self.storeStringLiteral(storeString/1)
	}

}

+List {

	Tuple { :self |
		newTuple().initializeSlots(self.copy)
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
