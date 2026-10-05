SortedSet : [Object, Copy, Store, Equal, Iterable, Collection, Extensible, Set] {

	| sortedList |

	add! { :self :anObject |
		let sortedList = self.sortedList;
		sortedList.includes(anObject).if {
			self.error('add: item already present')
		} {
			sortedList.include!(anObject)
		}
	}

	collect { :self :aBlock/1 |
		SortedSet(
			self.sortedList.collect(aBlock/1)
		)
	}

	do { :self :aBlock/1 |
		self.sortedList.do(aBlock/1)
	}

	include! { :self :anObject |
		self.sortedList.addIfNotPresent!(anObject)
	}

	includes { :self :anObject |
		self.sortedList.includes(anObject)
	}

	List { :self |
		self.sortedList.List
	}

	removeAll! { :self |
		self.sortedList.removeAll!
	}

	removeIfAbsent! { :self :anObject :aBlock/0 |
		self.sortedList.removeIfAbsent!(anObject, aBlock/0)
	}

	postCopy { :self |
		self.sortedList := self.sortedList.copy
	}

	size { :self |
		self.sortedList.size
	}

	species { :self |
		SortedSet/0
	}

	storeString { :self |
		'SortedSet([%])'.format(
			[
				self
				.sortedList
				.uncopiedList
				.collect(storeString/1)
				.commaSeparated
			]
		)
	}

}

+Void {

	SortedSet {
		newSortedSet().initializeSlots(
			SortedList([], precedesOrEqualTo/2)
		)
	}

}

+@Collection {

	SortedSet { :self |
		let answer = SortedSet();
		answer.includeAll!(self);
		answer
	}

}

+List {

	unionInto { :self :aCollection |
		self.do { :each |
			aCollection.includeAll!(each)
		};
		aCollection
	}

	union { :self |
		self.unionInto(
			SortedSet()
		).List
	}

	union { :self :aCollection |
		[self, aCollection].union
	}

}
