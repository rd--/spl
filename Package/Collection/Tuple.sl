/* Requires: List */

Tuple : [Object, Copyable, Equatable] { | contents |

	asList { :self |
		self.contents.copy
	}

	at { :self :index |
		self.contents.at(index)
	}

	concisePrintString { :self |
		self.storeString(concisePrintString:/1)
	}

	copy { :self |
		self.contents.asTuple
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isTuple & {
			aBlock(self.contents, anObject.contents)
		}
	}

	indices { :self |
		self.contents.indices
	}

	printString { :self |
		self.storeString(printString:/1)
	}

	size { :self |
		self.contents.size
	}

	storeString { :self :aBlock:/1 |
		'(' ++ self.contents.collect(aBlock:/1).commaSeparated ++ ')'
	}

	storeString { :self |
		self.storeString(storeString:/1)
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
