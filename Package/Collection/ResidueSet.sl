/* Requires: BitSet, String */

ResidueSet : [Object, New, Store, Equal, Do, Collect, Collection, Add, Remove] {

	| commonResidueSet modulus |

	BitSet { :self |
		BitSet(
			self.commonResidueSet,
			self.modulus
		)
	}

	IdentitySet { :self |
		self.commonResidueSet.copy
	}

	[List, residueSetToList] { :self |
		self.positionVector
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
		self.BitSet.boxNotation
	}

	complement { :self |
		self.BitSet.complement.ResidueSet
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
		self.commonResidueSet.List.sort
	}

	size { :self |
		self.commonResidueSet.size
	}

	species { :self |
		{
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
		let r = newResidueSet().initializeSlots(IdentitySet(), modulus);
		r.includeAll!(self % modulus);
		r
	}

}

+BitSet {

	ResidueSet { :self |
		ResidueSet(
			self.positionVector,
			self.capacity
		)
	}

}

+String {

	ResidueSet { :self |
		self.BitSet.ResidueSet
	}

}
