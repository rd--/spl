/* Requires: Multiset */

IdentityMultiset : [Object, New, Copy, Store, Equal, Do, Collect, Collection, Add, Remove, Unordered, Multiset] {

	| valuesAndCounts |

	IdentityMultiset { :self |
		self
	}

	[IdentitySet, identityMultisetToIdentitySet] { :self |
		IdentitySet(self.valuesAndCounts.keys)
	}

	[Map, identityMultisetToMap] { :self |
		self.valuesAndCounts
	}

	addWithOccurrences! { :self :anObject :anInteger |
		anObject.isImmediate.ifFalse {
			'IdentityMultiset>>addWithOccurrences!: non-immediate entry'.error
		};
		self.uncheckedAddWithOccurrences(anObject, anInteger)
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
