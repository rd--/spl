SortedSet : [Object, Iterable, Collection, Extensible, Removable, Set] { | contents |

	add { :self :anObject |
		let contents = self.contents;
		contents.includes(anObject).if {
			self.error('add: item already present')
		} {
			contents.include(anObject)
		}
	}

	asList { :self |
		self.contents.asList
	}

	collect { :self :aBlock:/1 |
		SortedSet(
			self.contents.collect(aBlock:/1)
		)
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1);
		self
	}

	include { :self :anObject |
		self.contents.addIfNotPresent(anObject)
	}

	includes { :self :anObject |
		self.contents.includes(anObject)
	}

	removeAll { :self |
		self.contents.removeAll
	}

	removeIfAbsent { :self :anObject :aBlock:/0 |
		self.contents.removeIfAbsentlet(anObject, aBlock:/0)
	}

	shallowCopy { :self |
		SortedSet(self.contents.shallowCopy)
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		SortedSet:/0
	}

	storeString { :self |
		'SortedSet([%])'.format(
			[
				self.contents.contents.collect(storeString:/1).commaSeparated
			]
		)
	}

}

+Void {

	SortedSet {
		newSortedSet().initializeSlots(
			SortedList([], precedes:/2)
		)
	}

}

+@Collection {

	SortedSet { :self |
		let answer = SortedSet();
		answer.includeAll(self);
		answer
	}

}
