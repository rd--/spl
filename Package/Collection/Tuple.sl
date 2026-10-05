/* Requires: List */

Tuple : [Object, Copy, Store, Equal] { | uncopiedList |

	[at, @] { :self :index |
		self.uncopiedList.at(index)
	}

	assertIsOfSize { :self :anInteger |
		self.uncopiedList.assertIsOfSize(anInteger)
	}

	concisePrintString { :self |
		self.storeStringLiteral(concisePrintString/1)
	}

	equalBy { :self :anObject :aBlock/2 |
		anObject.isTuple & {
			aBlock(self.uncopiedList, anObject.uncopiedList)
		}
	}

	indices { :self |
		self.uncopiedList.indices
	}

	List { :self |
		self.uncopiedList.copy
	}

	postCopy { :self |
		self.uncopiedList := self.uncopiedList.copy
	}

	printString { :self |
		self.storeStringLiteral(printString/1)
	}

	size { :self |
		self.uncopiedList.size
	}

	storeStringLiteral { :self :aBlock/1 |
		'(' ++ self.uncopiedList.collect(aBlock/1).commaSeparated ++ ')'
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
		self.uncopiedList.collect(unitBox/1).product
	}

	unitStep { :self |
		self.uncopiedList.noneSatisfy(isNegative/1).boole
	}

	unitTriangle { :self |
		self.uncopiedList.collect(unitTriangle/1).product
	}

}
