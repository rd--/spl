{- Requires: List -}

Tuple : [Object, Iterable, Indexable, Collection, Sequenceable] { | contents |

	asList { :self |
		self.contents.copy
	}

	at { :self :index |
		self.contents[index]
	}

	atPut { :self :index :anObject |
		self.contents[index] := anObject
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

	size { :self |
		self.contents.size
	}

	species { :self |
		Tuple:/1
	}

	storeString { :self:/1 |
		'(' ++ self.collect(storeString:/1).joinSeparatedBy(', ') ++ ')'
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

+@Sequenceable {

	asTuple { :self |
		self.asList.asTuple
	}

}
