/* Requires: Multiset */

IdentityMultiset : [Object, Storeable, Copyable, Equatable, Iterable, Collection, Extensible, Removable, Unordered, Multiset] { | contents |

	addWithOccurrences { :self :anObject :anInteger |
		anObject.isImmediate.ifFalse {
			'IdentityMultiset>>addWithOccurrences: non-immediate entry'.error
		};
		self.basicAddWithOccurrences(anObject, anInteger)
	}

	asIdentityMultiset { :self |
		self
	}

	asMap { :self |
		self.contents
	}

	[identityMultisetToIdentitySet, asIdentitySet] { :self |
		IdentitySet(self.contents.keys)
	}

	postCopy { :self |
		self.contents := self.contents.copy
	}

	species { :self |
		IdentityMultiset:/0
	}

}

+Void {

	IdentityMultiset {
		IdentityMultiset(
			Map()
		)
	}

}

+Map {

	IdentityMultiset { :self |
		newIdentityMultiset().initializeSlots(self)
	}

}

+List {

	[IdentityMultiset, asIdentityMultiset] { :self |
		self.isAssociationList.if {
			IdentityMultiset(Map(self))
		} {
			self.collectionToIdentityMultiset
		}
	}

}

+@Collection {

	[collectionToIdentityMultiset, asIdentityMultiset] { :self |
		let answer = IdentityMultiset();
		answer.addAll(self);
		answer
	}

}
