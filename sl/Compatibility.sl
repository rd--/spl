+@Collection {

	asArray { :self |
		self.Array
	}

	asBag { :self |
		self.Bag
	}

}

+@Dictionary {

	keys { :self |
		self.indices
	}

	keysAndValuesDo { :self :aProcedure:/2 |
		self.withIndexDo { :value :key |
			aProcedure(key, value)
		}
	}

	keysDo { :self :aBlock:/1 |
		self.indicesDo(aBlock:/1)
	}

	includesKey { :self :key |
		self.includesIndex(index)
	}

}

+@Indexable {

	keyAtValue { :self :value |
		self.indexOf(value)
	}

}

+@Iterable {

	contains { :self :aBlock:/1 |
		self.anySatisfy(aBlock:/1)
	}

	fold { :self :aBlock:/2 |
		self.reduce(aBlock:/2)
	}

}

+@SequenceableCollection {

	keysAndValuesDo { :self :aBlock:/2 |
		self.indicesDo { :index |
			aBlock(index, self[index])
		}
	}

}

+Array {

	asArray { :self |
		self
	}

}

+Bag {

	asBag { :self |
		self
	}

	asSet { :self |
		self.contents.keys.asSet
	}

}

+Map {

	asMap { :self |
		self
	}

}
