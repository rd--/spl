/* Requires: Multiset */

IdentityMultiset : [Object, Copy, Store, Equal, Iterable, Collection, Extensible, Unordered, Multiset] {

	| valuesAndCounts |

	addWithOccurrences! { :self :anObject :anInteger |
		anObject.isImmediate.ifFalse {
			'IdentityMultiset>>addWithOccurrences!: non-immediate entry'.error
		};
		self.uncheckedAddWithOccurrences(anObject, anInteger)
	}

	IdentityMultiset { :self |
		self
	}

	[IdentitySet, identityMultisetToIdentitySet] { :self |
		IdentitySet(self.valuesAndCounts.keys)
	}

	[Map, identityMultisetToMap] { :self |
		self.valuesAndCounts
	}

	postCopy { :self |
		self.valuesAndCounts := self.valuesAndCounts.copy
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

	[IdentityMultiset, listToIdentityMultiset] { :self |
		self.isAssociationList.if {
			IdentityMultiset(Map(self))
		} {
			self.collectionToIdentityMultiset
		}
	}

}

+@Collection {

	[IdentityMultiset, collectionToIdentityMultiset] { :self |
		let answer = IdentityMultiset();
		answer.addAll!(self);
		answer
	}

}
