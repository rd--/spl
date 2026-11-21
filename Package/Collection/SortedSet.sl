/* Requires: List, SortedList */

SortedSet : [Object, New, Copy, Store, Equal, Do, Collection, Add, Remove, Set] {

	| sortedList | <SortedList>

	[List, sortedSetToList] { :self |
		self.sortedList.List
	}

	add! { :self :anObject |
		let sortedList = self.sortedList;
		sortedList.includes(anObject).if {
			self.error('add: item already present', [anObject])
		} {
			sortedList.add!(anObject)
		}
	}

	collect { :self :aFunction/1 |
		SortedSet(
			self.sortedList.collect(aFunction/1)
		)
	}

	do { :self :aFunction/1 |
		self.sortedList.do(aFunction/1)
	}

	include! { :self :anObject |
		self.sortedList.addIfNotPresent!(anObject)
	}

	includes { :self :anObject |
		self.sortedList.includes(anObject)
	}

	postCopy { :self |
		self.sortedList := self.sortedList.copy
	}

	removeAll! { :self |
		self.sortedList.removeAll!
	}

	removeIfAbsent! { :self :anObject :aFunction/0 |
		self.sortedList.removeIfAbsent!(anObject, aFunction/0)
	}

	size { :self |
		self.sortedList.size
	}

	species { :unused |
		SortedSet/0.emptySpecies
	}

	storeString { :self |
		'SortedSet([%])'.format(
			[
				self
				.sortedList
				.collection
				.collect(storeString/1)
				.commaSeparated
			]
		)
	}

}

+Void {

	SortedSet {
		uncheckedSortedSet(
			SortedList([], precedes/2)
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

	union { :self |
		self.unionInto(
			SortedSet()
		).List
	}

	union { :self :aCollection |
		[self, aCollection].union
	}

	unionInto { :self :aCollection |
		self.do { :each |
			aCollection.includeAll!(each)
		};
		aCollection
	}

}

+Function {

	comparatorToSet { :comparator/2 |
		[
			{ comparator/2 == = } -> { SortedSet() },
			{ comparator/2 == == } -> { IdentitySet() },
			{ true } -> {
				comparator/2.error('comparatorToSet')
			}
		].which
	}

	comparatorToSetOrList { :comparator/2 |
		[
			{ comparator/2 == = } -> { [] },
			{ comparator/2 == == } -> { IdentitySet() },
			{ true } -> {
				comparator/2.error('comparatorToSetOrList')
			}
		].which
	}

}
