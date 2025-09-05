/* Requires: Bag */

IdentityBag : [Object, Iterable, Collection, Extensible, Removable, Unordered, Bag] { | contents |

	addWithOccurrences { :self :anObject :anInteger |
		anObject.isImmediate.ifFalse {
			'IdentityBag>>addWithOccurrences: non-immediate entry'.error
		};
		self.basicAddWithOccurrences(anObject, anInteger)
	}

	asIdentityBag { :self |
		self
	}

	asMap { :self |
		self.contents
	}

	asIdentitySet { :self |
		self.contents.indices.asIdentitySet
	}

	species { :self |
		IdentityBag:/0
	}

}

+Void {

	IdentityBag {
		IdentityBag(
			Map()
		)
	}

}

+Map {

	IdentityBag { :self |
		newIdentityBag().initializeSlots(self)
	}

}

+@Collection {

	asIdentityBag { :self |
		let answer = IdentityBag();
		answer.addAll(self);
		answer
	}

}
