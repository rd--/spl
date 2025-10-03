UnsortedSet : [Object, Equatable, Iterable, Collection, Extensible, Removable, Unordered, Set] { | contents comparator |

	asList { :self |
		self.contents.copy
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1);
		self
	}

	include { :self :anObject |
		self.contents.addIfNotPresentBy(anObject, self.comparator)
	}

	includes { :self :anObject |
		self.contents.includesBy(anObject, self.comparator)
	}

	removeAll { :self |
		self.contents.removeAll
	}

	removeIfAbsent { :self :anObject :aBlock:/0 |
		self.contents.detectIndexIfFoundIfNone { :item |
			self.comparator.value(item, anObject)
		} { :index |
			self.contents.removeAt(index)
		} {
			aBlock()
		}
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		UnsortedSet:/0
	}

	storeString { :self |
		'UnsortedSet(%)'.format([self.contents.storeString])
	}

}

+@Collection {

	UnsortedSet { :self |
		let answer = UnsortedSet();
		answer.includeAll(self);
		answer
	}

}

+Void {

	UnsortedSet {
		newUnsortedSet().initializeSlots([], =)
	}

}


+List {

	unionBy { :self :aBlock:/2 |
		let set = UnsortedSet();
		set.comparator := aBlock:/2;
		self.do { :each |
			set.includeAll(each)
		};
		set.asList
	}

	unionBy { :self :aCollection :aBlock:/2 |
		[self, aCollection].unionBy(aBlock:/2)
	}

	union { :self |
		self.unionBy(=)
	}

	union { :self :aCollection |
		[self, aCollection].unionBy(=)
	}

}
