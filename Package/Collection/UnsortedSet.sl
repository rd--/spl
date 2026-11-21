UnsortedSet : [Object, New, Store, Equal, Do, Collection, Add, Remove, Unordered, Set] {

	| collection comparator | <List>

	[List, unsortedSetToList] { :self |
		self.collection.copy
	}

	do { :self :aFunction/1 |
		self.collection.do(aFunction/1)
	}

	include! { :self :anObject |
		self.collection
		.addIfNotPresentBy!(
			anObject,
			self.comparator
		)
	}

	includes { :self :anObject |
		self.collection.includesBy(anObject, self.comparator)
	}

	removeAll! { :self |
		self.collection.removeAll!
	}

	removeIfAbsent! { :self :anObject :aFunction/0 |
		let f/2 = self.comparator;
		self.collection.detectIndexIfFoundIfNone { :item |
			f(item, anObject)
		} { :index |
			self.collection.removeAt!(index)
		} {
			aFunction()
		}
	}

	size { :self |
		self.collection.size
	}

	species { :unused |
		UnsortedSet/0.emptySpecies
	}

	storeString { :self |
		self.storeStringAsInitializeSlotsOmitting(['comparator'])
	}

}

+@Collection {

	UnsortedSet { :self |
		let answer = UnsortedSet();
		answer.includeAll!(self);
		answer
	}

}

+Void {

	UnsortedSet {
		uncheckedUnsortedSet([], =)
	}

}

+List {

	union { :self |
		self.unionBy(=)
	}

	union { :self :aCollection |
		[self, aCollection].unionBy(=)
	}

	unionBy { :self :aFunction/2 |
		let set = UnsortedSet();
		set.comparator := aFunction/2;
		self.do { :each |
			set.includeAll!(each)
		};
		set.List
	}

	unionBy { :self :aCollection :aFunction/2 |
		[self, aCollection].unionBy(aFunction/2)
	}

}
