/* Requires: Multiset */

IdentityMultiset : [Object, Copy, Store, Equal, Iterable, Collection, Extensible, Unordered, Multiset] { | contents |

	addWithOccurrences! { :self :anObject :anInteger |
		anObject.isImmediate.ifFalse {
			'IdentityMultiset>>addWithOccurrences!: non-immediate entry'.error
		};
		self.uncheckedAddWithOccurrences(anObject, anInteger)
	}

	asIdentityMultiset { :self |
		self
	}

	[IdentitySet, identityMultisetToIdentitySet] { :self |
		IdentitySet(self.contents.keys)
	}

	[Map, identityMultisetToMap] { :self |
		self.contents
	}

	postCopy { :self |
		self.contents := self.contents.copy
	}

	species { :self |
		IdentityMultiset/0
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
		answer.addAll!(self);
		answer
	}

}
