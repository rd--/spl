/* Requires: List */

Tuple : [Object, Storeable, Copyable, Equatable] { | contents |

	asList { :self |
		self.contents.copy
	}

	assertIsOfSize { :self :anInteger |
		self.contents.assertIsOfSize(anInteger)
	}

	at { :self :index |
		self.contents.at(index)
	}

	concisePrintString { :self |
		self.storeStringLiteral(concisePrintString:/1)
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isTuple & {
			aBlock(self.contents, anObject.contents)
		}
	}

	indices { :self |
		self.contents.indices
	}

	postCopy { :self |
		self.contents := self.contents.copy
	}

	printString { :self |
		self.storeStringLiteral(printString:/1)
	}

	size { :self |
		self.contents.size
	}

	storeStringLiteral { :self :aBlock:/1 |
		'(' ++ self.contents.collect(aBlock:/1).commaSeparated ++ ')'
	}

	storeString { :self |
		self.storeStringLiteral(storeString:/1)
	}

}

+List {

	Tuple { :self |
		newTuple().initializeSlots(self)
	}

	asTuple { :self |
		Tuple(self.copy)
	}

}
