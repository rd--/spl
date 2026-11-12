/* Requires: BitSet String */

ResidueSet : [Object, New, Store, Equal, Do, Collection, Add, Remove] {

	| commonResidueSet modulus |

	BitSet { :self |
		BitSet(
			self.commonResidueSet,
			self.modulus
		)
	}

	[List, residueSetToList] { :self |
		self.positionVector
	}

	SortedSet { :self |
		self.commonResidueSet.copy
	}

	bitString { :self |
		self.BitSet.String
	}

	bitVector { :self |
		let positions = self.commonResidueSet;
		0.to(self.modulus).collect { :each |
			positions.includes(each).boole
		}
	}

	boxNotation { :self |
		BitSet(self).boxNotation
	}

	complement { :self |
		BitSet(self).complement.ResidueSet
	}

	do { :self :aBlock/1 |
		self.commonResidueSet.do(aBlock/1)
	}

	include! { :self :anInteger |
		self.commonResidueSet.include!(anInteger % self.modulus)
	}

	[plus, +] { :self :anInteger |
		ResidueSet(
			self.commonResidueSet + anInteger,
			self.modulus
		)
	}

	positionVector { :self |
		List(self.commonResidueSet).sort
	}

	size { :self |
		self.commonResidueSet.size
	}

	species { :self |
		{ :unused |
			ResidueSet([], self.modulus)
		}
	}

	storeString { :self |
		'ResidueSet(%, %)'.format(
			[
				self.positionVector.storeString,
				self.modulus.printString
			]
		)
	}

	[subtract, -] { :self :anInteger |
		ResidueSet(
			self.commonResidueSet - anInteger,
			self.modulus
		)
	}

	[times, *] { :self :anInteger |
		ResidueSet(
			self.commonResidueSet * anInteger,
			self.modulus
		)
	}

}

+@Integer {

	leastResidueSystem { :modulus |
		ResidueSet(
			0.to(modulus - 1),
			modulus
		)
	}

}

+@Collection {

	ResidueSet { :self :modulus |
		let r = newResidueSet().initializeSlots(SortedSet(), modulus);
		r.includeAll!(self % modulus);
		r
	}

}

+BitSet {

	ResidueSet { :self |
		ResidueSet(
			Integer(self.positionVector),
			self.capacity
		)
	}

}

+String {

	ResidueSet { :self |
		self.BitSet.ResidueSet
	}

}
