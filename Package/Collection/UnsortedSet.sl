UnsortedSet : [Object, New, Store, Equal, Do, Collection, Add, Remove, Unordered, Set] {

	| collection comparator |

	[List, unsortedSetToList] { :self |
		self.collection.copy
	}

	do { :self :aBlock/1 |
		self.collection.do(aBlock/1)
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

	removeIfAbsent! { :self :anObject :aBlock/0 |
		let f/2 = self.comparator;
		self.collection.detectIndexIfFoundIfNone { :item |
			f(item, anObject)
		} { :index |
			self.collection.removeAt!(index)
		} {
			aBlock()
		}
	}

	size { :self |
		self.collection.size
	}

	species { :self |
		UnsortedSet/0
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
		newUnsortedSet().initializeSlots([], =)
	}

}

+List {

	union { :self |
		self.unionBy(=)
	}

	union { :self :aCollection |
		[self, aCollection].unionBy(=)
	}

	unionBy { :self :aBlock/2 |
		let set = UnsortedSet();
		set.comparator := aBlock/2;
		self.do { :each |
			set.includeAll!(each)
		};
		set.List
	}

	unionBy { :self :aCollection :aBlock/2 |
		[self, aCollection].unionBy(aBlock/2)
	}

}
