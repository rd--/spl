@Set {

	= { :self :anObject |
		anObject.isSet & {
			self.size = anObject.size & {
				self.allSatisfy { :each |
					anObject.includes(each)
				}
			}
		}
	}

	add { :self :anObject |
		self.includes(anObject).ifTrue {
			self.error('@Set>>add: includes item')
		};
		self.include(anObject)
	}

	collect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.do { :each |
			answer.include(aBlock(each))
		};
		answer
	}

	isSet { :unused |
		true
	}

	occurrencesOf { :self :anObject |
		self.includes(anObject).if {
			1
		} {
			0
		}
	}

	remove { :self :anObject |
		self.removeIfAbsent(anObject) {
			self.error('@Set>>remove: item does not exist')
		}
	}

	union { :self :aCollection |
		let answer = self.copy;
		answer.includeAll(aCollection);
		answer
	}

	without { :self :anObject |
		self.removeIfAbsent(anObject) { };
		self
	}

}

Set : [Object, Iterable, Collection, Extensible, Removable, Unordered, Set] { | contents comparator |

	asList { :self |
		self.contents.copy
	}

	basicInclude { :self :anObject |
		self.include(anObject)
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

	shallowCopy { :self |
		self.contents.shallowCopy.asSet
	}

	size { :self |
		self.contents.size
	}

	species { :self |
		Set:/0
	}

	storeString { :self |
		'Set(%)'.format([self.contents.storeString])
	}

}

+@Dictionary {

	asSet { :self |
		self.values.asSet
	}

}

+List {

	unionBy { :self :aBlock:/2 |
		let set = Set();
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

+@Collection {

	asSet { :self |
		Set(self)
	}

	Set { :self |
		let answer = Set();
		answer.includeAll(self);
		answer
	}

}

+Void {

	Set {
		newSet().initializeSlots([], =)
	}

}
