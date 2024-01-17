{- Requires: Array -}

Vector : [Object, Json, Iterable, Indexable, Collection, Sequenceable, Arrayed] { | contents |

	asArray { :self |
		self.contents.copy
	}

	at { :self :index |
		self.contents[index]
	}

	atPut { :self :index :anObject |
		self.contents[index] := anObject
	}

	copy { :self |
		self.contents.asVector
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
		Vector:/1
	}

	storeString { :self |
		self.contents.storeString ++ '.asVector'
	}

}

+@Integer {

	Vector { :size |
		Array(size).asVector
	}

	Vector { :size :anObject |
		Array(size, anObject).asVector
	}

}

+Array {

	asVector { :self |
		newVector().initializeSlots(self.copy)
	}

}

+@Sequenceable {

	asVector { :self |
		self.asArray.asVector
	}

}
