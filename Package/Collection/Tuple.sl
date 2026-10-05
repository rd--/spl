/* Requires: List */

Tuple : [Object, Copy, Store, Equal] { | list |

	[at, @] { :self :index |
		self.list.at(index)
	}

	assertIsOfSize { :self :anInteger |
		self.list.assertIsOfSize(anInteger)
	}

	concisePrintString { :self |
		self.storeStringLiteral(concisePrintString/1)
	}

	equalBy { :self :anObject :aBlock/2 |
		anObject.isTuple & {
			aBlock(self.list, anObject.list)
		}
	}

	indices { :self |
		self.list.indices
	}

	List { :self |
		self.list.copy
	}

	postCopy { :self |
		self.list := self.list.copy
	}

	printString { :self |
		self.storeStringLiteral(printString/1)
	}

	size { :self |
		self.list.size
	}

	storeStringLiteral { :self :aBlock/1 |
		'(' ++ self.list.collect(aBlock/1).commaSeparated ++ ')'
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
		self.list.collect(unitBox/1).product
	}

	unitStep { :self |
		self.list.noneSatisfy(isNegative/1).boole
	}

	unitTriangle { :self |
		self.list.collect(unitTriangle/1).product
	}

}
