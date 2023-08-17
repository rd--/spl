+@Iterable {

	contains { :self :aBlock:/1 |
		self.anySatisfy(aBlock:/1)
	}

	fold { :self :aBlock:/2 |
		self.reduce(aBlock:/2)
	}

	keyAtValue { :self :value |
		self.indexOf(value)
	}

}
