UnsortedSet : [Object, Store, Equal, Iterable, Collection, Extensible, Unordered, Set] { | unsortedList comparator |

	do { :self :aBlock/1 |
		self.unsortedList.do(aBlock/1)
	}

	include! { :self :anObject |
		self.unsortedList
		.addIfNotPresentBy!(
			anObject,
			self.comparator
		)
	}

	includes { :self :anObject |
		self.unsortedList.includesBy(anObject, self.comparator)
	}

	[List, unsortedSetToList] { :self |
		self.unsortedList.copy
	}

	removeAll! { :self |
		self.unsortedList.removeAll!
	}

	removeIfAbsent! { :self :anObject :aBlock/0 |
		self.unsortedList.detectIndexIfFoundIfNone { :item |
			self.comparator.value(item, anObject)
		} { :index |
			self.unsortedList.removeAt!(index)
		} {
			aBlock()
		}
	}

	size { :self |
		self.unsortedList.size
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
		newUnsortedSet().initializeSlots([], equal/2)
	}

}


+List {

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

	union { :self |
		self.unionBy(equal/2)
	}

	union { :self :aCollection |
		[self, aCollection].unionBy(equal/2)
	}

}
