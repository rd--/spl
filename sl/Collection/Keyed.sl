+@Dictionary {

	keys { :self |
		self.indices
	}

	keysAndValuesDo { :self :aBlock:/2 |
		self.withIndexDo { :value :key |
			aBlock(key, value)
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

+@Sequenceable {

	keysAndValuesDo { :self :aBlock:/2 |
		self.indicesDo { :index |
			aBlock(index, self[index])
		}
	}

}
