+@Collection {

	asArray { :self |
		self.Array
	}

	asBag { :self |
		self.Bag
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
